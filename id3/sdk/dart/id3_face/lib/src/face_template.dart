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

/// This class represents a FaceTemplate object of the Face module.
class FaceTemplate {
  /// Native handle.
  late Pointer<id3FaceTemplate> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceTemplate> get handle => _handle;

  /// Creates a new instance of the FaceTemplate class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate() {
    Pointer<Pointer<id3FaceTemplate>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceTemplate_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceTemplate class.
  ///
  /// param handle     Handle to the FaceTemplate.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate.fromHandle(Pointer<id3FaceTemplate> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceTemplate.
  void dispose() {
    Pointer<Pointer<id3FaceTemplate>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceTemplate_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the FaceTemplate object.
  ///
  /// return The newly created FaceTemplate object.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate clone() {
    FaceTemplate clone = FaceTemplate();
    var err = faceSDK.id3FaceTemplate_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Gets the format of the face template.
  ///
  /// return Format of the face template.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplateFormat getFormat() {
    Pointer<Int32> pFormat = calloc();
    try {
    	var err = faceSDK.id3FaceTemplate_GetFormat(_handle, pFormat);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = FaceTemplateFormatX.fromValue(pFormat.value);
    	return value;
    } finally {
    	calloc.free(pFormat);
    }
  }

  /// Imports the face template object from a buffer.
  ///
  /// param data Buffer to import the face template object from.
  /// return Created face template.
  /// throws FaceException An error has occurred during Face Library execution.
  static FaceTemplate fromBuffer(Uint8List data) {
    FaceTemplate faceTemplate = FaceTemplate();
    Pointer<Uint8> pData = calloc.allocate<Uint8>(data.length);
    Uint8List dataBytes = pData.asTypedList(data.length);
    dataBytes.setAll(0, data);
    try {
    	var err = faceSDK.id3FaceTemplate_FromBuffer(faceTemplate.handle, pData, data.length);
    	if (err != FaceError.success.value) {
    		faceTemplate.dispose();
    		throw FaceException(err);
    	}
    	return faceTemplate;
    } finally {
    	calloc.free(pData);
    }
  }

  /// Imports the face template object from a file.
  ///
  /// param path Path to the file to import the face template object from.
  /// return Created face template.
  /// throws FaceException An error has occurred during Face Library execution.
  static FaceTemplate fromFile(String path) {
    FaceTemplate faceTemplate = FaceTemplate();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceTemplate_FromFile(faceTemplate.handle, pPath);
    	if (err != FaceError.success.value) {
    		faceTemplate.dispose();
    		throw FaceException(err);
    	}
    	return faceTemplate;
    } finally {
    	calloc.free(pPath);
    }
  }

  /// Exports the face template object to a file.
  ///
  /// param templateBufferType Face template buffer type to export the face template object to.
  /// param path Path to the file to export the face template object to.
  /// throws FaceException An error has occurred during Face Library execution.
  void save(FaceTemplateBufferType templateBufferType, String path) {
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceTemplate_Save(_handle, templateBufferType.value, pPath);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pPath);
    }
  }

  /// Exports the face template object to a Biometric Data Template (BDT) buffer. This buffer can only be used with id3 Face Match on Card specific implementations to verify a face template.
  ///
  /// return Buffer to export the BDT buffer to.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List toBdt() {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceTemplate_ToBdt(_handle, pData, pDataSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceTemplate_ToBdt(_handle, pData, pDataSize);
    	}
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pData.asTypedList(pDataSize.value));
    	return value;
    } finally {
    	calloc.free(pData);
    	calloc.free(pDataSize);
    }
  }

  /// Exports the face template object to a Biometric Information Template (BIT) buffer. This buffer can only be used with id3 Face Match on Card specific implementations to enroll a face template. Threshold value is required and should be set according to the used Face Encoder and desired security level. Threshold values are specific and can be found in the id3 Face Match-On-Card documentation. Reference data qualifier should be set according to the id3 Face Match-On-Card documentation.
  ///
  /// param threshold Matching threshold for this BIT buffer.
  /// param referenceDataQualifier Reference data qualifier.
  /// return Buffer to export the BIT buffer to.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List toBit(int threshold, int referenceDataQualifier) {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceTemplate_ToBit(_handle, threshold, referenceDataQualifier, pData, pDataSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceTemplate_ToBit(_handle, threshold, referenceDataQualifier, pData, pDataSize);
    	}
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pData.asTypedList(pDataSize.value));
    	return value;
    } finally {
    	calloc.free(pData);
    	calloc.free(pDataSize);
    }
  }

  /// Exports the face template object to a buffer.
  ///
  /// param templateBufferType Face template buffer type to export the face template object to.
  /// return Buffer to export the face template object to.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List toBuffer(FaceTemplateBufferType templateBufferType) {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceTemplate_ToBuffer(_handle, templateBufferType.value, pData, pDataSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceTemplate_ToBuffer(_handle, templateBufferType.value, pData, pDataSize);
    	}
    	if (err != FaceError.success.value) {
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
