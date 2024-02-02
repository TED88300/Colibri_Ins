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

/// This class represents a ImageList object of the Face module.
class ImageList {
  /// Native handle.
  late Pointer<id3FaceImageList> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceImageList> get handle => _handle;

  /// Creates a new instance of the ImageList class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  ImageList() {
    Pointer<Pointer<id3FaceImageList>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceImageList_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the ImageList class.
  ///
  /// param handle     Handle to the ImageList.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageList.fromHandle(Pointer<id3FaceImageList> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this ImageList.
  void dispose() {
    Pointer<Pointer<id3FaceImageList>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceImageList_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the ImageList object.
  ///
  /// return The newly created ImageList object.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageList clone() {
    ImageList clone = ImageList();
    var err = faceSDK.id3FaceImageList_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the ImageList object.
  ///
  /// param imageItem Image item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(Image imageItem) {
    var err = faceSDK.id3FaceImageList_Add(_handle, imageItem.handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Clears the ImageList object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FaceImageList_Clear(_handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the ImageList object.
  ///
  /// param index Index of the Image item to get.
  /// return Image item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  Image get(int index) {
    Image imageItem = Image();
    var err = faceSDK.id3FaceImageList_Get(_handle, index, imageItem.handle);
    if (err != ImageError.success.value) {
    	imageItem.dispose();
    	throw FaceException(err);
    }
    return imageItem;
  }

  /// Gets the number of elements in the ImageList object.
  ///
  /// return Number of elements in the Image object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceImageList_GetCount(_handle, pCount);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the ImageList object.
  ///
  /// param index Index of the Image item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void removeAt(int index) {
    var err = faceSDK.id3FaceImageList_RemoveAt(_handle, index);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

}
