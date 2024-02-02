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

/// This class represents a FacePad object of the Face module.
class FacePad {
  /// Native handle.
  late Pointer<id3FacePad> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FacePad> get handle => _handle;

  /// Creates a new instance of the FacePad class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FacePad() {
    Pointer<Pointer<id3FacePad>> pHandle = calloc();
    try {
      var err = faceSDK.id3FacePad_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FacePad class.
  ///
  /// param handle     Handle to the FacePad.
  /// throws FaceException An error has occurred during Face Library execution.
  FacePad.fromHandle(Pointer<id3FacePad> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FacePad.
  void dispose() {
    Pointer<Pointer<id3FacePad>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FacePad_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Public methods
  /// Computes a blurriness score for a color image. An attack presented on a low resolution support has more chance to be blurred than a bonafide. The maximum recommended value is 20.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Computed blurriness score. In the range (0:100).
  /// throws FaceException An error has occurred during Face Library execution.
  int computeBlurrinessScore(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FacePad_ComputeBlurrinessScore(_handle, image.handle, detectedFace.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Computes the PAD score of a detected face using only the color image. A high score means a high probability for the face to be bona-fide, hence not an attack. The minimum recommended value is 50.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Computed PAD score. In the range (0:100).
  /// throws FaceException An error has occurred during Face Library execution.
  int computeColorBasedScore(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FacePad_ComputeColorBasedScore(_handle, image.handle, detectedFace.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Computes the PAD score of a detected face using a depth map image. A high score means a high probability for the face to be bona-fide, hence not an attack. The minimum recommended value is 10.
  ///
  /// param image Source image to process. Must be Grayscale 16 Bits.
  /// param detectedFace Detected face to process.
  /// return Computed PAD score. In the range (0:100).
  /// throws FaceException An error has occurred during Face Library execution.
  int computeDepthBasedScore(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FacePad_ComputeDepthBasedScore(_handle, image.handle, detectedFace.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Computes the Moiré score of a detected face using a color image. An attack presented on a screen will likely present Moiré effects whereas a bonafide will not. The maximum recommended value is 10.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Computed Moiré score. In the range (0:100).
  /// throws FaceException An error has occurred during Face Library execution.
  int computeMoireScore(Image image, DetectedFace detectedFace) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FacePad_ComputeMoireScore(_handle, image.handle, detectedFace.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Detects if an attack support surrounds the detected face. The recommended usage is to consider the image to be an attack as soon as an attack support is detected.
  ///
  /// param image Source image to process.
  /// param detectedFace Detected face to process.
  /// return Detected face attack support.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFaceAttackSupport detectAttackSupport(Image image, DetectedFace detectedFace) {
    Pointer<id3DetectedFaceAttackSupport> pDetectedFaceAttackSupport = calloc();
    var err = faceSDK.id3FacePad_DetectAttackSupport(_handle, image.handle, detectedFace.handle, pDetectedFaceAttackSupport);
    if (err != FaceError.success.value) {
    	calloc.free(pDetectedFaceAttackSupport);
    	throw FaceException(err);
    }
    return DetectedFaceAttackSupport(pDetectedFaceAttackSupport);
  }

}
