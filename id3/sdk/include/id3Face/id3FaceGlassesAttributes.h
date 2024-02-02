//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceGlassesAttributes_h
#define _id3FaceGlassesAttributes_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a GlassesAttributes object of the Face module.
 */
typedef struct id3FaceGlassesAttributes {
	/**
	 * Value indicating if the glasses frame is not on the eyes. The lower the better.
	 */
    int FrameOnEye;
	/**
	 * Value indicating if the glasses' frame is too heavy. In the range [0; 100]. The closer to 100 the better. The minimum recommended value is 80.
	 */
    int HeavyFrame;
	/**
	 * Value indicating if the glasses are tinted. The lower the better. The minimum recommended value is 25.
	 */
    int TintedGlasses;
} id3FaceGlassesAttributes;

#ifdef __cplusplus
}
#endif

#endif
