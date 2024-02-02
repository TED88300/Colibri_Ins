//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceMatcherThreshold of the Face module.
enum FaceMatcherThreshold {
	/// False Match Rate = 1%
	fmr100,
	/// False Match Rate = 0.1% (1/1K)
	fmr1000,
	/// False Match Rate = 0.01% (1/10K)
	fmr10000,
	/// False Match Rate = 0.001% (1/100K)
	fmr100000,
	/// False Match Rate = 0.0001% (1/1M)
	fmr1000000,
	/// False Match Rate = 0.00001% (1/10M)
	fmr10000000,
	/// False Match Rate = 0.000001% (1/100M)
	fmr100000000,
	/// False Match Rate = 0.0000001% (1/1B)
	fmr1000000000,
	/// False Match Rate = 0.00000001% (1/10B)
	fmr10000000000,
}

extension FaceMatcherThresholdX on FaceMatcherThreshold {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceMatcherThreshold.
  	static FaceMatcherThreshold fromValue(int value) {
    	switch (value) {
      	case 2000:
        	return FaceMatcherThreshold.fmr100;
      	case 3000:
        	return FaceMatcherThreshold.fmr1000;
      	case 4000:
        	return FaceMatcherThreshold.fmr10000;
      	case 5000:
        	return FaceMatcherThreshold.fmr100000;
      	case 6000:
        	return FaceMatcherThreshold.fmr1000000;
      	case 7000:
        	return FaceMatcherThreshold.fmr10000000;
      	case 8000:
        	return FaceMatcherThreshold.fmr100000000;
      	case 9000:
        	return FaceMatcherThreshold.fmr1000000000;
      	case 10000:
        	return FaceMatcherThreshold.fmr10000000000;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceMatcherThreshold.fmr100:
        	return 2000;
      	case FaceMatcherThreshold.fmr1000:
        	return 3000;
      	case FaceMatcherThreshold.fmr10000:
        	return 4000;
      	case FaceMatcherThreshold.fmr100000:
        	return 5000;
      	case FaceMatcherThreshold.fmr1000000:
        	return 6000;
      	case FaceMatcherThreshold.fmr10000000:
        	return 7000;
      	case FaceMatcherThreshold.fmr100000000:
        	return 8000;
      	case FaceMatcherThreshold.fmr1000000000:
        	return 9000;
      	case FaceMatcherThreshold.fmr10000000000:
        	return 10000;
		}
  	}
}
