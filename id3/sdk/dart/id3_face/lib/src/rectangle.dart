//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a Rectangle object of the Face module.
class Rectangle {
  final Pointer<id3FaceRectangle> _handle;

  Pointer<id3FaceRectangle> get handle => _handle;

  id3FaceRectangle get struct => _handle.ref;

  /// Initializes a new instance of the Rectangle class from its members.
  Rectangle(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
