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

/// This class represents a FaceEncoder object of the Face module.
class FaceEncoder {
  /// Native handle.
  late Pointer<id3FaceEncoder> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceEncoder> get handle => _handle;

  /// Creates a new instance of the FaceEncoder class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceEncoder() {
    Pointer<Pointer<id3FaceEncoder>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceEncoder_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceEncoder class.
  ///
  /// param handle     Handle to the FaceEncoder.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceEncoder.fromHandle(Pointer<id3FaceEncoder> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceEncoder.
  void dispose() {
    Pointer<Pointer<id3FaceEncoder>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceEncoder_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Public methods
  /// Gets the model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  ///
  /// return Model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceModel getModel() {
    Pointer<Int32> pModel = calloc();
    try {
    	var err = faceSDK.id3FaceEncoder_GetModel(_handle, pModel);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = FaceModelX.fromValue(pModel.value);
    	return value;
    } finally {
    	calloc.free(pModel);
    }
  }

  /// Sets the model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  ///
  /// param model Model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  /// throws FaceException An error has occurred during Face Library execution.
  void setModel(FaceModel model) {
    var err = faceSDK.id3FaceEncoder_SetModel(_handle, model.value);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the processing unit where to run the encoding process. Default value is CPU.
  ///
  /// return Processing unit where to run the encoding process. Default value is CPU.
  /// throws FaceException An error has occurred during Face Library execution.
  ProcessingUnit getProcessingUnit() {
    Pointer<Int32> pProcessingUnit = calloc();
    try {
    	var err = faceSDK.id3FaceEncoder_GetProcessingUnit(_handle, pProcessingUnit);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = ProcessingUnitX.fromValue(pProcessingUnit.value);
    	return value;
    } finally {
    	calloc.free(pProcessingUnit);
    }
  }

  /// Sets the processing unit where to run the encoding process. Default value is CPU.
  ///
  /// param processingUnit Processing unit where to run the encoding process. Default value is CPU.
  /// throws FaceException An error has occurred during Face Library execution.
  void setProcessingUnit(ProcessingUnit processingUnit) {
    var err = faceSDK.id3FaceEncoder_SetProcessingUnit(_handle, processingUnit.value);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  ///
  /// return Number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  /// throws FaceException An error has occurred during Face Library execution.
  int getThreadCount() {
    Pointer<Int32> pThreadCount = calloc();
    try {
    	var err = faceSDK.id3FaceEncoder_GetThreadCount(_handle, pThreadCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pThreadCount.value;
    	return value;
    } finally {
    	calloc.free(pThreadCount);
    }
  }

  /// Sets the number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  ///
  /// param threadCount Number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  /// throws FaceException An error has occurred during Face Library execution.
  void setThreadCount(int threadCount) {
    var err = faceSDK.id3FaceEncoder_SetThreadCount(_handle, threadCount);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Computes the quality of a detected face. Here, quality expresses the match capability of an image: a high quality image will generate less match errors (false acceptance or false rejection) than a low quality one.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated quality of the detected face. Range is (0:100).
  /// throws FaceException An error has occurred during Face Library execution.
  int computeQuality(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pQuality = calloc();
    try {
    	var err = faceSDK.id3FaceEncoder_ComputeQuality(_handle, image.handle, detectedFace.handle, pQuality);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pQuality.value;
    	return value;
    } finally {
    	calloc.free(pQuality);
    }
  }

  /// Extracts the unique features of a detected face and store them in a FaceTemplate.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Generated face template.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceTemplate createTemplate(Image image, DetectedFace detectedFace) {
    FaceTemplate faceTemplate = FaceTemplate();
    var err = faceSDK.id3FaceEncoder_CreateTemplate(_handle, image.handle, detectedFace.handle, faceTemplate.handle);
    if (err != FaceError.success.value) {
    	faceTemplate.dispose();
    	throw FaceException(err);
    }
    return faceTemplate;
  }

}
