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

/// This class represents a FaceTemplateList object of the Face module.
class FaceTemplateList {
  /// Native handle.
  late Pointer<id3FaceTemplateList> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceTemplateList> get handle => _handle;

  /// Creates a new instance of the FaceTemplateList class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateList() {
    Pointer<Pointer<id3FaceTemplateList>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceTemplateList_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceTemplateList class.
  ///
  /// param handle     Handle to the FaceTemplateList.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateList.fromHandle(Pointer<id3FaceTemplateList> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceTemplateList.
  void dispose() {
    Pointer<Pointer<id3FaceTemplateList>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceTemplateList_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the FaceTemplateList object.
  ///
  /// return The newly created FaceTemplateList object.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateList clone() {
    FaceTemplateList clone = FaceTemplateList();
    var err = faceSDK.id3FaceTemplateList_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the FaceTemplateList object.
  ///
  /// param faceTemplateItem FaceTemplate item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(FaceTemplate faceTemplateItem) {
    var err = faceSDK.id3FaceTemplateList_Add(_handle, faceTemplateItem.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Clears the FaceTemplateList object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FaceTemplateList_Clear(_handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the FaceTemplateList object.
  ///
  /// param index Index of the FaceTemplate item to get.
  /// return FaceTemplate item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate get(int index) {
    FaceTemplate faceTemplateItem = FaceTemplate();
    var err = faceSDK.id3FaceTemplateList_Get(_handle, index, faceTemplateItem.handle);
    if (err != FaceError.success.value) {
    	faceTemplateItem.dispose();
    	throw FaceException(err);
    }
    return faceTemplateItem;
  }

  /// Gets the number of elements in the FaceTemplateList object.
  ///
  /// return Number of elements in the FaceTemplate object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceTemplateList_GetCount(_handle, pCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the FaceTemplateList object.
  ///
  /// param index Index of the FaceTemplate item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void removeAt(int index) {
    var err = faceSDK.id3FaceTemplateList_RemoveAt(_handle, index);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
