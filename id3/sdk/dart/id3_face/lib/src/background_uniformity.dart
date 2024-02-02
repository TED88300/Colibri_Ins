//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a BackgroundUniformity object of the Face module.
class BackgroundUniformity {
  final Pointer<id3FaceBackgroundUniformity> _handle;

  Pointer<id3FaceBackgroundUniformity> get handle => _handle;

  id3FaceBackgroundUniformity get struct => _handle.ref;

  /// Initializes a new instance of the BackgroundUniformity class from its members.
  BackgroundUniformity(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
