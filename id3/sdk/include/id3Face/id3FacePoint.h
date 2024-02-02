//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePoint_h
#define _id3FacePoint_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a Point object of the Face module.
 */
typedef struct id3FacePoint {
	/**
	 * X-coordinate of the point.
	 */
    int X;
	/**
	 * Y-coordinate of the point.
	 */
    int Y;
} id3FacePoint;

#ifdef __cplusplus
}
#endif

#endif
