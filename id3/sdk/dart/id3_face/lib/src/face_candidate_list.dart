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

/// This class represents a FaceCandidateList object of the Face module.
class FaceCandidateList {
  /// Native handle.
  late Pointer<id3FaceCandidateList> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceCandidateList> get handle => _handle;

  /// Creates a new instance of the FaceCandidateList class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidateList() {
    Pointer<Pointer<id3FaceCandidateList>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceCandidateList_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceCandidateList class.
  ///
  /// param handle     Handle to the FaceCandidateList.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidateList.fromHandle(Pointer<id3FaceCandidateList> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceCandidateList.
  void dispose() {
    Pointer<Pointer<id3FaceCandidateList>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceCandidateList_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the FaceCandidateList object.
  ///
  /// return The newly created FaceCandidateList object.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidateList clone() {
    FaceCandidateList clone = FaceCandidateList();
    var err = faceSDK.id3FaceCandidateList_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the FaceCandidateList object.
  ///
  /// param faceCandidateItem FaceCandidate item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(FaceCandidate faceCandidateItem) {
    var err = faceSDK.id3FaceCandidateList_Add(_handle, faceCandidateItem.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Clears the FaceCandidateList object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FaceCandidateList_Clear(_handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the FaceCandidateList object.
  ///
  /// param index Index of the FaceCandidate item to get.
  /// return FaceCandidate item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceCandidate get(int index) {
    FaceCandidate faceCandidateItem = FaceCandidate();
    var err = faceSDK.id3FaceCandidateList_Get(_handle, index, faceCandidateItem.handle);
    if (err != FaceError.success.value) {
    	faceCandidateItem.dispose();
    	throw FaceException(err);
    }
    return faceCandidateItem;
  }

  /// Gets the number of elements in the FaceCandidateList object.
  ///
  /// return Number of elements in the FaceCandidate object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceCandidateList_GetCount(_handle, pCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the FaceCandidateList object.
  ///
  /// param index Index of the FaceCandidate item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void removeAt(int index) {
    var err = faceSDK.id3FaceCandidateList_RemoveAt(_handle, index);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
