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

/// This class represents a FaceTemplateDict object of the Face module.
class FaceTemplateDict {
  /// Native handle.
  late Pointer<id3FaceTemplateDict> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceTemplateDict> get handle => _handle;

  /// Creates a new instance of the FaceTemplateDict class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateDict() {
    Pointer<Pointer<id3FaceTemplateDict>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceTemplateDict_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceTemplateDict class.
  ///
  /// param handle     Handle to the FaceTemplateDict.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateDict.fromHandle(Pointer<id3FaceTemplateDict> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceTemplateDict.
  void dispose() {
    Pointer<Pointer<id3FaceTemplateDict>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceTemplateDict_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the FaceTemplateDict object.
  ///
  /// return The newly created FaceTemplateDict object.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateDict clone() {
    FaceTemplateDict clone = FaceTemplateDict();
    var err = faceSDK.id3FaceTemplateDict_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the FaceTemplateDict object.
  ///
  /// param key Unique key of the FaceTemplate item to add.
  /// param faceTemplateItem FaceTemplate item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(String key, FaceTemplate faceTemplateItem) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceTemplateDict_Add(_handle, pKey, faceTemplateItem.handle);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pKey);
    }
  }

  /// Clears the FaceTemplateDict object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FaceTemplateDict_Clear(_handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the FaceTemplateDict object.
  ///
  /// param key Unique key of the FaceTemplate item to get.
  /// return FaceTemplate item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate get(String key) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    FaceTemplate faceTemplateItem = FaceTemplate();
    try {
    	var err = faceSDK.id3FaceTemplateDict_Get(_handle, pKey, faceTemplateItem.handle);
    	if (err != FaceError.success.value) {
    		faceTemplateItem.dispose();
    		throw FaceException(err);
    	}
    	return faceTemplateItem;
    } finally {
    	calloc.free(pKey);
    }
  }

  /// Gets the number of elements in the FaceTemplateDict object.
  ///
  /// return Number of elements in the FaceTemplate object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceTemplateDict_GetCount(_handle, pCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the FaceTemplateDict object.
  ///
  /// param key Unique key of the FaceTemplate item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void remove(String key) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceTemplateDict_Remove(_handle, pKey);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pKey);
    }
  }

}
