//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceEyeGaze_h
#define _id3FaceEyeGaze_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a EyeGaze object of the Face module.
 */
typedef struct id3FaceEyeGaze {
	/**
	 * Value indicating the gaze alongside the x-axis of the left eye. Values vary in the range [-1, +1]. The maximum recommended value for an ICAO-compliant portrait is +/-0.40.
	 */
    float LeftEyeXGaze;
	/**
	 * Value indicating the gaze alongside the y-axis of the left eye. Values vary in the range [-1, +1]. The maximum recommended value for an ICAO-compliant portrait is +/-0.40.
	 */
    float LeftEyeYGaze;
	/**
	 * Value indicating the gaze alongside the x-axis of the right eye. Values vary in the range [-1, +1]. The maximum recommended value for an ICAO-compliant portrait is +/-0.40.
	 */
    float RightEyeXGaze;
	/**
	 * Value indicating the gaze alongside the y-axis of the right eye. Values vary in the range [-1, +1]. The maximum recommended value for an ICAO-compliant portrait is +/-0.40.
	 */
    float RightEyeYGaze;
} id3FaceEyeGaze;

#ifdef __cplusplus
}
#endif

#endif
