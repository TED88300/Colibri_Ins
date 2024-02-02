//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a ImageFormat of the Face module.
enum ImageFormat {
	/// BMP.
	bmp,
	/// JPEG.
	jpeg,
	/// PNG.
	png,
	/// Tiff.
	tiff,
	/// JPEG 2000.
	jpeg_2000,
	/// WEBP.
	webp,
	/// Raw.
	raw,
}

extension ImageFormatX on ImageFormat {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created ImageFormat.
  	static ImageFormat fromValue(int value) {
    	switch (value) {
      	case 0:
        	return ImageFormat.bmp;
      	case 2:
        	return ImageFormat.jpeg;
      	case 13:
        	return ImageFormat.png;
      	case 18:
        	return ImageFormat.tiff;
      	case 30:
        	return ImageFormat.jpeg_2000;
      	case 31:
        	return ImageFormat.webp;
      	case 34:
        	return ImageFormat.raw;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case ImageFormat.bmp:
        	return 0;
      	case ImageFormat.jpeg:
        	return 2;
      	case ImageFormat.png:
        	return 13;
      	case ImageFormat.tiff:
        	return 18;
      	case ImageFormat.jpeg_2000:
        	return 30;
      	case ImageFormat.webp:
        	return 31;
      	case ImageFormat.raw:
        	return 34;
		}
  	}
}
