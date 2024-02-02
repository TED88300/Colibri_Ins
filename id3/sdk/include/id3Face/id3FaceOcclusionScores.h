//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceOcclusionScores_h
#define _id3FaceOcclusionScores_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a FaceOcclusionScores object of the Face module.
 */
typedef struct id3FaceOcclusionScores {
	/**
	 * Value indicating whether the left eye is occluded or not. 100 means that the left eye is definitely occluded. The maximum recommended value is 50.
	 */
    int LeftEyeOcclusionScore;
	/**
	 * Value indicating whether the mouth is occluded or not. 100 means that the mouth is definitely occluded. The maximum recommended value is 30.
	 */
    int MouthOcclusionScore;
	/**
	 * Value indicating whether the nose is occluded or not. 100 means that the nose is definitely occluded. The maximum recommended value is 50.
	 */
    int NoseOcclusionScore;
	/**
	 * Value indicating whether the right eye is occluded or not. 100 means that the right eye is definitely occluded. The maximum recommended value is 50.
	 */
    int RightEyeOcclusionScore;
} id3FaceOcclusionScores;

#ifdef __cplusplus
}
#endif

#endif
