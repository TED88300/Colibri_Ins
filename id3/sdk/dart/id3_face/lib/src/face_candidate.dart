//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
// ignore_for_file: unused_import

import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';
import 'face_native.dart';

import '../id3_face.dart';

/// This class represents a FaceCandidate object of the Face module.
class FaceCandidate {
  /// Native handle.
  late Pointer<id3FaceCandidate> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceCandidate> get handle => _handle;

  /// Creates a new instance of the FaceCandidate class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidate() {
    Pointer<Pointer<id3FaceCandidate>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceCandidate_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceCandidate class.
  ///
  /// param handle     Handle to the FaceCandidate.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidate.fromHandle(Pointer<id3FaceCandidate> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceCandidate.
  void dispose() {
    Pointer<Pointer<id3FaceCandidate>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceCandidate_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the FaceCandidate object.
  ///
  /// return The newly created FaceCandidate object.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidate clone() {
    FaceCandidate clone = FaceCandidate();
    var err = faceSDK.id3FaceCandidate_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Gets the ID of the most similar face template as defined in the reference face template list used to perform the search.
  ///
  /// return ID of the most similar face template as defined in the reference face template list used to perform the search.
  /// throws FaceException An error has occurred during Face Library execution.
  String getId() {
    Pointer<Int8> pId= nullptr;
    Pointer<Int32> pIdSize = calloc();
    try {
    	var err = faceSDK.id3FaceCandidate_GetId(_handle, pId, pIdSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pId = calloc.allocate(pIdSize.value);
    		err = faceSDK.id3FaceCandidate_GetId(_handle, pId, pIdSize);
    		if (err != FaceError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pId.asTypedList(pIdSize.value));
    	return value;
    } finally {
    	calloc.free(pId);
    	calloc.free(pIdSize);
    }
  }

  /// Gets the match score between the face probe template and the most similar one in the reference face template list used to perform the search.
  ///
  /// return Match score between the face probe template and the most similar one in the reference face template list used to perform the search.
  /// throws FaceException An error has occurred during Face Library execution.
  int getScore() {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FaceCandidate_GetScore(_handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

}
