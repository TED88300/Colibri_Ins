//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePoolingMethod_h
#define _id3FacePoolingMethod_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a PoolingMethod of the Face module.
 */
typedef enum id3FacePoolingMethod {
	/**
	 * Average pooling method. Merges instances (scores, templates, etc) into one.
	 */
	id3FacePoolingMethod_Average = 0,
	/**
	 * Maximum pooling method. Selects best instance according to a given metric.
	 */
	id3FacePoolingMethod_Maximum = 1,
} id3FacePoolingMethod;

#ifdef __cplusplus
}
#endif

#endif
