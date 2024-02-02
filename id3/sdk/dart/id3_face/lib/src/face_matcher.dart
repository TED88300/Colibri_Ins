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

/// This class represents a FaceMatcher object of the Face module.
class FaceMatcher {
  /// Native handle.
  late Pointer<id3FaceMatcher> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceMatcher> get handle => _handle;

  /// Creates a new instance of the FaceMatcher class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  FaceMatcher() {
    Pointer<Pointer<id3FaceMatcher>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceMatcher_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the FaceMatcher class.
  ///
  /// param handle     Handle to the FaceMatcher.
  /// throws FaceException An error has occurred during Face Library execution.
  FaceMatcher.fromHandle(Pointer<id3FaceMatcher> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this FaceMatcher.
  void dispose() {
    Pointer<Pointer<id3FaceMatcher>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceMatcher_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Public methods
  /// Compares two template lists and outputs a comparison score.
  ///
  /// param referenceList Reference template list.
  /// param probeList Probe template list.
  /// param poolingMethod Pooling method to apply during the match process.
  /// return Comparison score. In the range (0:65535).
  /// throws FaceException An error has occurred during Face Library execution.
  int compareTemplateLists(FaceTemplateList referenceList, FaceTemplateList probeList, PoolingMethod poolingMethod) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FaceMatcher_CompareTemplateLists(_handle, referenceList.handle, probeList.handle, poolingMethod.value, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Compares two templates and outputs a comparison score.
  ///
  /// param reference Reference template.
  /// param probe Probe template.
  /// return Comparison score. In the range (0:65535).
  /// throws FaceException An error has occurred during Face Library execution.
  int compareTemplates(FaceTemplate reference, FaceTemplate probe) {
    Pointer<Int32> pScore = calloc();
    try {
    	var err = faceSDK.id3FaceMatcher_CompareTemplates(_handle, reference.handle, probe.handle, pScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScore.value;
    	return value;
    } finally {
    	calloc.free(pScore);
    }
  }

  /// Performs a one-to-many search of a biometric probe against a previously initialized dictionary of biometric references and outputs a candidate list.
  ///
  /// param referenceDict Reference template dictionary.
  /// param probe Probe template.
  /// param maxCandidates Maximum number of candidates to output.
  /// param candidateList List of candidates sorted by decreasing match score.
  /// throws FaceException An error has occurred during Face Library execution.
  void searchTemplate(FaceTemplateDict referenceDict, FaceTemplate probe, int maxCandidates, FaceCandidateList candidateList) {
    var err = faceSDK.id3FaceMatcher_SearchTemplate(_handle, referenceDict.handle, probe.handle, maxCandidates, candidateList.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
