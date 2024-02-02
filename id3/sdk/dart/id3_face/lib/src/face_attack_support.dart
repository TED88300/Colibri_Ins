//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceAttackSupport of the Face module.
enum FaceAttackSupport {
	/// No attack support.
	none,
	/// ID card support.
	idCard,
	/// Screen support (includes smartphones, tablets, laptops, etc).
	screen,
}

extension FaceAttackSupportX on FaceAttackSupport {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceAttackSupport.
  	static FaceAttackSupport fromValue(int value) {
    	switch (value) {
      	case 0:
        	return FaceAttackSupport.none;
      	case 1:
        	return FaceAttackSupport.idCard;
      	case 2:
        	return FaceAttackSupport.screen;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceAttackSupport.none:
        	return 0;
      	case FaceAttackSupport.idCard:
        	return 1;
      	case FaceAttackSupport.screen:
        	return 2;
		}
  	}
}
