//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceModel_h
#define _id3FaceModel_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceModel of the Face module.
 */
typedef enum id3FaceModel {
	/**
	 * Face detector 3A. Highest accuracy detector in this SDK, mainly for server-based or offline applications.
	 */
	id3FaceModel_FaceDetector3A = 1001,
	/**
	 * Face detector 3B. Light and accurate detector, mainly for mobile/embedded real-time detection/tracking applications.
	 */
	id3FaceModel_FaceDetector3B = 1002,
	/**
	 * Face encoder 8A. Legacy model.
	 */
	id3FaceModel_FaceEncoder8A = 1102,
	/**
	 * Face encoder 8B. Legacy model.
	 */
	id3FaceModel_FaceEncoder8B = 1103,
	/**
	 * Face encoder 9A. Highest accuracy face encoder in this SDK, mainly for server-based 1:N applications.
	 */
	id3FaceModel_FaceEncoder9A = 1104,
	/**
	 * Face encoder 8B. Light and accurate face encoder, mainly for mobile/embedded 1:1 applications.
	 */
	id3FaceModel_FaceEncoder9B = 1105,
	/**
	 * Periocular encoder 2A. Highest accuracy periocular encoder in this SDK. Provides an efficient alternative to face encoders when people wear masks in server-based 1:N applications.
	 */
	id3FaceModel_FacePeriocularEncoder2A = 1152,
	/**
	 * Face encoding quality estimator 3A.
	 */
	id3FaceModel_FaceEncodingQualityEstimator3A = 1202,
	/**
	 * Face landmarks estimator 2A.
	 */
	id3FaceModel_FaceLandmarksEstimator2A = 1301,
	/**
	 * Face age estimator 1A.
	 */
	id3FaceModel_FaceAgeEstimator1A = 1350,
	/**
	 * Face attributes estimator 2A.
	 */
	id3FaceModel_FaceAttributesClassifier2A = 1401,
	/**
	 * Face expression classifier 1A.
	 */
	id3FaceModel_FaceExpressionClassifier1A = 1450,
	/**
	 * Eye openness detector 1A.
	 */
	id3FaceModel_EyeOpennessDetector1A = 1510,
	/**
	 * Eye redness detector 1A.
	 */
	id3FaceModel_EyeRednessDetector1A = 1520,
	/**
	 * Eye gaze estimator 2A.
	 */
	id3FaceModel_EyeGazeEstimator2A = 1531,
	/**
	 * Face background uniformity estimator 1A.
	 */
	id3FaceModel_FaceBackgroundUniformity1A = 1550,
	/**
	 * Face mask classifier 2A.
	 */
	id3FaceModel_FaceMaskClassifier2A = 1601,
	/**
	 * Face occlusion detector 1A.
	 */
	id3FaceModel_FaceOcclusionDetector1A = 1650,
	/**
	 * Face pose estimator 1A.
	 */
	id3FaceModel_FacePoseEstimator1A = 1700,
	/**
	 * Face color-based presentation attack detector (PAD) 1A.
	 */
	id3FaceModel_FaceColorBasedPad1A = 1800,
	/**
	 * Face blurriness detector 1A.
	 */
	id3FaceModel_FaceBlurrinessDetector1A = 1810,
	/**
	 * Face Moiré detector 1A.
	 */
	id3FaceModel_FaceMoireDetector1A = 1820,
	/**
	 * Face attack support detector 1A.
	 */
	id3FaceModel_FaceAttackSupportDetector1A = 1830,
	/**
	 * Face depth-based presentation attack detector (PAD) 2A.
	 */
	id3FaceModel_FaceDepthBasedPad2A = 1850,
} id3FaceModel;

#ifdef __cplusplus
}
#endif

#endif
