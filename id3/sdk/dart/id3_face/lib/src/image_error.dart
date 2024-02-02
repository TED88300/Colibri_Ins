//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a ImageError of the Face module.
enum ImageError {
	/// No error.
	success,
	/// Base error code for Image module.
	base,
	/// Minimum error code for Image module.
	minimum,
	/// The handle is invalid.
	invalidHandle,
	/// The parameter is invalid.
	invalidParameter,
	/// The given buffer is too small.
	insufficientBuffer,
	/// The image sizes are not compatible for the requested operation.
	imageSizeMismatch,
	/// The pixel formats are not compatible.
	pixelFormatMismatch,
	/// The given key is already used in the dictionary. Multiple values per key is not supported.
	keyAlreadyExists,
	/// The given key is not present in the dictionary.
	keyNotFound,
	/// The required pixel format is not correct.
	invalidPixelFormat,
}

extension ImageErrorX on ImageError {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created ImageError.
  	static ImageError fromValue(int value) {
    	switch (value) {
      	case 0:
        	return ImageError.success;
      	case -3000:
        	return ImageError.base;
      	case -3999:
        	return ImageError.minimum;
      	case -3001:
        	return ImageError.invalidHandle;
      	case -3002:
        	return ImageError.invalidParameter;
      	case -3003:
        	return ImageError.insufficientBuffer;
      	case -3004:
        	return ImageError.imageSizeMismatch;
      	case -3005:
        	return ImageError.pixelFormatMismatch;
      	case -3006:
        	return ImageError.keyAlreadyExists;
      	case -3007:
        	return ImageError.keyNotFound;
      	case -3008:
        	return ImageError.invalidPixelFormat;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case ImageError.success:
        	return 0;
      	case ImageError.base:
        	return -3000;
      	case ImageError.minimum:
        	return -3999;
      	case ImageError.invalidHandle:
        	return -3001;
      	case ImageError.invalidParameter:
        	return -3002;
      	case ImageError.insufficientBuffer:
        	return -3003;
      	case ImageError.imageSizeMismatch:
        	return -3004;
      	case ImageError.pixelFormatMismatch:
        	return -3005;
      	case ImageError.keyAlreadyExists:
        	return -3006;
      	case ImageError.keyNotFound:
        	return -3007;
      	case ImageError.invalidPixelFormat:
        	return -3008;
		}
  	}
}
