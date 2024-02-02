//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePhotographicAttributes_h
#define _id3FacePhotographicAttributes_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a PhotographicAttributes object of the Face module.
 */
typedef struct id3FacePhotographicAttributes {
	/**
	 * Value indicating if the image brightness is sufficient. The higher the better.
	 */
    int Brightness;
	/**
	 * Value indicating if one side of the face is ligther than the other side. The lower the better.
	 */
    int EqualBrightness;
	/**
	 * Value indicating if the contrast of the face is fine. The minimum recommended value is 110.
	 */
    int FaceContrast;
	/**
	 * Value indicating if a flash reflection is present on the face. The lower the better. The maximum recommended value is 70.
	 */
    int FlashReflection;
	/**
	 * Value indicating if the skin is natural. The minimum recommended value is 10.
	 */
    int NaturalSkinColor;
	/**
	 * Value indicating if the image is pixelized. The lower the better. The maximum recommended value is 50.
	 */
    int Pixelation;
	/**
	 * Value indicating if the image sharpness is sufficient. The higher the better. The minimum recommended value is 40.
	 */
    int Sharpness;
} id3FacePhotographicAttributes;

#ifdef __cplusplus
}
#endif

#endif
