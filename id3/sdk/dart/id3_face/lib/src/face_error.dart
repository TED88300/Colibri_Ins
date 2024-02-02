//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a FaceError of the Face module.
enum FaceError {
	/// No error.
	success,
	/// Base error code of the Face module.
	base,
	/// Minimum error code of the Face module.
	minimum,
	/// The handle is invalid.
	invalidHandle,
	/// The parameter is invalid.
	invalidParameter,
	/// The given buffer is too small.
	insufficientBuffer,
	/// The image pixel format is invalid.
	invalidPixelFormat,
	/// The template format is invalid.
	invalidTemplateFormat,
	/// The computed landmarks are invalid and do not allow to process the desired information.
	invalidLandmarks,
	/// The computed interocular distance (IOD) is invalid and does not allow to process the desired information.
	invalidIod,
	/// The model could not be found in the given directory path.
	invalidModelPath,
	/// The model which is required for this operation was not loaded.
	unloadedModel,
	/// The inference backend failed to infer, probably due to inconsistent input.
	inferenceBackendError,
}

extension FaceErrorX on FaceError {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created FaceError.
  	static FaceError fromValue(int value) {
    	switch (value) {
      	case 0:
        	return FaceError.success;
      	case -1000:
        	return FaceError.base;
      	case -1999:
        	return FaceError.minimum;
      	case -1001:
        	return FaceError.invalidHandle;
      	case -1002:
        	return FaceError.invalidParameter;
      	case -1003:
        	return FaceError.insufficientBuffer;
      	case -1004:
        	return FaceError.invalidPixelFormat;
      	case -1005:
        	return FaceError.invalidTemplateFormat;
      	case -1006:
        	return FaceError.invalidLandmarks;
      	case -1007:
        	return FaceError.invalidIod;
      	case -1008:
        	return FaceError.invalidModelPath;
      	case -1020:
        	return FaceError.unloadedModel;
      	case -1040:
        	return FaceError.inferenceBackendError;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case FaceError.success:
        	return 0;
      	case FaceError.base:
        	return -1000;
      	case FaceError.minimum:
        	return -1999;
      	case FaceError.invalidHandle:
        	return -1001;
      	case FaceError.invalidParameter:
        	return -1002;
      	case FaceError.insufficientBuffer:
        	return -1003;
      	case FaceError.invalidPixelFormat:
        	return -1004;
      	case FaceError.invalidTemplateFormat:
        	return -1005;
      	case FaceError.invalidLandmarks:
        	return -1006;
      	case FaceError.invalidIod:
        	return -1007;
      	case FaceError.invalidModelPath:
        	return -1008;
      	case FaceError.unloadedModel:
        	return -1020;
      	case FaceError.inferenceBackendError:
        	return -1040;
		}
  	}
}
