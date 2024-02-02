import 'package:flutter/services.dart';

const String packageName = "com.kmtvision.pfo_enrolment_test";

class IntentChannel {
  static const String name = "$packageName/intent_result";
  static const MethodChannel _channel = MethodChannel(name);

  static MethodChannel get getMethodChannel {
    return _channel;
  }

  static Future<Map<dynamic, dynamic>?> startEnrol() async {
    print("startEnrol");
    return await _channel.invokeMethod('startEnrol');
  }

  static Future<Map<dynamic, dynamic>?> startMRZ() async {
    print("startMRZ");
    return await _channel.invokeMethod('startMRZ');
  }

  static Future<List<dynamic>?> getLocation() async {
    print("IntentChannel getLocation");
    try {
      return await _channel.invokeMethod('getLocation');
    } catch (_) {
      return [];
    }



  }


  static Future PrinterON() async {

    return await _channel.invokeMethod('EditionON');

  }

  static Future PrinterOFF() async {

    return await _channel.invokeMethod('EditionOFF');

  }



    static Future<List<dynamic>?> Print(String aTxt, String Size, String Align, String Density) async {



    print("IntentChannel Edition");
    try {
      return await _channel.invokeMethod('Edition',{"PrintText":aTxt,"Size":Size,"Align":Align,"Fmt":Density});
    } catch (_) {
      print("IntentChannel Edition failed");
      return [];
    }



  }


}