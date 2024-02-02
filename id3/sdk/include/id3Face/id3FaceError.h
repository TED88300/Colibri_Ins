//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceError_h
#define _id3FaceError_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceError of the Face module.
 */
typedef enum id3FaceError {
	/**
	 * No error.
	 */
	id3FaceError_Success = 0,
	/**
	 * Base error code of the Face module.
	 */
	id3FaceError_Base = -1000,
	/**
	 * Minimum error code of the Face module.
	 */
	id3FaceError_Minimum = -1999,
	/**
	 * The handle is invalid.
	 */
	id3FaceError_InvalidHandle = -1001,
	/**
	 * The parameter is invalid.
	 */
	id3FaceError_InvalidParameter = -1002,
	/**
	 * The given buffer is too small.
	 */
	id3FaceError_InsufficientBuffer = -1003,
	/**
	 * The image pixel format is invalid.
	 */
	id3FaceError_InvalidPixelFormat = -1004,
	/**
	 * The template format is invalid.
	 */
	id3FaceError_InvalidTemplateFormat = -1005,
	/**
	 * The computed landmarks are invalid and do not allow to process the desired information.
	 */
	id3FaceError_InvalidLandmarks = -1006,
	/**
	 * The computed interocular distance (IOD) is invalid and does not allow to process the desired information.
	 */
	id3FaceError_InvalidIod = -1007,
	/**
	 * The model could not be found in the given directory path.
	 */
	id3FaceError_InvalidModelPath = -1008,
	/**
	 * The model which is required for this operation was not loaded.
	 */
	id3FaceError_UnloadedModel = -1020,
	/**
	 * The inference backend failed to infer, probably due to inconsistent input.
	 */
	id3FaceError_InferenceBackendError = -1040,
} id3FaceError;

#ifdef __cplusplus
}
#endif

#endif
