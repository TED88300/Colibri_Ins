import 'face_error.dart';
import 'image_error.dart';
import 'license_error.dart';

class FaceException {
	final int _errorCode;
	
	FaceException(this._errorCode);

	int get errorCode => _errorCode;

	String get message {
    	if (_errorCode == FaceError.success.value) {
    		return "No error.";
    	}
    	if (_errorCode == FaceError.base.value) {
    		return "Base error code of the Face module.";
    	}
    	if (_errorCode == FaceError.minimum.value) {
    		return "Minimum error code of the Face module.";
    	}
    	if (_errorCode == FaceError.invalidHandle.value) {
    		return "The handle is invalid.";
    	}
    	if (_errorCode == FaceError.invalidParameter.value) {
    		return "The parameter is invalid.";
    	}
    	if (_errorCode == FaceError.insufficientBuffer.value) {
    		return "The given buffer is too small.";
    	}
    	if (_errorCode == FaceError.invalidPixelFormat.value) {
    		return "The image pixel format is invalid.";
    	}
    	if (_errorCode == FaceError.invalidTemplateFormat.value) {
    		return "The template format is invalid.";
    	}
    	if (_errorCode == FaceError.invalidLandmarks.value) {
    		return "The computed landmarks are invalid and do not allow to process the desired information.";
    	}
    	if (_errorCode == FaceError.invalidIod.value) {
    		return "The computed interocular distance (IOD) is invalid and does not allow to process the desired information.";
    	}
    	if (_errorCode == FaceError.invalidModelPath.value) {
    		return "The model could not be found in the given directory path.";
    	}
    	if (_errorCode == FaceError.unloadedModel.value) {
    		return "The model which is required for this operation was not loaded.";
    	}
    	if (_errorCode == FaceError.inferenceBackendError.value) {
    		return "The inference backend failed to infer, probably due to inconsistent input.";
    	}
    	if (_errorCode == ImageError.success.value) {
    		return "No error.";
    	}
    	if (_errorCode == ImageError.base.value) {
    		return "Base error code for Image module.";
    	}
    	if (_errorCode == ImageError.minimum.value) {
    		return "Minimum error code for Image module.";
    	}
    	if (_errorCode == ImageError.invalidHandle.value) {
    		return "The handle is invalid.";
    	}
    	if (_errorCode == ImageError.invalidParameter.value) {
    		return "The parameter is invalid.";
    	}
    	if (_errorCode == ImageError.insufficientBuffer.value) {
    		return "The given buffer is too small.";
    	}
    	if (_errorCode == ImageError.imageSizeMismatch.value) {
    		return "The image sizes are not compatible for the requested operation.";
    	}
    	if (_errorCode == ImageError.pixelFormatMismatch.value) {
    		return "The pixel formats are not compatible.";
    	}
    	if (_errorCode == ImageError.keyAlreadyExists.value) {
    		return "The given key is already used in the dictionary. Multiple values per key is not supported.";
    	}
    	if (_errorCode == ImageError.keyNotFound.value) {
    		return "The given key is not present in the dictionary.";
    	}
    	if (_errorCode == ImageError.invalidPixelFormat.value) {
    		return "The required pixel format is not correct.";
    	}
    	if (_errorCode == LicenseError.success.value) {
    		return "No error.";
    	}
    	if (_errorCode == LicenseError.base.value) {
    		return "Base error code of the License module.";
    	}
    	if (_errorCode == LicenseError.minimum.value) {
    		return "Minimum error code of the License module.";
    	}
    	if (_errorCode == LicenseError.licenseNotFound.value) {
    		return "No license was found.";
    	}
    	if (_errorCode == LicenseError.invalidLicense.value) {
    		return "License is not valid or a required module is not licensed.";
    	}
    	if (_errorCode == LicenseError.expiredLicense.value) {
    		return "The license has expired.";
    	}
    	if (_errorCode == LicenseError.invalidHardwareId.value) {
    		return "Installation code does not match hardware ID.";
    	}
    	if (_errorCode == LicenseError.alreadyFulfilled.value) {
    		return "The license is already fulfilled by another user (or computer).";
    	}
    	if (_errorCode == LicenseError.moduleError.value) {
    		return "A required module is not licensed or the usage limit has been reached.";
    	}
    	if (_errorCode == LicenseError.writeError.value) {
    		return "The license file cannot be accessed in write mode.";
    	}
    	if (_errorCode == LicenseError.insufficientBuffer.value) {
    		return "The given buffer is too small.";
    	}
    	if (_errorCode == LicenseError.invalidHandle.value) {
    		return "The handle is invalid.";
    	}
    	if (_errorCode == LicenseError.invalidParameter.value) {
    		return "One of the parameters is incorrect.";
    	}
    	if (_errorCode == LicenseError.insufficientLicenseCredits.value) {
    		return "The number of available licenses has been reached. There isn't any available license remaining.";
    	}
    	if (_errorCode == LicenseError.invalidSerial.value) {
    		return "The serial is invalid.";
    	}
    	if (_errorCode == LicenseError.invalidCredentials.value) {
    		return "Invalid login or password.";
    	}
    	if (_errorCode == LicenseError.revokedLicense.value) {
    		return "The license is revoked or does not exist anymore.";
    	}
    	if (_errorCode == LicenseError.blockedLicense.value) {
    		return "The license is blocked after a predefined period.";
    	}
    	if (_errorCode == LicenseError.unreachableServer.value) {
    		return "The license server is currently unreachable.";
    	}
    	if (_errorCode == LicenseError.licenseOtherError.value) {
    		return "An unexpected error happened.";
    	}
    	if (_errorCode == LicenseError.missingFile.value) {
    		return "No license file was provided.";
    	}
    	if (_errorCode == LicenseError.deviceNotCompatible.value) {
    		return "This device is not compatible with id3 licensing system.";
    	}
    	return "Undefined error.";
  	}
}
