//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceMatcherThreshold_h
#define _id3FaceMatcherThreshold_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceMatcherThreshold of the Face module.
 */
typedef enum id3FaceMatcherThreshold {
	/**
	 * False Match Rate = 1%
	 */
	id3FaceMatcherThreshold_Fmr100 = 2000,
	/**
	 * False Match Rate = 0.1% (1/1K)
	 */
	id3FaceMatcherThreshold_Fmr1000 = 3000,
	/**
	 * False Match Rate = 0.01% (1/10K)
	 */
	id3FaceMatcherThreshold_Fmr10000 = 4000,
	/**
	 * False Match Rate = 0.001% (1/100K)
	 */
	id3FaceMatcherThreshold_Fmr100000 = 5000,
	/**
	 * False Match Rate = 0.0001% (1/1M)
	 */
	id3FaceMatcherThreshold_Fmr1000000 = 6000,
	/**
	 * False Match Rate = 0.00001% (1/10M)
	 */
	id3FaceMatcherThreshold_Fmr10000000 = 7000,
	/**
	 * False Match Rate = 0.000001% (1/100M)
	 */
	id3FaceMatcherThreshold_Fmr100000000 = 8000,
	/**
	 * False Match Rate = 0.0000001% (1/1B)
	 */
	id3FaceMatcherThreshold_Fmr1000000000 = 9000,
	/**
	 * False Match Rate = 0.00000001% (1/10B)
	 */
	id3FaceMatcherThreshold_Fmr10000000000 = 10000,
} id3FaceMatcherThreshold;

#ifdef __cplusplus
}
#endif

#endif
