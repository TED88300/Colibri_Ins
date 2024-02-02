//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceTemplateFormat of the Face module.
enum FaceTemplateFormat {
	/// Undefined template format.
	undefined,
	/// Template generated with model FaceEncoder8A.
	v8a,
	/// Template generated with model FaceEncoder8B.
	v8b,
	/// Template generated with model FaceEncoder9A.
	v9a,
	/// Template generated with model FaceEncoder9B.
	v9b,
	/// Template generated with model FacePeriocularEncoder2A.
	periocularV2A,
	/// Template generated with model FacePeriocularEncoder2B.
	periocularV2B,
}

extension FaceTemplateFormatX on FaceTemplateFormat {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceTemplateFormat.
  	static FaceTemplateFormat fromValue(int value) {
    	switch (value) {
      	case 0x0000:
        	return FaceTemplateFormat.undefined;
      	case 0x218A:
        	return FaceTemplateFormat.v8a;
      	case 0x218B:
        	return FaceTemplateFormat.v8b;
      	case 0x219A:
        	return FaceTemplateFormat.v9a;
      	case 0x219B:
        	return FaceTemplateFormat.v9b;
      	case 0x222A:
        	return FaceTemplateFormat.periocularV2A;
      	case 0x222B:
        	return FaceTemplateFormat.periocularV2B;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceTemplateFormat.undefined:
        	return 0x0000;
      	case FaceTemplateFormat.v8a:
        	return 0x218A;
      	case FaceTemplateFormat.v8b:
        	return 0x218B;
      	case FaceTemplateFormat.v9a:
        	return 0x219A;
      	case FaceTemplateFormat.v9b:
        	return 0x219B;
      	case FaceTemplateFormat.periocularV2A:
        	return 0x222A;
      	case FaceTemplateFormat.periocularV2B:
        	return 0x222B;
		}
  	}
}
