//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a DetectedFaceAttackSupport object of the Face module.
class DetectedFaceAttackSupport {
  final Pointer<id3DetectedFaceAttackSupport> _handle;

  Pointer<id3DetectedFaceAttackSupport> get handle => _handle;

  id3DetectedFaceAttackSupport get struct => _handle.ref;

  /// Initializes a new instance of the DetectedFaceAttackSupport class from its members.
  DetectedFaceAttackSupport(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
