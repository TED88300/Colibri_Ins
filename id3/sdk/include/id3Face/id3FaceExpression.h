//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceExpression_h
#define _id3FaceExpression_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceExpression of the Face module.
 */
typedef enum id3FaceExpression {
	/**
	 * Angriness.
	 */
	id3FaceExpression_Angriness = 1,
	/**
	 * Disgust.
	 */
	id3FaceExpression_Disgust = 2,
	/**
	 * Fear.
	 */
	id3FaceExpression_Fear = 3,
	/**
	 * Happiness.
	 */
	id3FaceExpression_Happiness = 4,
	/**
	 * Neutrality.
	 */
	id3FaceExpression_Neutrality = 5,
	/**
	 * Sadness.
	 */
	id3FaceExpression_Sadness = 6,
	/**
	 * Surprise.
	 */
	id3FaceExpression_Surprise = 7,
} id3FaceExpression;

#ifdef __cplusplus
}
#endif

#endif
