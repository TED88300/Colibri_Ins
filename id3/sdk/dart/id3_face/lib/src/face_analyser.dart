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

/// This class represents a FaceAnalyser object of the Face module.
class FaceAnalyser {
  /// Native handle.
  late Pointer<id3FaceAnalyser> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceAnalyser> get handle => _handle;

  /// Creates a new instance of the FaceAnalyser class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceAnalyser() {
    Pointer<Pointer<id3FaceAnalyser>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceAnalyser_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceAnalyser class.
  ///
  /// param handle     Handle to the FaceAnalyser.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceAnalyser.fromHandle(Pointer<id3FaceAnalyser> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceAnalyser.
  void dispose() {
    Pointer<Pointer<id3FaceAnalyser>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceAnalyser_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Public methods
  /// Gets the sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
  ///
  /// return Sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  int getExpressionSensibility() {
    Pointer<Int32> pExpressionSensibility = calloc();
    try {
    	var err = faceSDK.id3FaceAnalyser_GetExpressionSensibility(_handle, pExpressionSensibility);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pExpressionSensibility.value;
    	return value;
    } finally {
    	calloc.free(pExpressionSensibility);
    }
  }

  /// Sets the sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
  ///
  /// param expressionSensibility Sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  void setExpressionSensibility(int expressionSensibility) {
    var err = faceSDK.id3FaceAnalyser_SetExpressionSensibility(_handle, expressionSensibility);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Computes the age of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated age of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  int computeAge(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pAge = calloc();
    try {
    	var err = faceSDK.id3FaceAnalyser_ComputeAge(_handle, image.handle, detectedFace.handle, pAge);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pAge.value;
    	return value;
    } finally {
    	calloc.free(pAge);
    }
  }

