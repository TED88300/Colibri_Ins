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

/// This class represents a DetectedFaceList object of the Face module.
class DetectedFaceList {
  /// Native handle.
  late Pointer<id3DetectedFaceList> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3DetectedFaceList> get handle => _handle;

  /// Creates a new instance of the DetectedFaceList class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFaceList() {
    Pointer<Pointer<id3DetectedFaceList>> pHandle = calloc();
    try {
      var err = faceSDK.id3DetectedFaceList_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the DetectedFaceList class.
  ///
  /// param handle     Handle to the DetectedFaceList.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFaceList.fromHandle(Pointer<id3DetectedFaceList> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this DetectedFaceList.
  void dispose() {
    Pointer<Pointer<id3DetectedFaceList>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3DetectedFaceList_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the DetectedFaceList object.
  ///
  /// return The newly created DetectedFaceList object.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFaceList clone() {
    DetectedFaceList clone = DetectedFaceList();
    var err = faceSDK.id3DetectedFaceList_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Adds an item to the DetectedFaceList object.
  ///
  /// param detectedFaceItem DetectedFace item to add.
  /// throws FaceException An error has occurred during Face Library execution.
  void add(DetectedFace detectedFaceItem) {
    var err = faceSDK.id3DetectedFaceList_Add(_handle, detectedFaceItem.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Clears the DetectedFaceList object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void clear() {
    var err = faceSDK.id3DetectedFaceList_Clear(_handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets an item of the DetectedFaceList object.
  ///
  /// param index Index of the DetectedFace item to get.
  /// return DetectedFace item to get.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace get(int index) {
    DetectedFace detectedFaceItem = DetectedFace();
    var err = faceSDK.id3DetectedFaceList_Get(_handle, index, detectedFaceItem.handle);
    if (err != FaceError.success.value) {
    	detectedFaceItem.dispose();
    	throw FaceException(err);
    }
    return detectedFaceItem;
  }

  /// Gets the number of elements in the DetectedFaceList object.
  ///
  /// return Number of elements in the DetectedFace object.
  /// throws FaceException An error has occurred during Face Library execution.
  int getCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3DetectedFaceList_GetCount(_handle, pCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Removes an element of the DetectedFaceList object.
  ///
  /// param index Index of the DetectedFace item to remove.
  /// throws FaceException An error has occurred during Face Library execution.
  void removeAt(int index) {
    var err = faceSDK.id3DetectedFaceList_RemoveAt(_handle, index);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Finds a detected face by ID.
  ///
  /// param id ID of the detected face to find in the list.
  /// return Found detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace findDetectedFace(int id) {
    DetectedFace detectedFace = DetectedFace();
    var err = faceSDK.id3DetectedFaceList_FindDetectedFace(_handle, id, detectedFace.handle);
    if (err != FaceError.success.value) {
    	detectedFace.dispose();
    	throw FaceException(err);
    }
    return detectedFace;
  }

  /// Gets the list of IDs in the list.
  ///
  /// return List of IDs in the list.
  /// throws FaceException An error has occurred during Face Library execution.
  List<int> getIdList() {
    Pointer<Int32> pIds = nullptr;
    Pointer<Int32> pIdsSize = calloc();
    try {
    	var err = faceSDK.id3DetectedFaceList_GetIdList(_handle, pIds, pIdsSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pIds = calloc.allocate(pIdsSize.value);
    		err = faceSDK.id3DetectedFaceList_GetIdList(_handle, pIds, pIdsSize);
    	}
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pIds.asTypedList(pIdsSize.value));
    	return value;
    } finally {
    	calloc.free(pIds);
    	calloc.free(pIdsSize);
    }
  }

  /// Gets the largest face in the list.
  ///
  /// return Largest detected face in the list.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace getLargestFace() {
    DetectedFace largestFace = DetectedFace();
    var err = faceSDK.id3DetectedFaceList_GetLargestFace(_handle, largestFace.handle);
    if (err != FaceError.success.value) {
    	largestFace.dispose();
    	throw FaceException(err);
    }
    return largestFace;
  }

  /// Rescales all detected faces in the list.
  ///
  /// param scale Scale factor to apply. Range is (0;+inf(.
  /// throws FaceException An error has occurred during Face Library execution.
  void rescaleAll(double scale) {
    var err = faceSDK.id3DetectedFaceList_RescaleAll(_handle, scale);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
