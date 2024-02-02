//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a Point object of the Face module.
class Point {
  final Pointer<id3FacePoint> _handle;

  Pointer<id3FacePoint> get handle => _handle;

  id3FacePoint get struct => _handle.ref;

  /// Initializes a new instance of the Point class from its members.
  Point(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
