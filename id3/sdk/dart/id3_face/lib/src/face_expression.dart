//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceExpression of the Face module.
enum FaceExpression {
	/// Angriness.
	angriness,
	/// Disgust.
	disgust,
	/// Fear.
	fear,
	/// Happiness.
	happiness,
	/// Neutrality.
	neutrality,
	/// Sadness.
	sadness,
	/// Surprise.
	surprise,
}

extension FaceExpressionX on FaceExpression {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceExpression.
  	static FaceExpression fromValue(int value) {
    	switch (value) {
      	case 1:
        	return FaceExpression.angriness;
      	case 2:
        	return FaceExpression.disgust;
      	case 3:
        	return FaceExpression.fear;
      	case 4:
        	return FaceExpression.happiness;
      	case 5:
        	return FaceExpression.neutrality;
      	case 6:
        	return FaceExpression.sadness;
      	case 7:
        	return FaceExpression.surprise;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceExpression.angriness:
        	return 1;
      	case FaceExpression.disgust:
        	return 2;
      	case FaceExpression.fear:
        	return 3;
      	case FaceExpression.happiness:
        	return 4;
      	case FaceExpression.neutrality:
        	return 5;
      	case FaceExpression.sadness:
        	return 6;
      	case FaceExpression.surprise:
        	return 7;
		}
  	}
}
