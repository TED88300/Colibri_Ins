//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePose_h
#define _id3FacePose_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a FacePose object of the Face module.
 */
typedef struct id3FacePose {
	/**
	 * Pitch angle in degrees.
	 */
    float Pitch;
	/**
	 * Roll angle in degrees.
	 */
    float Roll;
	/**
	 * Yaw angle in degrees.
	 */
    float Yaw;
} id3FacePose;

#ifdef __cplusplus
}
#endif

#endif
