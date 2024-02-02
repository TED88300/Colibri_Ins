//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePixelFormat_h
#define _id3FacePixelFormat_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a PixelFormat of the Face module.
 */
typedef enum id3FacePixelFormat {
	/**
	 * Undefined.
	 */
	id3FacePixelFormat_Undefined = 0,
	/**
	 * 8-bits grayscale.
	 */
	id3FacePixelFormat_Grayscale8Bits = 10,
	/**
	 * 16-bits grayscale.
	 */
	id3FacePixelFormat_Grayscale16Bits = 20,
	/**
	 * Floating point grayscale.
	 */
	id3FacePixelFormat_GrayscaleFloat = 25,
	/**
	 * 24 bits BGR.
	 */
	id3FacePixelFormat_Bgr24Bits = 30,
	/**
	 * 24 bits RGB.
	 */
	id3FacePixelFormat_Rgb24Bits = 31,
	/**
	 * 32 bits BGRA.
	 */
	id3FacePixelFormat_Bgra = 32,
	/**
	 * NV12 (YUV semi-planar format).
	 */
	id3FacePixelFormat_Nv12 = 40,
	/**
	 * I420 (YUV packed format).
	 */
	id3FacePixelFormat_I420 = 41,
	/**
	 * YUY2 (YUV packed format).
	 */
	id3FacePixelFormat_Yuy2 = 42,
} id3FacePixelFormat;

#ifdef __cplusplus
}
#endif

#endif
