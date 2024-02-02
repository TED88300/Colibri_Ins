//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a PixelFormat of the Face module.
enum PixelFormat {
	/// Undefined.
	undefined,
	/// 8-bits grayscale.
	grayscale8Bits,
	/// 16-bits grayscale.
	grayscale16Bits,
	/// Floating point grayscale.
	grayscaleFloat,
	/// 24 bits BGR.
	bgr24Bits,
	/// 24 bits RGB.
	rgb24Bits,
	/// 32 bits BGRA.
	bgra,
	/// NV12 (YUV semi-planar format).
	nv12,
	/// I420 (YUV packed format).
	i420,
	/// YUY2 (YUV packed format).
	yuy2,
}

extension PixelFormatX on PixelFormat {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created PixelFormat.
  	static PixelFormat fromValue(int value) {
    	switch (value) {
      	case 0:
        	return PixelFormat.undefined;
      	case 10:
        	return PixelFormat.grayscale8Bits;
      	case 20:
        	return PixelFormat.grayscale16Bits;
      	case 25:
        	return PixelFormat.grayscaleFloat;
      	case 30:
        	return PixelFormat.bgr24Bits;
      	case 31:
        	return PixelFormat.rgb24Bits;
      	case 32:
        	return PixelFormat.bgra;
      	case 40:
        	return PixelFormat.nv12;
      	case 41:
        	return PixelFormat.i420;
      	case 42:
        	return PixelFormat.yuy2;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case PixelFormat.undefined:
        	return 0;
      	case PixelFormat.grayscale8Bits:
        	return 10;
      	case PixelFormat.grayscale16Bits:
        	return 20;
      	case PixelFormat.grayscaleFloat:
        	return 25;
      	case PixelFormat.bgr24Bits:
        	return 30;
      	case PixelFormat.rgb24Bits:
        	return 31;
      	case PixelFormat.bgra:
        	return 32;
      	case PixelFormat.nv12:
        	return 40;
      	case PixelFormat.i420:
        	return 41;
      	case PixelFormat.yuy2:
        	return 42;
		}
  	}
}
