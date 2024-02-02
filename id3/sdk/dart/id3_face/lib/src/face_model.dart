//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceModel of the Face module.
enum FaceModel {
	/// Face detector 3A. Highest accuracy detector in this SDK, mainly for server-based or offline applications.
	faceDetector3A,
	/// Face detector 3B. Light and accurate detector, mainly for mobile/embedded real-time detection/tracking applications.
	faceDetector3B,
	/// Face encoder 8A. Legacy model.
	faceEncoder8A,
	/// Face encoder 8B. Legacy model.
	faceEncoder8B,
	/// Face encoder 9A. Highest accuracy face encoder in this SDK, mainly for server-based 1:N applications.
	faceEncoder9A,
	/// Face encoder 8B. Light and accurate face encoder, mainly for mobile/embedded 1:1 applications.
	faceEncoder9B,
	/// Periocular encoder 2A. Highest accuracy periocular encoder in this SDK. Provides an efficient alternative to face encoders when people wear masks in server-based 1:N applications.
	facePeriocularEncoder2A,
	/// Face encoding quality estimator 3A.
	faceEncodingQualityEstimator3A,
	/// Face landmarks estimator 2A.
	faceLandmarksEstimator2A,
	/// Face age estimator 1A.
	faceAgeEstimator1A,
	/// Face attributes estimator 2A.
	faceAttributesClassifier2A,
	/// Face expression classifier 1A.
	faceExpressionClassifier1A,
	/// Eye openness detector 1A.
	eyeOpennessDetector1A,
	/// Eye redness detector 1A.
	eyeRednessDetector1A,
	/// Eye gaze estimator 2A.
	eyeGazeEstimator2A,
	/// Face background uniformity estimator 1A.
	faceBackgroundUniformity1A,
	/// Face mask classifier 2A.
	faceMaskClassifier2A,
	/// Face occlusion detector 1A.
	faceOcclusionDetector1A,
	/// Face pose estimator 1A.
	facePoseEstimator1A,
	/// Face color-based presentation attack detector (PAD) 1A.
	faceColorBasedPad1A,
	/// Face blurriness detector 1A.
	faceBlurrinessDetector1A,
	/// Face Moiré detector 1A.
	faceMoireDetector1A,
	/// Face attack support detector 1A.
	faceAttackSupportDetector1A,
	/// Face depth-based presentation attack detector (PAD) 2A.
	faceDepthBasedPad2A,
}

extension FaceModelX on FaceModel {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceModel.
  	static FaceModel fromValue(int value) {
    	switch (value) {
      	case 1001:
        	return FaceModel.faceDetector3A;
      	case 1002:
        	return FaceModel.faceDetector3B;
      	case 1102:
        	return FaceModel.faceEncoder8A;
      	case 1103:
        	return FaceModel.faceEncoder8B;
      	case 1104:
        	return FaceModel.faceEncoder9A;
      	case 1105:
        	return FaceModel.faceEncoder9B;
      	case 1152:
        	return FaceModel.facePeriocularEncoder2A;
      	case 1202:
        	return FaceModel.faceEncodingQualityEstimator3A;
      	case 1301:
        	return FaceModel.faceLandmarksEstimator2A;
      	case 1350:
        	return FaceModel.faceAgeEstimator1A;
      	case 1401:
        	return FaceModel.faceAttributesClassifier2A;
      	case 1450:
        	return FaceModel.faceExpressionClassifier1A;
      	case 1510:
        	return FaceModel.eyeOpennessDetector1A;
      	case 1520:
        	return FaceModel.eyeRednessDetector1A;
      	case 1531:
        	return FaceModel.eyeGazeEstimator2A;
      	case 1550:
        	return FaceModel.faceBackgroundUniformity1A;
      	case 1601:
        	return FaceModel.faceMaskClassifier2A;
      	case 1650:
        	return FaceModel.faceOcclusionDetector1A;
      	case 1700:
        	return FaceModel.facePoseEstimator1A;
      	case 1800:
        	return FaceModel.faceColorBasedPad1A;
      	case 1810:
        	return FaceModel.faceBlurrinessDetector1A;
      	case 1820:
        	return FaceModel.faceMoireDetector1A;
      	case 1830:
        	return FaceModel.faceAttackSupportDetector1A;
      	case 1850:
        	return FaceModel.faceDepthBasedPad2A;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceModel.faceDetector3A:
        	return 1001;
      	case FaceModel.faceDetector3B:
        	return 1002;
      	case FaceModel.faceEncoder8A:
        	return 1102;
      	case FaceModel.faceEncoder8B:
        	return 1103;
      	case FaceModel.faceEncoder9A:
        	return 1104;
      	case FaceModel.faceEncoder9B:
        	return 1105;
      	case FaceModel.facePeriocularEncoder2A:
        	return 1152;
      	case FaceModel.faceEncodingQualityEstimator3A:
        	return 1202;
      	case FaceModel.faceLandmarksEstimator2A:
        	return 1301;
      	case FaceModel.faceAgeEstimator1A:
        	return 1350;
      	case FaceModel.faceAttributesClassifier2A:
        	return 1401;
      	case FaceModel.faceExpressionClassifier1A:
        	return 1450;
      	case FaceModel.eyeOpennessDetector1A:
        	return 1510;
      	case FaceModel.eyeRednessDetector1A:
        	return 1520;
      	case FaceModel.eyeGazeEstimator2A:
        	return 1531;
      	case FaceModel.faceBackgroundUniformity1A:
        	return 1550;
      	case FaceModel.faceMaskClassifier2A:
        	return 1601;
      	case FaceModel.faceOcclusionDetector1A:
        	return 1650;
      	case FaceModel.facePoseEstimator1A:
        	return 1700;
      	case FaceModel.faceColorBasedPad1A:
        	return 1800;
      	case FaceModel.faceBlurrinessDetector1A:
        	return 1810;
      	case FaceModel.faceMoireDetector1A:
        	return 1820;
      	case FaceModel.faceAttackSupportDetector1A:
        	return 1830;
      	case FaceModel.faceDepthBasedPad2A:
        	return 1850;
		}
  	}
}
