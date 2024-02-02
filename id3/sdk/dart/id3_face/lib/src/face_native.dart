import 'dart:ffi';
import 'dart:io';
import 'face_sdk_generated_bindings.dart';

const libName = 'id3Face';
final dylib = DynamicLibrary.open(Platform.isWindows
    ? '$libName.dll'
    : Platform.isIOS || Platform.isMacOS
        ? '$libName.framework/$libName'
        : 'lib$libName.so');

final faceSDK = FaceSDK(dylib);
