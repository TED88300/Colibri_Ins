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

/// This class represents a ImageBuffer object of the Face module.
class ImageBuffer {
  /// Native handle.
  late Pointer<id3FaceImageBuffer> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceImageBuffer> get handle => _handle;

  /// Creates a new instance of the ImageBuffer class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  ImageBuffer() {
    Pointer<Pointer<id3FaceImageBuffer>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceImageBuffer_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the ImageBuffer class.
  ///
  /// param handle     Handle to the ImageBuffer.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageBuffer.fromHandle(Pointer<id3FaceImageBuffer> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this ImageBuffer.
  void dispose() {
    Pointer<Pointer<id3FaceImageBuffer>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceImageBuffer_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the ImageBuffer object.
  ///
  /// return The newly created ImageBuffer object.
  /// throws FaceException An error has occurred during Face Library execution.
  ImageBuffer clone() {
    ImageBuffer clone = ImageBuffer();
    var err = faceSDK.id3FaceImageBuffer_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Gets the image buffer data.
  ///
  /// return Data of the image buffer object.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List getData() {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceImageBuffer_GetData(_handle, pData, pDataSize);
    	if (err == ImageError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceImageBuffer_GetData(_handle, pData, pDataSize);
    	}
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pData.asTypedList(pDataSize.value));
    	return value;
    } finally {
    	calloc.free(pData);
    	calloc.free(pDataSize);
    }
  }

}
