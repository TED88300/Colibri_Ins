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

/// This class represents a PointList object of the Face module.
class PointList {
  /// Native handle.
  late Pointer<id3FacePointList> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FacePointList> get handle => _handle;

  /// Creates a new instance of the PointList class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  PointList() {
    Pointer<Pointer<id3FacePointList>> pHandle = calloc();
    try {
      var err = faceSDK.id3FacePointList_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the PointList class.
  ///
  /// param handle     Handle to the PointList.
  /// throws FaceException An error has occurred during Face Library execution.
  PointList.fromHandle(Pointer<id3FacePointList> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this PointList.
  void dispose() {
    Pointer<Pointer<id3FacePointList>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FacePointList_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the PointList object.
  ///
  /// return The newly created PointList object.
  /// throws FaceException An error has occurred during Face Library execution.
  PointList clone() {
    PointList clone = PointList();
    var err = faceSDK.id3FacePointList_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the PointList object.
  ///
  /// param pointItem Point item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(Point pointItem) {
    var err = faceSDK.id3FacePointList_Add(_handle, pointItem.struct);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Clears the PointList object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3FacePointList_Clear(_handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the PointList object.
  ///
  /// param index Index of the Point item to get.
  /// return Point item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  Point get(int index) {
    Pointer<id3FacePoint> pPointItem = calloc();
    var err = faceSDK.id3FacePointList_Get(_handle, index, pPointItem);
    if (err != ImageError.success.value) {
    	calloc.free(pPointItem);
    	throw FaceException(err);
    }
    return Point(pPointItem);
  }

  /// Gets the number of elements in the PointList object.
  ///
  /// return Number of elements in the Point object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FacePointList_GetCount(_handle, pCount);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the PointList object.
  ///
  /// param index Index of the Point item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void removeAt(int index) {
    var err = faceSDK.id3FacePointList_RemoveAt(_handle, index);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

}
