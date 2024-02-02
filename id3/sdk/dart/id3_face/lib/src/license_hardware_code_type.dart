//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a LicenseHardwareCodeType of the Face module.
enum LicenseHardwareCodeType {
	/// License locked on Windows OS.
	windowsOs,
	/// License locked on Windows USB stick.
	windowsUsb,
	/// License locked on Linux OS.
	linuxOs,
	/// License locked on Android device.
	android,
	/// License locked on Android application package name.
	androidPackageName,
	/// License locked on iOS device.
	iOS,
	/// License locked on macOS.
	macOS,
	/// License locked on Jetson Nano.
	jetsonNano,
	/// License locked on iOS application Bundle ID.
	iOSBundleid,
}

extension LicenseHardwareCodeTypeX on LicenseHardwareCodeType {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created LicenseHardwareCodeType.
  	static LicenseHardwareCodeType fromValue(int value) {
    	switch (value) {
      	case 1:
        	return LicenseHardwareCodeType.windowsOs;
      	case 11:
        	return LicenseHardwareCodeType.windowsUsb;
      	case 3:
        	return LicenseHardwareCodeType.linuxOs;
      	case 5:
        	return LicenseHardwareCodeType.android;
      	case 6:
        	return LicenseHardwareCodeType.androidPackageName;
      	case 7:
        	return LicenseHardwareCodeType.iOS;
      	case 8:
        	return LicenseHardwareCodeType.macOS;
      	case 9:
        	return LicenseHardwareCodeType.jetsonNano;
      	case 10:
        	return LicenseHardwareCodeType.iOSBundleid;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case LicenseHardwareCodeType.windowsOs:
        	return 1;
      	case LicenseHardwareCodeType.windowsUsb:
        	return 11;
      	case LicenseHardwareCodeType.linuxOs:
        	return 3;
      	case LicenseHardwareCodeType.android:
        	return 5;
      	case LicenseHardwareCodeType.androidPackageName:
        	return 6;
      	case LicenseHardwareCodeType.iOS:
        	return 7;
      	case LicenseHardwareCodeType.macOS:
        	return 8;
      	case LicenseHardwareCodeType.jetsonNano:
        	return 9;
      	case LicenseHardwareCodeType.iOSBundleid:
        	return 10;
		}
  	}
}
