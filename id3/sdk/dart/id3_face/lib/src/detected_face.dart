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

/// This class represents a DetectedFace object of the Face module.
class DetectedFace {
  /// Native handle.
  late Pointer<id3DetectedFace> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3DetectedFace> get handle => _handle;

  /// Creates a new instance of the DetectedFace class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace() {
    Pointer<Pointer<id3DetectedFace>> pHandle = calloc();
    try {
      var err = faceSDK.id3DetectedFace_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the DetectedFace class.
  ///
  /// param handle     Handle to the DetectedFace.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace.fromHandle(Pointer<id3DetectedFace> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this DetectedFace.
  void dispose() {
    Pointer<Pointer<id3DetectedFace>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3DetectedFace_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the DetectedFace object.
  ///
  /// return The newly created DetectedFace object.
  /// throws FaceException An error has occurred during Face Library execution.
  DetectedFace clone() {
    DetectedFace clone = DetectedFace();
    var err = faceSDK.id3DetectedFace_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Gets the bounds of the detected face.
  ///
  /// return Bounds of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  Rectangle getBounds() {
    Pointer<id3FaceRectangle> pBounds = calloc();
    var err = faceSDK.id3DetectedFace_GetBounds(_handle, pBounds);
    if (err != FaceError.success.value) {
    	calloc.free(pBounds);
    	throw FaceException(err);
    }
    return Rectangle(pBounds);
  }

  /// Sets the bounds of the detected face.
  ///
  /// param bounds Bounds of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  void setBounds(Rectangle bounds) {
    var err = faceSDK.id3DetectedFace_SetBounds(_handle, bounds.struct);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the confidence score of the detected face.
  ///
  /// return Confidence score of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  int getDetectionScore() {
    Pointer<Int32> pDetectionScore = calloc();
    try {
    	var err = faceSDK.id3DetectedFace_GetDetectionScore(_handle, pDetectionScore);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pDetectionScore.value;
    	return value;
    } finally {
    	calloc.free(pDetectionScore);
    }
  }

  /// Sets the confidence score of the detected face.
  ///
  /// param detectionScore Confidence score of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  void setDetectionScore(int detectionScore) {
    var err = faceSDK.id3DetectedFace_SetDetectionScore(_handle, detectionScore);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the ID of the detected face.
  ///
  /// return ID of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  int getId() {
    Pointer<Int32> pId = calloc();
    try {
    	var err = faceSDK.id3DetectedFace_GetId(_handle, pId);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pId.value;
    	return value;
    } finally {
    	calloc.free(pId);
    }
  }

