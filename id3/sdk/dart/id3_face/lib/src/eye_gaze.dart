//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a EyeGaze object of the Face module.
class EyeGaze {
  final Pointer<id3FaceEyeGaze> _handle;

  Pointer<id3FaceEyeGaze> get handle => _handle;

  id3FaceEyeGaze get struct => _handle.ref;

  /// Initializes a new instance of the EyeGaze class from its members.
  EyeGaze(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
