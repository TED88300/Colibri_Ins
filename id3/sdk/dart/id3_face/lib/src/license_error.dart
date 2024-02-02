//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------

/// Enumeration of the possible values for a LicenseError of the Face module.
enum LicenseError {
	/// No error.
	success,
	/// Base error code of the License module.
	base,
	/// Minimum error code of the License module.
	minimum,
	/// No license was found.
	licenseNotFound,
	/// License is not valid or a required module is not licensed.
	invalidLicense,
	/// The license has expired.
	expiredLicense,
	/// Installation code does not match hardware ID.
	invalidHardwareId,
	/// The license is already fulfilled by another user (or computer).
	alreadyFulfilled,
	/// A required module is not licensed or the usage limit has been reached.
	moduleError,
	/// The license file cannot be accessed in write mode.
	writeError,
	/// The given buffer is too small.
	insufficientBuffer,
	/// The handle is invalid.
	invalidHandle,
	/// One of the parameters is incorrect.
	invalidParameter,
	/// The number of available licenses has been reached. There isn't any available license remaining.
	insufficientLicenseCredits,
	/// The serial is invalid.
	invalidSerial,
	/// Invalid login or password.
	invalidCredentials,
	/// The license is revoked or does not exist anymore.
	revokedLicense,
	/// The license is blocked after a predefined period.
	blockedLicense,
	/// The license server is currently unreachable.
	unreachableServer,
	/// An unexpected error happened.
	licenseOtherError,
	/// No license file was provided.
	missingFile,
	/// This device is not compatible with id3 licensing system.
	deviceNotCompatible,
}

extension LicenseErrorX on LicenseError {
	/// Creates an enumeration value from int.
	/// param value The int value.
	/// return The created LicenseError.
  	static LicenseError fromValue(int value) {
    	switch (value) {
      	case 0:
        	return LicenseError.success;
      	case 1:
        	return LicenseError.base;
      	case -999:
        	return LicenseError.minimum;
      	case -1:
        	return LicenseError.licenseNotFound;
      	case -2:
        	return LicenseError.invalidLicense;
      	case -3:
        	return LicenseError.expiredLicense;
      	case -4:
        	return LicenseError.invalidHardwareId;
      	case -5:
        	return LicenseError.alreadyFulfilled;
      	case -6:
        	return LicenseError.moduleError;
      	case -7:
        	return LicenseError.writeError;
      	case -8:
        	return LicenseError.insufficientBuffer;
      	case -10:
        	return LicenseError.invalidHandle;
      	case -11:
        	return LicenseError.invalidParameter;
      	case -12:
        	return LicenseError.insufficientLicenseCredits;
      	case -13:
        	return LicenseError.invalidSerial;
      	case -15:
        	return LicenseError.invalidCredentials;
      	case -16:
        	return LicenseError.revokedLicense;
      	case -19:
        	return LicenseError.blockedLicense;
      	case -20:
        	return LicenseError.unreachableServer;
      	case -100:
        	return LicenseError.licenseOtherError;
      	case -127:
        	return LicenseError.missingFile;
      	case -128:
        	return LicenseError.deviceNotCompatible;
	    default:
        	throw Exception("Unable to find the specified enum value for $value");
    	}
  	}

	/// Gets the enumeration value as int.
	/// return The value.
  	int get value {
    	switch (this) {
      	case LicenseError.success:
        	return 0;
      	case LicenseError.base:
        	return 1;
      	case LicenseError.minimum:
        	return -999;
      	case LicenseError.licenseNotFound:
        	return -1;
      	case LicenseError.invalidLicense:
        	return -2;
      	case LicenseError.expiredLicense:
        	return -3;
      	case LicenseError.invalidHardwareId:
        	return -4;
      	case LicenseError.alreadyFulfilled:
        	return -5;
      	case LicenseError.moduleError:
        	return -6;
      	case LicenseError.writeError:
        	return -7;
      	case LicenseError.insufficientBuffer:
        	return -8;
      	case LicenseError.invalidHandle:
        	return -10;
      	case LicenseError.invalidParameter:
        	return -11;
      	case LicenseError.insufficientLicenseCredits:
        	return -12;
      	case LicenseError.invalidSerial:
        	return -13;
      	case LicenseError.invalidCredentials:
        	return -15;
      	case LicenseError.revokedLicense:
        	return -16;
      	case LicenseError.blockedLicense:
        	return -19;
      	case LicenseError.unreachableServer:
        	return -20;
      	case LicenseError.licenseOtherError:
        	return -100;
      	case LicenseError.missingFile:
        	return -127;
      	case LicenseError.deviceNotCompatible:
        	return -128;
		}
  	}
}
