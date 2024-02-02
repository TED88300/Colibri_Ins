//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceLicenseHardwareCodeType_h
#define _id3FaceLicenseHardwareCodeType_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a LicenseHardwareCodeType of the Face module.
 */
typedef enum id3FaceLicenseHardwareCodeType {
	/**
	 * License locked on Windows OS.
	 */
	id3FaceLicenseHardwareCodeType_WindowsOs = 1,
	/**
	 * License locked on Windows USB stick.
	 */
	id3FaceLicenseHardwareCodeType_WindowsUsb = 11,
	/**
	 * License locked on Linux OS.
	 */
	id3FaceLicenseHardwareCodeType_LinuxOs = 3,
	/**
	 * License locked on Android device.
	 */
	id3FaceLicenseHardwareCodeType_Android = 5,
	/**
	 * License locked on Android application package name.
	 */
	id3FaceLicenseHardwareCodeType_AndroidPackageName = 6,
	/**
	 * License locked on iOS device.
	 */
	id3FaceLicenseHardwareCodeType_Ios = 7,
	/**
	 * License locked on macOS.
	 */
	id3FaceLicenseHardwareCodeType_Macos = 8,
	/**
	 * License locked on Jetson Nano.
	 */
	id3FaceLicenseHardwareCodeType_JetsonNano = 9,
	/**
	 * License locked on iOS application Bundle ID.
	 */
	id3FaceLicenseHardwareCodeType_IosBundleid = 10,
} id3FaceLicenseHardwareCodeType;

#ifdef __cplusplus
}
#endif

#endif
