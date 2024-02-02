//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a GeometricAttributes object of the Face module.
class GeometricAttributes {
  final Pointer<id3FaceGeometricAttributes> _handle;

  Pointer<id3FaceGeometricAttributes> get handle => _handle;

  id3FaceGeometricAttributes get struct => _handle.ref;

  /// Initializes a new instance of the GeometricAttributes class from its members.
  GeometricAttributes(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
