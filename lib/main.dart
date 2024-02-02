import 'dart:io';

import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/id3/credentials.dart';
import 'package:colibri/Widget/0-splashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:id3_android_license/id3_android_license.dart';
import 'package:id3_face/id3_face.dart' as sdk;
import 'package:month_year_picker/month_year_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// adb tcpip 5555/**/
// adb connect 192.168.1.11

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await WidgetsFlutterBinding.ensureInitialized();

  String hardwareCode;
  hardwareCode = await Id3AndroidLicense.getAndroidHardwareCode();

//  DbTools.gTED = kDebugMode;

  DbTools.gID3_OK = false;
  await activateLicense(hardwareCode);

  ErrorWidget.builder = (FlutterErrorDetails details) => Container();

  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (_) {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }

  Widget _defaultHome = new SplashScreen();

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App',
    theme: ThemeData(
      primarySwatch: MaterialColor(gColors.primary.value, gColors.getSwatch(gColors.primary)),

    ),
    home: _defaultHome,
//    navigatorObservers: [MyObserver()],
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      MonthYearPickerLocalizations.delegate,
    ],
    supportedLocales: [const Locale('en'), const Locale('fr')],
  ));
}

Future<void> activateLicense(String hardwareCode) async {
  print("ID3 activateLicense");

  final licensePath = (await getTemporaryDirectory()).path + '/id3/id3license/id3license_$productReference.lic';
  final licenseFile = File(licensePath);
  try {
    // same here to check license on android we need to pass by platform channel
    if (Platform.isAndroid) {
      await Id3AndroidLicense.checkLicenseAndroid(licensePath);
    } else {
      sdk.FaceLibrary.checkLicense(licensePath);
    }
  } catch (_) {
    Uint8List? licenseBytes;
    if (serialKey != "0000-0000-0000-0000") {
      try {
        licenseBytes = sdk.License.activateSerialKeyBuffer(
          hardwareCode,
          serialKey,
          "Activated from Face capture sample",
        );
      } catch (_) {
        print("Erreur serialKey ID3 activateSerialKeyBuffer $serialKey");
        return;
      }
    }

    if (login != "login" && password != "password" && productReference != "00000000") {
      try {
        licenseBytes = sdk.License.activateBuffer(hardwareCode, login, password, productReference, "Activated from face capture sample");
      } catch (_) {
        print("Erreur login ID3 activateBuffer $login $password $productReference");
        return;
      }
    }
    if (!licenseFile.existsSync()) {
      licenseFile.createSync(recursive: true);
    }
    licenseFile.writeAsBytesSync(licenseBytes!);
    if (Platform.isAndroid) {
      await Id3AndroidLicense.checkLicenseAndroid(licensePath);
    } else {
      sdk.FaceLibrary.checkLicense(licensePath);
    }
  }

  await loadModels();
//  DbTools.gID3_OK = true;

  DbTools.gID3_OK = false;


  print("DbTools.gID3_OK ${DbTools.gID3_OK}");
  print("DbTools.gID3_OK ${DbTools.gID3_OK}");
  print("DbTools.gID3_OK ${DbTools.gID3_OK}");
  print("DbTools.gID3_OK ${DbTools.gID3_OK}");
  print("DbTools.gID3_OK ${DbTools.gID3_OK}");
}

Future<void> loadModels() async {
  final faceDetector = await rootBundle.load('assets/models/face_detector_v3b.id3nn');
  sdk.FaceLibrary.loadModelBuffer(
    faceDetector.buffer.asUint8List(),
    sdk.FaceModel.faceDetector3B,
    sdk.ProcessingUnit.cpu,
  );
  final faceEncoder = await rootBundle.load('assets/models/face_encoder_v9b.id3nn');
  sdk.FaceLibrary.loadModelBuffer(
    faceEncoder.buffer.asUint8List(),
    sdk.FaceModel.faceEncoder9B,
    sdk.ProcessingUnit.cpu,
  );
  final faceQuality = await rootBundle.load('assets/models/face_encoding_quality_estimator_v3a.id3nn');
  sdk.FaceLibrary.loadModelBuffer(
    faceQuality.buffer.asUint8List(),
    sdk.FaceModel.faceEncodingQualityEstimator3A,
    sdk.ProcessingUnit.cpu,
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyObserver extends NavigatorObserver {
  final List<String> pages = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    pages.add(route.settings.name ?? '');
    print(" ");
    print(" didPush ${pages.toString()}");
    print(" ");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute == null) return;
    final index = pages.indexWhere((element) => newRoute.settings.name == element);
    print(" didReplace ${index} ${newRoute.settings.name}");
    if (index >= 0)
      {
        pages[index] = newRoute.settings.name ?? '';
        print(" didReplace ${pages.toString()}");
      }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    pages.remove(route.settings.name ?? '');
    print(" didRemove ${pages.toString()}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    pages.remove(route.settings.name ?? '');
    print(pages.toString());
    print(" didPop ${pages.toString()}");
  }
}