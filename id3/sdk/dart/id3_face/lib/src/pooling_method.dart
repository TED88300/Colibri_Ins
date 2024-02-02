//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a PoolingMethod of the Face module.
enum PoolingMethod {
	/// Average pooling method. Merges instances (scores, templates, etc) into one.
	average,
	/// Maximum pooling method. Selects best instance according to a given metric.
	maximum,
}

extension PoolingMethodX on PoolingMethod {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created PoolingMethod.
  	static PoolingMethod fromValue(int value) {
    	switch (value) {
      	case 0:
        	return PoolingMethod.average;
      	case 1:
        	return PoolingMethod.maximum;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case PoolingMethod.average:
        	return 0;
      	case PoolingMethod.maximum:
        	return 1;
		}
  	}
}
