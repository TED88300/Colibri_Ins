//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a FaceAttributes object of the Face module.
class FaceAttributes {
  final Pointer<id3FaceAttributes> _handle;

  Pointer<id3FaceAttributes> get handle => _handle;

  id3FaceAttributes get struct => _handle.ref;

  /// Initializes a new instance of the FaceAttributes class from its members.
  FaceAttributes(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
