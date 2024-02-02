//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceLicenseError_h
#define _id3FaceLicenseError_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a LicenseError of the Face module.
 */
typedef enum id3FaceLicenseError {
	/**
	 * No error.
	 */
	id3FaceLicenseError_Success = 0,
	/**
	 * Base error code of the License module.
	 */
	id3FaceLicenseError_Base = 1,
	/**
	 * Minimum error code of the License module.
	 */
	id3FaceLicenseError_Minimum = -999,
	/**
	 * No license was found.
	 */
	id3FaceLicenseError_LicenseNotFound = -1,
	/**
	 * License is not valid or a required module is not licensed.
	 */
	id3FaceLicenseError_InvalidLicense = -2,
	/**
	 * The license has expired.
	 */
	id3FaceLicenseError_ExpiredLicense = -3,
	/**
	 * Installation code does not match hardware ID.
	 */
	id3FaceLicenseError_InvalidHardwareId = -4,
	/**
	 * The license is already fulfilled by another user (or computer).
	 */
	id3FaceLicenseError_AlreadyFulfilled = -5,
	/**
	 * A required module is not licensed or the usage limit has been reached.
	 */
	id3FaceLicenseError_ModuleError = -6,
	/**
	 * The license file cannot be accessed in write mode.
	 */
	id3FaceLicenseError_WriteError = -7,
	/**
	 * The given buffer is too small.
	 */
	id3FaceLicenseError_InsufficientBuffer = -8,
	/**
	 * The handle is invalid.
	 */
	id3FaceLicenseError_InvalidHandle = -10,
	/**
	 * One of the parameters is incorrect.
	 */
	id3FaceLicenseError_InvalidParameter = -11,
	/**
	 * The number of available licenses has been reached. There isn't any available license remaining.
	 */
	id3FaceLicenseError_InsufficientLicenseCredits = -12,
	/**
	 * The serial is invalid.
	 */
	id3FaceLicenseError_InvalidSerial = -13,
	/**
	 * Invalid login or password.
	 */
	id3FaceLicenseError_InvalidCredentials = -15,
	/**
	 * The license is revoked or does not exist anymore.
	 */
	id3FaceLicenseError_RevokedLicense = -16,
	/**
	 * The license is blocked after a predefined period.
	 */
	id3FaceLicenseError_BlockedLicense = -19,
	/**
	 * The license server is currently unreachable.
	 */
	id3FaceLicenseError_UnreachableServer = -20,
	/**
	 * An unexpected error happened.
	 */
	id3FaceLicenseError_LicenseOtherError = -100,
	/**
	 * No license file was provided.
	 */
	id3FaceLicenseError_MissingFile = -127,
	/**
	 * This device is not compatible with id3 licensing system.
	 */
	id3FaceLicenseError_DeviceNotCompatible = -128,
} id3FaceLicenseError;

#ifdef __cplusplus
}
#endif

#endif
