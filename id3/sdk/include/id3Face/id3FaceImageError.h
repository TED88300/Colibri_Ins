//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImageError_h
#define _id3FaceImageError_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a ImageError of the Face module.
 */
typedef enum id3FaceImageError {
	/**
	 * No error.
	 */
	id3FaceImageError_Success = 0,
	/**
	 * Base error code for Image module.
	 */
	id3FaceImageError_Base = -3000,
	/**
	 * Minimum error code for Image module.
	 */
	id3FaceImageError_Minimum = -3999,
	/**
	 * The handle is invalid.
	 */
	id3FaceImageError_InvalidHandle = -3001,
	/**
	 * The parameter is invalid.
	 */
	id3FaceImageError_InvalidParameter = -3002,
	/**
	 * The given buffer is too small.
	 */
	id3FaceImageError_InsufficientBuffer = -3003,
	/**
	 * The image sizes are not compatible for the requested operation.
	 */
	id3FaceImageError_ImageSizeMismatch = -3004,
	/**
	 * The pixel formats are not compatible.
	 */
	id3FaceImageError_PixelFormatMismatch = -3005,
	/**
	 * The given key is already used in the dictionary. Multiple values per key is not supported.
	 */
	id3FaceImageError_KeyAlreadyExists = -3006,
	/**
	 * The given key is not present in the dictionary.
	 */
	id3FaceImageError_KeyNotFound = -3007,
	/**
	 * The required pixel format is not correct.
	 */
	id3FaceImageError_InvalidPixelFormat = -3008,
} id3FaceImageError;

#ifdef __cplusplus
}
#endif

#endif
