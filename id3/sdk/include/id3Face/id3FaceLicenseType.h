//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceLicenseType_h
#define _id3FaceLicenseType_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a LicenseType of the Face module.
 */
typedef enum id3FaceLicenseType {
	/**
	 * Classic id3 license.
	 */
	id3FaceLicenseType_Classic = 1,
	/**
	 * Trial id3 license with a time limitation.
	 */
	id3FaceLicenseType_Trial = 2,
	/**
	 * Online id3 license with an online check.
	 */
	id3FaceLicenseType_Online = 3,
} id3FaceLicenseType;

#ifdef __cplusplus
}
#endif

#endif
