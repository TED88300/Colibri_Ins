//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceTemplateBufferType of the Face module.
enum FaceTemplateBufferType {
	/// Standard face template buffer type.
	normal,
	/// Card compact face template buffer type. For match-on-card enrolment applications, this buffer type is mandatory.
	card,
}

extension FaceTemplateBufferTypeX on FaceTemplateBufferType {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceTemplateBufferType.
  	static FaceTemplateBufferType fromValue(int value) {
    	switch (value) {
      	case 0:
        	return FaceTemplateBufferType.normal;
      	case 1:
        	return FaceTemplateBufferType.card;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceTemplateBufferType.normal:
        	return 0;
      	case FaceTemplateBufferType.card:
        	return 1;
		}
  	}
}
