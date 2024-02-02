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

/// This class represents a FaceLibrary object of the Face module.
class FaceLibrary {
  // Public methods
  /// Checks the license file.
  ///
  /// param licensePath License path.
  /// throws FaceException An error has occurred during Face Library execution.
  static void checkLicense(String licensePath) {
    Pointer<Int8> pLicensePath = licensePath.toNativeUtf8().cast<Int8>();
    Pointer<Void> pOptionalParameter = nullptr;
    try {
    	var err = faceSDK.id3FaceLibrary_CheckLicense(pLicensePath, pOptionalParameter);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pLicensePath);
    }
  }

  /// Checks the license from a buffer.
  ///
  /// param licenseBuffer License buffer.
  /// throws FaceException An error has occurred during Face Library execution.
  static void checkLicenseBuffer(Uint8List licenseBuffer) {
    Pointer<Uint8> pLicenseBuffer = calloc.allocate<Uint8>(licenseBuffer.length);
    Uint8List licenseBufferBytes = pLicenseBuffer.asTypedList(licenseBuffer.length);
    licenseBufferBytes.setAll(0, licenseBuffer);
    Pointer<Void> pOptionalParameter = nullptr;
    try {
    	var err = faceSDK.id3FaceLibrary_CheckLicenseBuffer(pLicenseBuffer, licenseBuffer.length, pOptionalParameter);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pLicenseBuffer);
    }
  }

  /// Loads a model from the zoo into the required processing unit.
  ///
  /// param modelPath Path to the models' directory.
  /// param faceModel Face model to load.
  /// param processingUnit Processing unit to load the model into.
  /// throws FaceException An error has occurred during Face Library execution.
  static void loadModel(String modelPath, FaceModel faceModel, ProcessingUnit processingUnit) {
    Pointer<Int8> pModelPath = modelPath.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLibrary_LoadModel(pModelPath, faceModel.value, processingUnit.value);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pModelPath);
    }
  }

  /// Loads a model from the zoo into the required processing unit.
  ///
  /// param modelBuffer Buffer containing the model to load.
  /// param faceModel Face model to load.
  /// param processingUnit Processing unit to load the model into.
  /// throws FaceException An error has occurred during Face Library execution.
  static void loadModelBuffer(Uint8List modelBuffer, FaceModel faceModel, ProcessingUnit processingUnit) {
    Pointer<Uint8> pModelBuffer = calloc.allocate<Uint8>(modelBuffer.length);
    Uint8List modelBufferBytes = pModelBuffer.asTypedList(modelBuffer.length);
    modelBufferBytes.setAll(0, modelBuffer);
    try {
    	var err = faceSDK.id3FaceLibrary_LoadModelBuffer(pModelBuffer, modelBuffer.length, faceModel.value, processingUnit.value);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pModelBuffer);
    }
  }

  /// Unloads a model from the processing unit it was loaded into.
  ///
  /// param faceModel Face model to unload.
  /// param processingUnit Processing unit to unload the model from.
  /// throws FaceException An error has occurred during Face Library execution.
  static void unloadModel(FaceModel faceModel, ProcessingUnit processingUnit) {
    var err = faceSDK.id3FaceLibrary_UnloadModel(faceModel.value, processingUnit.value);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
