//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImageFormat_h
#define _id3FaceImageFormat_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a ImageFormat of the Face module.
 */
typedef enum id3FaceImageFormat {
	/**
	 * BMP.
	 */
	id3FaceImageFormat_Bmp = 0,
	/**
	 * JPEG.
	 */
	id3FaceImageFormat_Jpeg = 2,
	/**
	 * PNG.
	 */
	id3FaceImageFormat_Png = 13,
	/**
	 * Tiff.
	 */
	id3FaceImageFormat_Tiff = 18,
	/**
	 * JPEG 2000.
	 */
	id3FaceImageFormat_Jpeg2000 = 30,
	/**
	 * WEBP.
	 */
	id3FaceImageFormat_Webp = 31,
	/**
	 * Raw.
	 */
	id3FaceImageFormat_Raw = 34,
} id3FaceImageFormat;

#ifdef __cplusplus
}
#endif

#endif
