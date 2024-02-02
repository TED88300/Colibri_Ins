//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a PhotographicAttributes object of the Face module.
class PhotographicAttributes {
  final Pointer<id3FacePhotographicAttributes> _handle;

  Pointer<id3FacePhotographicAttributes> get handle => _handle;

  id3FacePhotographicAttributes get struct => _handle.ref;

  /// Initializes a new instance of the PhotographicAttributes class from its members.
  PhotographicAttributes(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
