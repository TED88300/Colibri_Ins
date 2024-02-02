//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3DetectedFaceAttackSupport_h
#define _id3DetectedFaceAttackSupport_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceAttackSupport.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a DetectedFaceAttackSupport object of the Face module.
 */
typedef struct id3DetectedFaceAttackSupport {
	/**
	 * Attack support type.
	 */
    id3FaceAttackSupport AttackSupport;
	/**
	 * Confidence score of the detected attack support. In the range [0:100].
	 */
    int Score;
} id3DetectedFaceAttackSupport;

#ifdef __cplusplus
}
#endif

#endif
