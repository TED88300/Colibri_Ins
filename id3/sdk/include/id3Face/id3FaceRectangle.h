//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceRectangle_h
#define _id3FaceRectangle_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FacePoint.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a Rectangle object of the Face module.
 */
typedef struct id3FaceRectangle {
	/**
	 * Bottom-left corner of the rectangle.
	 */
    id3FacePoint BottomLeft;
	/**
	 * Bottom-right corner of the rectangle.
	 */
    id3FacePoint BottomRight;
	/**
	 * Top-left corner of the rectangle.
	 */
    id3FacePoint TopLeft;
	/**
	 * Top-right corner of the rectangle.
	 */
    id3FacePoint TopRight;
} id3FaceRectangle;

#ifdef __cplusplus
}
#endif

#endif
