//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a GlassesAttributes object of the Face module.
class GlassesAttributes {
  final Pointer<id3FaceGlassesAttributes> _handle;

  Pointer<id3FaceGlassesAttributes> get handle => _handle;

  id3FaceGlassesAttributes get struct => _handle.ref;

  /// Initializes a new instance of the GlassesAttributes class from its members.
  GlassesAttributes(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
