//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a FaceOcclusionScores object of the Face module.
class FaceOcclusionScores {
  final Pointer<id3FaceOcclusionScores> _handle;

  Pointer<id3FaceOcclusionScores> get handle => _handle;

  id3FaceOcclusionScores get struct => _handle.ref;

  /// Initializes a new instance of the FaceOcclusionScores class from its members.
  FaceOcclusionScores(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
