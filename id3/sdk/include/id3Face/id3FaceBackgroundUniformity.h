//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceBackgroundUniformity_h
#define _id3FaceBackgroundUniformity_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a BackgroundUniformity object of the Face module.
 */
typedef struct id3FaceBackgroundUniformity {
	/**
	 * Color uniformity score. In the range [0:100]. Recommended threshold is 80.
	 */
    int ColorUniformity;
	/**
	 * Structure uniformity score. In the range [0:100]. Recommended threshold is 80.
	 */
    int StructureUniformity;
} id3FaceBackgroundUniformity;

#ifdef __cplusplus
}
#endif

#endif
