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

/// This class represents a FaceDetector object of the Face module.
class FaceDetector {
  /// Native handle.
  late Pointer<id3FaceDetector> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceDetector> get handle => _handle;

  /// Creates a new instance of the FaceDetector class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceDetector() {
    Pointer<Pointer<id3FaceDetector>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceDetector_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceDetector class.
  ///
  /// param handle     Handle to the FaceDetector.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceDetector.fromHandle(Pointer<id3FaceDetector> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceDetector.
  void dispose() {
    Pointer<Pointer<id3FaceDetector>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceDetector_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Public methods
  /// Gets the confidence threshold. Default value is 70. Range is (0;100). Setting a high threshold reduces false detection but can increase the number of undetected faces.
  ///
  /// return Confidence threshold. Default value is 70. Range is (0;100). Setting a high threshold reduces false detection but can increase the number of undetected faces.
  /// throws FaceException An error has occurred during Face Library execution.
  int getConfidenceThreshold() {
    Pointer<Int32> pConfidenceThreshold = calloc();
    try {
    	var err = faceSDK.id3FaceDetector_GetConfidenceThreshold(_handle, pConfidenceThreshold);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pConfidenceThreshold.value;
    	return value;
    } finally {
    	calloc.free(pConfidenceThreshold);
    }
  }

  /// Sets the confidence threshold. Default value is 70. Range is (0;100). Setting a high threshold reduces false detection but can increase the number of undetected faces.
  ///
  /// param confidenceThreshold Confidence threshold. Default value is 70. Range is (0;100). Setting a high threshold reduces false detection but can increase the number of undetected faces.
  /// throws FaceException An error has occurred during Face Library execution.
  void setConfidenceThreshold(int confidenceThreshold) {
    var err = faceSDK.id3FaceDetector_SetConfidenceThreshold(_handle, confidenceThreshold);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  ///
  /// return Model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceModel getModel() {
    Pointer<Int32> pModel = calloc();
    try {
    	var err = faceSDK.id3FaceDetector_GetModel(_handle, pModel);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = FaceModelX.fromValue(pModel.value);
    	return value;
    } finally {
    	calloc.free(pModel);
    }
  }

  /// Sets the model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  ///
  /// param model Model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
  /// throws FaceException An error has occurred during Face Library execution.
  void setModel(FaceModel model) {
    var err = faceSDK.id3FaceDetector_SetModel(_handle, model.value);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is (0;100). Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
  ///
  /// return Non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is (0;100). Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
  /// throws FaceException An error has occurred during Face Library execution.
  int getNmsIouThreshold() {
    Pointer<Int32> pNmsIouThreshold = calloc();
    try {
    	var err = faceSDK.id3FaceDetector_GetNmsIouThreshold(_handle, pNmsIouThreshold);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pNmsIouThreshold.value;
    	return value;
    } finally {
    	calloc.free(pNmsIouThreshold);
    }
  }

  /// Sets the non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is (0;100). Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
  ///
  /// param nmsIouThreshold Non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is (0;100). Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
  /// throws FaceException An error has occurred during Face Library execution.
  void setNmsIouThreshold(int nmsIouThreshold) {
    var err = faceSDK.id3FaceDetector_SetNmsIouThreshold(_handle, nmsIouThreshold);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the processing unit where to run the detection process. Default value is CPU.
  ///
  /// return Processing unit where to run the detection process. Default value is CPU.
  /// throws FaceException An error has occurred during Face Library execution.
  ProcessingUnit getProcessingUnit() {
    Pointer<Int32> pProcessingUnit = calloc();
    try {
    	var err = faceSDK.id3FaceDetector_GetProcessingUnit(_handle, pProcessingUnit);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = ProcessingUnitX.fromValue(pProcessingUnit.value);
    	return value;
    } finally {
    	calloc.free(pProcessingUnit);
    }
  }

  /// Sets the processing unit where to run the detection process. Default value is CPU.
  ///
  /// param processingUnit Processing unit where to run the detection process. Default value is CPU.
  /// throws FaceException An error has occurred during Face Library execution.
  void setProcessingUnit(ProcessingUnit processingUnit) {
    var err = faceSDK.id3FaceDetector_SetProcessingUnit(_handle, processingUnit.value);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  ///
  /// return Number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  /// throws FaceException An error has occurred during Face Library execution.
  int getThreadCount() {
    Pointer<Int32> pThreadCount = calloc();
    try {
    	var err = faceSDK.id3FaceDetector_GetThreadCount(_handle, pThreadCount);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pThreadCount.value;
    	return value;
    } finally {
    	calloc.free(pThreadCount);
    }
  }

  /// Sets the number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  ///
  /// param threadCount Number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
  /// throws FaceException An error has occurred during Face Library execution.
  void setThreadCount(int threadCount) {
    var err = faceSDK.id3FaceDetector_SetThreadCount(_handle, threadCount);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Detects faces in an image and store their info in a DetectedFaceList object. The algorithm searches for faces in the range (16px;512px). If the image is too large to fit this range, one must resize it before the detection process.
  ///
  /// param image Source image to process.
  /// return List of detected faces.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFaceList detectFaces(Image image) {
    DetectedFaceList detectedFaceList = DetectedFaceList();
    var err = faceSDK.id3FaceDetector_DetectFaces(_handle, image.handle, detectedFaceList.handle);
    if (err != FaceError.success.value) {
      detectedFaceList.dispose();
    	throw FaceException(err);
    }
    return detectedFaceList;
  }

  /// Loads the set parameters. This function is optional, if not called the loading of the parameters will occur during the first call to DetectFaces() or TrackFaces().
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void loadParameters() {
    var err = faceSDK.id3FaceDetector_LoadParameters(_handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Tracks faces in an image and update their info in a DetectedFaceList object. The algorithm searches for faces in the range (16px;512px). If the image is too large to fit this range, one must resize it before the detection process. In a realtime process, one must use this function instead of &quot;detect&quot; to keep the face IDs stable in time.
  ///
  /// param image Source image to process.
  /// param detectedFaceList List of detected faces.
  /// throws FaceException An error has occurred during Face Library execution.
  void trackFaces(Image image, DetectedFaceList detectedFaceList) {
    var err = faceSDK.id3FaceDetector_TrackFaces(_handle, image.handle, detectedFaceList.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