  /// Computes the attributes of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated attributes of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceAttributes computeAttributes(Image image, DetectedFace detectedFace) {
    Pointer<id3FaceAttributes> pAttributes = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputeAttributes(_handle, image.handle, detectedFace.handle, pAttributes);
    if (err != FaceError.success.value) {
    	calloc.free(pAttributes);
    	throw FaceException(err);
    }
    return FaceAttributes(pAttributes);
  }

  /// Computes the background uniformity behind a detected face. This function must be used for a portrait image with only one face in it. A high uniformity score means that the background is uniform.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated background uniformity. Both color and texture scores are in the range (0:100). The minimum recommended thresholds are respectively 80 for color and 80 for texture.
  /// throws FaceException An error has occurred during Face Library execution.
  BackgroundUniformity computeBackgroundUniformity(Image image, DetectedFace detectedFace) {
    Pointer<id3FaceBackgroundUniformity> pBackgroundUniformity = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputeBackgroundUniformity(_handle, image.handle, detectedFace.handle, pBackgroundUniformity);
    if (err != FaceError.success.value) {
    	calloc.free(pBackgroundUniformity);
    	throw FaceException(err);
    }
    return BackgroundUniformity(pBackgroundUniformity);
  }

  /// Computes the expression of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated expression of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceExpression computeExpression(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pExpression = calloc();
    try {
    	var err = faceSDK.id3FaceAnalyser_ComputeExpression(_handle, image.handle, detectedFace.handle, pExpression);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = FaceExpressionX.fromValue(pExpression.value);
    	return value;
    } finally {
    	calloc.free(pExpression);
    }
  }

  /// Computes the eye gaze of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated gaze of left and right eyes of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  EyeGaze computeEyeGaze(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<id3FaceEyeGaze> pEyeGaze = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputeEyeGaze(_handle, image.handle, detectedFace.handle, landmarks.handle, pEyeGaze);
    if (err != FaceError.success.value) {
    	calloc.free(pEyeGaze);
    	throw FaceException(err);
    }
    return EyeGaze(pEyeGaze);
  }

  /// Computes the eye openness of a detected face. The minimum recommanded value for is 90.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated openness scores of left and right eyes of the detected face in this order.
  /// throws FaceException An error has occurred during Face Library execution.
  List<int> computeEyeOpenness(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<Int32> pEyeOpennessScores = calloc.allocate(2);
    Pointer<Int32> pEyeOpennessScoresSize = calloc.allocate(1);
    pEyeOpennessScoresSize[0] = 2;
    try {
    	var err = faceSDK.id3FaceAnalyser_ComputeEyeOpenness(_handle, image.handle, detectedFace.handle, landmarks.handle, pEyeOpennessScores, pEyeOpennessScoresSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pEyeOpennessScores = calloc.allocate(pEyeOpennessScoresSize.value);
    		err = faceSDK.id3FaceAnalyser_ComputeEyeOpenness(_handle, image.handle, detectedFace.handle, landmarks.handle, pEyeOpennessScores, pEyeOpennessScoresSize);
    	}
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pEyeOpennessScores.asTypedList(pEyeOpennessScoresSize.value));
    	return value;
    } finally {
    	calloc.free(pEyeOpennessScores);
    	calloc.free(pEyeOpennessScoresSize);
    }
  }

  /// Computes the eye redness of a detected face. The maximum recommanded value for an ICAO-compliant portrait is 10.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated redness scores of left and right eyes of the detected face in this order.
  /// throws FaceException An error has occurred during Face Library execution.
  List<int> computeEyeRedness(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<Int32> pEyeRednessScores = calloc.allocate(2);
    Pointer<Int32> pEyeRednessScoresSize = calloc.allocate(1);
    pEyeRednessScoresSize[0] = 2;
    try {
    	var err = faceSDK.id3FaceAnalyser_ComputeEyeRedness(_handle, image.handle, detectedFace.handle, landmarks.handle, pEyeRednessScores, pEyeRednessScoresSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pEyeRednessScores = calloc.allocate(pEyeRednessScoresSize.value);
    		err = faceSDK.id3FaceAnalyser_ComputeEyeRedness(_handle, image.handle, detectedFace.handle, landmarks.handle, pEyeRednessScores, pEyeRednessScoresSize);
    	}
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pEyeRednessScores.asTypedList(pEyeRednessScoresSize.value));
    	return value;
    } finally {
    	calloc.free(pEyeRednessScores);
    	calloc.free(pEyeRednessScoresSize);
    }
  }

  /// Computes the geometric attributes of a detected face. This function must be used for a portrait image with only one face in it.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated geometric attributes of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  GeometricAttributes computeGeometricAttributes(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<id3FaceGeometricAttributes> pGeometricAttributes = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputeGeometricAttributes(_handle, image.handle, detectedFace.handle, landmarks.handle, pGeometricAttributes);
    if (err != FaceError.success.value) {
    	calloc.free(pGeometricAttributes);
    	throw FaceException(err);
    }
    return GeometricAttributes(pGeometricAttributes);
  }

  /// Computes the glasses attributes of a detected face. This function must be used for a portrait image with only one face in it.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated glasses attributes of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  GlassesAttributes computeGlassesAttributes(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<id3FaceGlassesAttributes> pGlassesAttributes = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputeGlassesAttributes(_handle, image.handle, detectedFace.handle, landmarks.handle, pGlassesAttributes);
    if (err != FaceError.success.value) {
    	calloc.free(pGlassesAttributes);
    	throw FaceException(err);
    }
    return GlassesAttributes(pGlassesAttributes);
  }

  /// Computes 68 landmarks of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Estimated landmarks of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  PointList computeLandmarks(Image image, DetectedFace detectedFace) {
    PointList landmarks = PointList();
    var err = faceSDK.id3FaceAnalyser_ComputeLandmarks(_handle, image.handle, detectedFace.handle, landmarks.handle);
    if (err != FaceError.success.value) {
    	landmarks.dispose();
    	throw FaceException(err);
    }
    return landmarks;
  }

  /// Computes the photographic attributes of a detected face. This function must be used for a portrait image with only one face in it.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// param landmarks Estimated landmarks of the detected face. Must be computed with the face analyser.
  /// return Estimated photographic attributes of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  PhotographicAttributes computePhotographicAttributes(Image image, DetectedFace detectedFace, PointList landmarks) {
    Pointer<id3FacePhotographicAttributes> pPhotographicAttributes = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputePhotographicAttributes(_handle, image.handle, detectedFace.handle, landmarks.handle, pPhotographicAttributes);
    if (err != FaceError.success.value) {
    	calloc.free(pPhotographicAttributes);
    	throw FaceException(err);
    }
    return PhotographicAttributes(pPhotographicAttributes);
  }

  /// Computes the pose of a detected face.
  ///
  /// param detectedFace Detected face to process.
  /// return Estimated pose of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  FacePose computePose(DetectedFace detectedFace) {
    Pointer<id3FacePose> pPose = calloc();
    var err = faceSDK.id3FaceAnalyser_ComputePose(_handle, detectedFace.handle, pPose);
    if (err != FaceError.success.value) {
    	calloc.free(pPose);
    	throw FaceException(err);
    }
    return FacePose(pPose);
  }

  /// Detects the presence of a face mask on a detected face. A high score means that there is a high chance that the person is wearing a mask. The minimum recommended threshold is 15.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Face mask presence score of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  int detectFaceMask(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FaceAnalyser_DetectFaceMask(_handle, image.handle, detectedFace.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Detects the presence of occlusions on top of a detected face.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Occlusion scores of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceOcclusionScores detectOcclusions(Image image, DetectedFace detectedFace) {
    Pointer<id3FaceOcclusionScores> pScores = calloc();
    var err = faceSDK.id3FaceAnalyser_DetectOcclusions(_handle, image.handle, detectedFace.handle, pScores);
    if (err != FaceError.success.value) {
    	calloc.free(pScores);
    	throw FaceException(err);
    }
    return FaceOcclusionScores(pScores);
  }

}
