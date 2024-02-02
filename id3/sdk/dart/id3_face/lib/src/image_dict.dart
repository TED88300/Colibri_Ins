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

/// This class represents a ImageDict object of the Face module.
class ImageDict {
  /// Native handle.
  late Pointer<id3FaceImageDict> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceImageDict> get handle => _handle;

  /// Creates a new instance of the ImageDict class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  ImageDict() {
    Pointer<Pointer<id3FaceImageDict>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceImageDict_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the ImageDict class.
  ///
  /// param handle     Handle to the ImageDict.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageDict.fromHandle(Pointer<id3FaceImageDict> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this ImageDict.
  void dispose() {
    Pointer<Pointer<id3FaceImageDict>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceImageDict_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the ImageDict object.
  ///
  /// return The newly created ImageDict object.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageDict clone() {
    ImageDict clone = ImageDict();
    var err = faceSDK.id3FaceImageDict_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the ImageDict object.
  ///
  /// param key Unique key of the Image item to add.
  /// param imageItem Image item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(String key, Image imageItem) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceImageDict_Add(_handle, pKey, imageItem.handle);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pKey);
    }
  }

  /// Clears the ImageDict object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FaceImageDict_Clear(_handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the ImageDict object.
  ///
  /// param key Unique key of the Image item to get.
  /// return Image item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  Image get(String key) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    Image imageItem = Image();
    try {
    	var err = faceSDK.id3FaceImageDict_Get(_handle, pKey, imageItem.handle);
    	if (err != ImageError.success.value) {
    		imageItem.dispose();
    		throw FaceException(err);
    	}
    	return imageItem;
    } finally {
    	calloc.free(pKey);
    }
  }

  /// Gets the number of elements in the ImageDict object.
  ///
  /// return Number of elements in the Image object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceImageDict_GetCount(_handle, pCount);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the ImageDict object.
  ///
  /// param key Unique key of the Image item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void remove(String key) {
    Pointer<Int8> pKey = key.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceImageDict_Remove(_handle, pKey);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pKey);
    }
  }

}
