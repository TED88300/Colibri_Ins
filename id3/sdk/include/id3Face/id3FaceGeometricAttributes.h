//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceGeometricAttributes_h
#define _id3FaceGeometricAttributes_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a GeometricAttributes object of the Face module.
 */
typedef struct id3FaceGeometricAttributes {
	/**
	 * Value indicating if the distance between the base of the chin and the crown is less than 80% of the total height of the image. For ICAO compliance, the value must be in the range 60 to 90.
	 */
    int HeadImageHeightRatio;
	/**
	 * Value indicating if the image width is conform to the (image width / head width) ratio of 7:5. The head width is defined as the distance between the left and right ears. For ICAO compliance, the value must be in the range 50 to 75.
	 */
    int HeadImageWidthRatio;
	/**
	 * Value indicating if the head is correctly centered horizontally. For ICAO compliance, the value must be in the range 45 to 55.
	 */
    int HorizontalPosition;
	/**
	 * Value indicating if the image resolution is sufficient. The minimum recommended value is 90.
	 */
    int Resolution;
	/**
	 * Value indicating if the distance from the bottom edge of the image to the imaginary line passing through the center of the eyes is between 50% - 70% of the total vertical length of the image. For ICAO compliance, the value must be in the range 30 to 50.
	 */
    int VerticalPosition;
} id3FaceGeometricAttributes;

#ifdef __cplusplus
}
#endif

#endif