  /// Sets the ID of the detected face.
  ///
  /// param id ID of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  void setId(int id) {
    var err = faceSDK.id3DetectedFace_SetId(_handle, id);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Gets the landmarks (eyes, nose and mouth corners) of the detected face.
  ///
  /// return Landmarks (eyes, nose and mouth corners) of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  PointList getLandmarks() {
    PointList landmarks = PointList();
    var err = faceSDK.id3DetectedFace_GetLandmarks(_handle, landmarks.handle);
    if (err != FaceError.success.value) {
    	landmarks.dispose();
    	throw FaceException(err);
    }
    return landmarks;
  }

  /// Sets the landmarks (eyes, nose and mouth corners) of the detected face.
  ///
  /// param landmarks Landmarks (eyes, nose and mouth corners) of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  void setLandmarks(PointList landmarks) {
    var err = faceSDK.id3DetectedFace_SetLandmarks(_handle, landmarks.handle);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Imports the face object from a buffer.
  ///
  /// param data Buffer to import the face object from.
  /// return Created detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  static DetectedFace fromBuffer(Uint8List data) {
    DetectedFace detectedFace = DetectedFace();
    Pointer<Uint8> pData = calloc.allocate<Uint8>(data.length);
    Uint8List dataBytes = pData.asTypedList(data.length);
    dataBytes.setAll(0, data);
    try {
    	var err = faceSDK.id3DetectedFace_FromBuffer(detectedFace.handle, pData, data.length);
    	if (err != FaceError.success.value) {
    		detectedFace.dispose();
    		throw FaceException(err);
    	}
    	return detectedFace;
    } finally {
    	calloc.free(pData);
    }
  }

  /// Imports the face object from a file.
  ///
  /// param path Path to the file to import the face object from.
  /// return Created detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  static DetectedFace fromFile(String path) {
    DetectedFace detectedFace = DetectedFace();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3DetectedFace_FromFile(detectedFace.handle, pPath);
    	if (err != FaceError.success.value) {
    		detectedFace.dispose();
    		throw FaceException(err);
    	}
    	return detectedFace;
    } finally {
    	calloc.free(pPath);
    }
  }

  /// Creates a detected face from values.
  ///
  /// param bounds Bounds of the detected face.
  /// param detectionScore Confidence score of the detected face.
  /// param id ID of the detected face.
  /// param landmarks Landmarks (eyes, nose and mouth corners) of the detected face.
  /// return Created detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  static DetectedFace fromValues(Rectangle bounds, int detectionScore, int id, PointList landmarks) {
    DetectedFace detectedFace = DetectedFace();
    var err = faceSDK.id3DetectedFace_FromValues(detectedFace.handle, bounds.struct, detectionScore, id, landmarks.handle);
    if (err != FaceError.success.value) {
    	detectedFace.dispose();
    	throw FaceException(err);
    }
    return detectedFace;
  }

  /// Gets the distance between the detected face and the camera when using a depth map in pixels.
  ///
  /// param depthImage Depth image to process.
  /// return Computed distance to camera in pixels.
  /// throws FaceException An error has occurred during Face Library execution.
  int getDistanceToCamera(Image depthImage) {
    Pointer<Int32> pDistanceToCamera = calloc();
    try {
    	var err = faceSDK.id3DetectedFace_GetDistanceToCamera(_handle, depthImage.handle, pDistanceToCamera);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pDistanceToCamera.value;
    	return value;
    } finally {
    	calloc.free(pDistanceToCamera);
    }
  }

  /// Gets the distance between the eyes (IOD) of the detected face in pixels.
  ///
  /// return Computed interocular distance (IOD) in pixels.
  /// throws FaceException An error has occurred during Face Library execution.
  int getInterocularDistance() {
    Pointer<Int32> pIod = calloc();
    try {
    	var err = faceSDK.id3DetectedFace_GetInterocularDistance(_handle, pIod);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pIod.value;
    	return value;
    } finally {
    	calloc.free(pIod);
    }
  }

  /// Gets the portrait bounds of the detected face.
  ///
  /// param eyeImageWidthRatio Ratio between eye distance and image width. Must be in the range )0;1(. Default recommended value is 0.25.
  /// param eyeImageHeightRatio Ratio between eye distance to top and image height. Must be in the range )0;1(. Default recommended value is 0.45.
  /// param imageRatio Ratio between image height and image width. Default recommended value is 1.33 (4/3).
  /// return Portrait bounds of the detected face.
  /// throws FaceException An error has occurred during Face Library execution.
  Rectangle getPortraitBounds(double eyeImageWidthRatio, double eyeImageHeightRatio, double imageRatio) {
    Pointer<id3FaceRectangle> pPortraitBounds = calloc();
    var err = faceSDK.id3DetectedFace_GetPortraitBounds(_handle, eyeImageWidthRatio, eyeImageHeightRatio, imageRatio, pPortraitBounds);
    if (err != FaceError.success.value) {
    	calloc.free(pPortraitBounds);
    	throw FaceException(err);
    }
    return Rectangle(pPortraitBounds);
  }

  /// Rescales the detected face object bounding box and landmarks. This function can be useful if the image was downscaled to speed up detection, then you need to upscale the detected face to fit the source image size.
  ///
  /// param scale The multiplicative rescaling factor to apply to the face object.
  /// throws FaceException An error has occurred during Face Library execution.
  void rescale(double scale) {
    var err = faceSDK.id3DetectedFace_Rescale(_handle, scale);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Rotates the face object by a given angle in degrees from a given center.
  ///
  /// param angle Angle of the rotation to apply to the face object.
  /// param center Center of the rotation to apply to the face object.
  /// throws FaceException An error has occurred during Face Library execution.
  void rotate(int angle, Point center) {
    var err = faceSDK.id3DetectedFace_Rotate(_handle, angle, center.struct);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Saves the face object to a file.
  ///
  /// param path Path to the file to export the face object to.
  /// throws FaceException An error has occurred during Face Library execution.
  void save(String path) {
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3DetectedFace_Save(_handle, pPath);
    	if (err != FaceError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pPath);
    }
  }

  /// Exports the face object to a buffer.
  ///
  /// return Buffer to export the face object to.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List toBuffer() {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3DetectedFace_ToBuffer(_handle, pData, pDataSize);
    	if (err == FaceError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3DetectedFace_ToBuffer(_handle, pData, pDataSize);
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

  /// Translates the face object.
  ///
  /// param tx Translation to apply to the face object alongside the x-axis.
  /// param ty Translation to apply to the face object alongside the y-axis.
  /// throws FaceException An error has occurred during Face Library execution.
  void translate(int tx, int ty) {
    var err = faceSDK.id3DetectedFace_Translate(_handle, tx, ty);
    if (err != FaceError.success.value) {
    	throw FaceException(err);
    }
  }

}
