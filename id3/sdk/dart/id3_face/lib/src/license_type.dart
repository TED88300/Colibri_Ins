//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a LicenseType of the Face module.
enum LicenseType {
	/// Classic id3 license.
	classic,
	/// Trial id3 license with a time limitation.
	trial,
	/// Online id3 license with an online check.
	online,
}

extension LicenseTypeX on LicenseType {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created LicenseType.
  	static LicenseType fromValue(int value) {
    	switch (value) {
      	case 1:
        	return LicenseType.classic;
      	case 2:
        	return LicenseType.trial;
      	case 3:
        	return LicenseType.online;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case LicenseType.classic:
        	return 1;
      	case LicenseType.trial:
        	return 2;
      	case LicenseType.online:
        	return 3;
		}
  	}
}
