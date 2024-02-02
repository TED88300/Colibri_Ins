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

/// This class represents a Image object of the Face module.
class Image {
  /// Native handle.
  late Pointer<id3FaceImage> _handle;

  /// Gets the native handle.
  /// return The native handle.
  Pointer<id3FaceImage> get handle => _handle;

  /// Creates a new instance of the Image class.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  Image() {
    Pointer<Pointer<id3FaceImage>> pHandle = calloc();
    try {
      var err = faceSDK.id3FaceImage_Initialize(pHandle);
      if (err != FaceError.success.value) {
        throw FaceException(err);
      }
      _handle = pHandle.value;
    } finally {
      calloc.free(pHandle);
    }
  }

  /// Creates a new instance of the Image class.
  ///
  /// param handle     Handle to the Image.
  /// throws FaceException An error has occurred during Face Library execution.
  Image.fromHandle(Pointer<id3FaceImage> handle) {
    _handle = handle;
  }

  /// Releases all resources used by this Image.
  void dispose() {
    Pointer<Pointer<id3FaceImage>> pHandle = calloc();
    pHandle.value = _handle;
    faceSDK.id3FaceImage_Dispose(pHandle);
    _handle = pHandle.value;
    calloc.free(pHandle);
  }

  // Copyable methods

  /// Creates a copy of the Image object.
  ///
  /// return The newly created Image object.
  /// throws FaceException An error has occurred during Face Library execution.
  Image clone() {
    Image clone = Image();
    var err = faceSDK.id3FaceImage_CopyTo(_handle, clone.handle);
    if (err != FaceError.success.value) {
      throw FaceException(err);
    }
    return clone;
  }

  // Public methods
  /// Gets the raw data buffer of the image.
  ///
  /// return Raw data buffer of the image.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List getData() {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetData(_handle, pData, pDataSize);
    	if (err == ImageError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceImage_GetData(_handle, pData, pDataSize);
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

  /// Gets the height in pixels.
  ///
  /// return Height in pixels.
  /// throws FaceException An error has occurred during Face Library execution.
  int getHeight() {
    Pointer<Int32> pHeight = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetHeight(_handle, pHeight);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pHeight.value;
    	return value;
    } finally {
    	calloc.free(pHeight);
    }
  }

  /// Gets the pixel depth.
  ///
  /// return Pixel depth.
  /// throws FaceException An error has occurred during Face Library execution.
  int getPixelDepth() {
    Pointer<Int32> pPixelDepth = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetPixelDepth(_handle, pPixelDepth);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pPixelDepth.value;
    	return value;
    } finally {
    	calloc.free(pPixelDepth);
    }
  }

  /// Gets the pixel format.
  ///
  /// return Pixel format.
  /// throws FaceException An error has occurred during Face Library execution.
  PixelFormat getPixelFormat() {
    Pointer<Int32> pPixelFormat = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetPixelFormat(_handle, pPixelFormat);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = PixelFormatX.fromValue(pPixelFormat.value);
    	return value;
    } finally {
    	calloc.free(pPixelFormat);
    }
  }

  /// Gets the stride in bytes.
  ///
  /// return Stride in bytes.
  /// throws FaceException An error has occurred during Face Library execution.
  int getStride() {
    Pointer<Int32> pStride = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetStride(_handle, pStride);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pStride.value;
    	return value;
    } finally {
    	calloc.free(pStride);
    }
  }

  /// Gets the width in pixels.
  ///
  /// return Width in pixels.
  /// throws FaceException An error has occurred during Face Library execution.
  int getWidth() {
    Pointer<Int32> pWidth = calloc();
    try {
    	var err = faceSDK.id3FaceImage_GetWidth(_handle, pWidth);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pWidth.value;
    	return value;
    } finally {
    	calloc.free(pWidth);
    }
  }

  /// Applies a gamma correction to the image object.
  ///
  /// param contrast Contrast coefficient to apply. Range is (-255;255). Default value is 0.
  /// param brightness Brightness coefficient to apply. Range is (-255;255). Default value is 0.
  /// param gamma Gamma coefficient to apply. Range is (0.25;2.50). Default value is 1.00.
  /// throws FaceException An error has occurred during Face Library execution.
  void correctGamma(int contrast, int brightness, double gamma) {
    var err = faceSDK.id3FaceImage_CorrectGamma(_handle, contrast, brightness, gamma);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Downscales an image so that its maximum dimension equals the given maximum size while preserving the aspect ratio. If the maximum dimension is already smaller than the given maximum size, the function does nothing and the returned scale ratio is 1.
  ///
  /// param maxSize Maximum size to fit the image in. Range is (1:+inf(.
  /// return Applied scale ratio. Range is )0:1).
  /// throws FaceException An error has occurred during Face Library execution.
  double downscale(int maxSize) {
    Pointer<Float> pScaleRatio = calloc();
    try {
    	var err = faceSDK.id3FaceImage_Downscale(_handle, maxSize, pScaleRatio);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pScaleRatio.value;
    	return value;
    } finally {
    	calloc.free(pScaleRatio);
    }
  }

  /// Extracts a region of interest in the image object according to the given bounds.
  ///
  /// param bounds Bounds of the crop to extract.
  /// return Extracted region of interest.
  /// throws FaceException An error has occurred during Face Library execution.
  Image extractRoi(Rectangle bounds) {
    Image imageRoi = Image();
    var err = faceSDK.id3FaceImage_ExtractRoi(_handle, bounds.struct, imageRoi.handle);
    if (err != ImageError.success.value) {
    	imageRoi.dispose();
    	throw FaceException(err);
    }
    return imageRoi;
  }

  /// Flips the image object.
  ///
  /// param flipHorizontally Set to 'true' to flip horizontally the image.
  /// param flipVertically Set to 'true' to flip vertically the image.
  /// throws FaceException An error has occurred during Face Library execution.
  void flip(bool flipHorizontally, bool flipVertically) {
    var err = faceSDK.id3FaceImage_Flip(_handle, flipHorizontally, flipVertically);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Imports the image object from a buffer.
  ///
  /// param data Buffer to import the image object from.
  /// param pixelFormat The destination pixel format to convert the input to.
  /// return Created image.
  /// throws FaceException An error has occurred during Face Library execution.
  static Image fromBuffer(Uint8List data, PixelFormat pixelFormat) {
    Image image = Image();
    Pointer<Uint8> pData = calloc.allocate<Uint8>(data.length);
    Uint8List dataBytes = pData.asTypedList(data.length);
    dataBytes.setAll(0, data);
    try {
    	var err = faceSDK.id3FaceImage_FromBuffer(image.handle, pData, data.length, pixelFormat.value);
    	if (err != ImageError.success.value) {
    		image.dispose();
    		throw FaceException(err);
    	}
    	return image;
    } finally {
    	calloc.free(pData);
    }
  }

  /// Imports the image object from a file.
  ///
  /// param filepath Path to the file to import the image object from.
  /// param pixelFormat The destination pixel format to convert the input to.
  /// return Created image.
  /// throws FaceException An error has occurred during Face Library execution.
  static Image fromFile(String filepath, PixelFormat pixelFormat) {
    Image image = Image();
    Pointer<Int8> pFilepath = filepath.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceImage_FromFile(image.handle, pFilepath, pixelFormat.value);
    	if (err != ImageError.success.value) {
    		image.dispose();
    		throw FaceException(err);
    	}
    	return image;
    } finally {
    	calloc.free(pFilepath);
    }
  }

  /// Imports the image object from a raw buffer.
  ///
  /// param pixels Buffer containing the pixels of the image.
  /// param width Width in pixels of the image.
  /// param height Height in pixels of the image.
  /// param stride Stride in pixels of the image.
  /// param srcPixelFormat The source pixel format of the input image.
  /// param dstPixelFormat The destination pixel format to convert the input image to.
  /// return Created image.
  /// throws FaceException An error has occurred during Face Library execution.
  static Image fromRawBuffer(Uint8List pixels, int width, int height, int stride, PixelFormat srcPixelFormat, PixelFormat dstPixelFormat) {
    Image image = Image();
    Pointer<Uint8> pPixels = calloc.allocate<Uint8>(pixels.length);
    Uint8List pixelsBytes = pPixels.asTypedList(pixels.length);
    pixelsBytes.setAll(0, pixels);
    try {
    	var err = faceSDK.id3FaceImage_FromRawBuffer(image.handle, pPixels, pixels.length, width, height, stride, srcPixelFormat.value, dstPixelFormat.value);
    	if (err != ImageError.success.value) {
    		image.dispose();
    		throw FaceException(err);
    	}
    	return image;
    } finally {
    	calloc.free(pPixels);
    }
  }

  /// Imports the image object from YUV planes.
  ///
  /// param yPlane Buffer containing the Y plane.
  /// param uPlane Buffer containing the U plane.
  /// param vPlane Buffer containing the V plane.
  /// param yWidth Width in pixels of the Y plane.
  /// param yHeight Height in pixels of the Y plane.
  /// param uvPixelStride Pixel-level stride in pixels of the U and V planes.
  /// param uvRowStride Row-level stride in pixels of the U and V planes.
  /// param dstPixelFormat The destination pixel format to convert the input image to.
  /// return Created image.
  /// throws FaceException An error has occurred during Face Library execution.
  static Image fromYuvPlanes(Uint8List yPlane, Uint8List uPlane, Uint8List vPlane, int yWidth, int yHeight, int uvPixelStride, int uvRowStride, PixelFormat dstPixelFormat) {
    Image image = Image();
    Pointer<Uint8> pYPlane = calloc.allocate<Uint8>(yPlane.length);
    Uint8List yPlaneBytes = pYPlane.asTypedList(yPlane.length);
    yPlaneBytes.setAll(0, yPlane);
    Pointer<Uint8> pUPlane = calloc.allocate<Uint8>(uPlane.length);
    Uint8List uPlaneBytes = pUPlane.asTypedList(uPlane.length);
    uPlaneBytes.setAll(0, uPlane);
    Pointer<Uint8> pVPlane = calloc.allocate<Uint8>(vPlane.length);
    Uint8List vPlaneBytes = pVPlane.asTypedList(vPlane.length);
    vPlaneBytes.setAll(0, vPlane);
    try {
    	var err = faceSDK.id3FaceImage_FromYuvPlanes(image.handle, pYPlane, yPlane.length, pUPlane, uPlane.length, pVPlane, vPlane.length, yWidth, yHeight, uvPixelStride, uvRowStride, dstPixelFormat.value);
    	if (err != ImageError.success.value) {
    		image.dispose();
    		throw FaceException(err);
    	}
    	return image;
    } finally {
    	calloc.free(pYPlane);
    	calloc.free(pUPlane);
    	calloc.free(pVPlane);
    }
  }

  /// Reallocates the internal memory of an image object from parameters. If the given parameters are the same as the ones of the object, then there is nothing done in this function.
  ///
  /// param width Width to reallocate the image object to.
  /// param height Height to reallocate the image object to.
  /// param pixelFormat Pixel format to reallocate the image object to.
  /// throws FaceException An error has occurred during Face Library execution.
  void reallocate(int width, int height, PixelFormat pixelFormat) {
    var err = faceSDK.id3FaceImage_Reallocate(_handle, width, height, pixelFormat.value);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Resizes the image object to the required width and height.
  ///
  /// param width Width to resize the image object to.
  /// param height Height to resize the image object to.
  /// throws FaceException An error has occurred during Face Library execution.
  void resize(int width, int height) {
    var err = faceSDK.id3FaceImage_Resize(_handle, width, height);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Rotates the image object of the required angle. The rotation is performed counter-clockwise.
  ///
  /// param angle Counter-clockwise angle to apply. Supported values are (0, 90, 180, 270).
  /// throws FaceException An error has occurred during Face Library execution.
  void rotate(int angle) {
    var err = faceSDK.id3FaceImage_Rotate(_handle, angle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Exports the image object to a file. The compression level meaning depends on the used algorithm:
  /// - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
  /// - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
  /// - For PNG compression, the value is the compression rate and may vary from 1 to 10.
  /// - For all other formats, the value is ignored.
  ///
  /// param filepath Path to the file to export the image object to.
  /// param compressionLevel Compression level to apply.
  /// throws FaceException An error has occurred during Face Library execution.
  void save(String filepath, double compressionLevel) {
    Pointer<Int8> pFilepath = filepath.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceImage_Save(_handle, pFilepath, compressionLevel);
    	if (err != ImageError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pFilepath);
    }
  }

  /// Exports the image object to a buffer. The compression level meaning depends on the used algorithm:
  /// - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
  /// - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
  /// - For PNG compression, the value is the compression rate and may vary from 1 to 10.
  /// - For all other formats, the value is ignored.
  ///
  /// param imageFormat The image format to export the image to.
  /// param compressionLevel Compression level to apply.
  /// return Buffer to export the image object to.
  /// throws FaceException An error has occurred during Face Library execution.
  Uint8List toBuffer(ImageFormat imageFormat, double compressionLevel) {
    Pointer<Uint8> pData = nullptr;
    Pointer<Int32> pDataSize = calloc();
    try {
    	var err = faceSDK.id3FaceImage_ToBuffer(_handle, imageFormat.value, compressionLevel, pData, pDataSize);
    	if (err == ImageError.insufficientBuffer.value) {
    		pData = calloc.allocate(pDataSize.value);
    		err = faceSDK.id3FaceImage_ToBuffer(_handle, imageFormat.value, compressionLevel, pData, pDataSize);
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

  /// Exports the image object to a buffer object. The compression level meaning depends on the used algorithm:
  /// - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
  /// - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
  /// - For PNG compression, the value is the compression rate and may vary from 1 to 10.
  /// - For all other formats, the value is ignored.
  ///
  /// param imageFormat The image format to export the image to.
  /// param compressionLevel Compression level to apply.
  /// param buffer Buffer object to export the image object to.
  /// throws FaceException An error has occurred during Face Library execution.
  void toBufferObject(ImageFormat imageFormat, double compressionLevel, ImageBuffer buffer) {
    var err = faceSDK.id3FaceImage_ToBufferObject(_handle, imageFormat.value, compressionLevel, buffer.handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

  /// Transposes the image object.
  ///
  /// throws FaceException An error has occurred during Face Library execution.
  void transpose() {
    var err = faceSDK.id3FaceImage_Transpose(_handle);
    if (err != ImageError.success.value) {
    	throw FaceException(err);
    }
  }

}
