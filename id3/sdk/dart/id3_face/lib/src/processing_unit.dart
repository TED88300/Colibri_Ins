//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a ProcessingUnit of the Face module.
enum ProcessingUnit {
	/// CPU.
	cpu,
	/// GPU.
	gpu,
}

extension ProcessingUnitX on ProcessingUnit {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created ProcessingUnit.
  	static ProcessingUnit fromValue(int value) {
    	switch (value) {
      	case 0:
        	return ProcessingUnit.cpu;
      	case 1:
        	return ProcessingUnit.gpu;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case ProcessingUnit.cpu:
        	return 0;
      	case ProcessingUnit.gpu:
        	return 1;
		}
  	}
}
