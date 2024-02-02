//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';

/// This class represents a FacePose object of the Face module.
class FacePose {
  final Pointer<id3FacePose> _handle;

  Pointer<id3FacePose> get handle => _handle;

  id3FacePose get struct => _handle.ref;

  /// Initializes a new instance of the FacePose class from its members.
  FacePose(this._handle);

  void dispose() {
    calloc.free(_handle);
  }
}
