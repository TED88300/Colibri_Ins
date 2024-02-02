//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
// ignore_for_file: unused_import

import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'face_sdk_generated_bindings.dart';
import 'face_native.dart';

import '../id3_face.dart';

/// This class represents a License object of the Face module.
class License {
  // Public methods
  /// Retrieves a license file using id3 account credentials and a product reference.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param login The id3 account login.
  /// param password The id3 account password.
  /// param productReference The requested product reference.
  /// param commentary Commentary associated to this license activation.
  /// param path Path to the retrieved license file.
  /// throws FaceException An error has occurred during Face Library execution.
  static void activate(String hardwareCode, String login, String password, String productReference, String commentary, String path) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pLogin = login.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPassword = password.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pProductReference = productReference.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_Activate(pHardwareCode, pLogin, pPassword, pProductReference, pCommentary, pPath);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pLogin);
    	calloc.free(pPassword);
    	calloc.free(pProductReference);
    	calloc.free(pCommentary);
    	calloc.free(pPath);
    }
  }

  /// Retrieves a license file using an activation key.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param activationKey The id3 activation key.
  /// param commentary Commentary associated to this license activation.
  /// param path Path to the retrieved license file.
  /// throws FaceException An error has occurred during Face Library execution.
  static void activateActivationKey(String hardwareCode, String activationKey, String commentary, String path) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pActivationKey = activationKey.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_ActivateActivationKey(pHardwareCode, pActivationKey, pCommentary, pPath);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pActivationKey);
    	calloc.free(pCommentary);
    	calloc.free(pPath);
    }
  }

  /// Retrieves a license file buffer using an activation key.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param activationKey The id3 activation key.
  /// param commentary Commentary associated to this license activation.
  /// return Pointer to a pre-allocated buffer to receive the license data.
  /// throws FaceException An error has occurred during Face Library execution.
  static Uint8List activateActivationKeyBuffer(String hardwareCode, String activationKey, String commentary) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pActivationKey = activationKey.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Uint8> pLicenseFileBuffer = calloc.allocate(2048);
    Pointer<Int32> pLicenseFileBufferSize = calloc.allocate(1);
    pLicenseFileBufferSize[0] = 2048;
    try {
    	var err = faceSDK.id3FaceLicense_ActivateActivationKeyBuffer(pHardwareCode, pActivationKey, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileBuffer = calloc.allocate(pLicenseFileBufferSize.value);
    		err = faceSDK.id3FaceLicense_ActivateActivationKeyBuffer(pHardwareCode, pActivationKey, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	}
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pLicenseFileBuffer.asTypedList(pLicenseFileBufferSize.value));
    	return value;
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pActivationKey);
    	calloc.free(pCommentary);
    	calloc.free(pLicenseFileBuffer);
    	calloc.free(pLicenseFileBufferSize);
    }
  }

  /// Retrieves a license file buffer using id3 account credentials and a product reference.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param login The id3 account login.
  /// param password The id3 account password.
  /// param productReference The requested product reference.
  /// param commentary Commentary associated to this license activation.
  /// return Pointer to a pre-allocated buffer to receive the license data.
  /// throws FaceException An error has occurred during Face Library execution.
  static Uint8List activateBuffer(String hardwareCode, String login, String password, String productReference, String commentary) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pLogin = login.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPassword = password.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pProductReference = productReference.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Uint8> pLicenseFileBuffer = calloc.allocate(2048);
    Pointer<Int32> pLicenseFileBufferSize = calloc.allocate(1);
    pLicenseFileBufferSize[0] = 2048;
    try {
    	var err = faceSDK.id3FaceLicense_ActivateBuffer(pHardwareCode, pLogin, pPassword, pProductReference, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileBuffer = calloc.allocate(pLicenseFileBufferSize.value);
    		err = faceSDK.id3FaceLicense_ActivateBuffer(pHardwareCode, pLogin, pPassword, pProductReference, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	}
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pLicenseFileBuffer.asTypedList(pLicenseFileBufferSize.value));
    	return value;
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pLogin);
    	calloc.free(pPassword);
    	calloc.free(pProductReference);
    	calloc.free(pCommentary);
    	calloc.free(pLicenseFileBuffer);
    	calloc.free(pLicenseFileBufferSize);
    }
  }

  /// Retrieves a license file using a serial key.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param serialKey The id3 serial key.
  /// param commentary Commentary associated to this license activation.
  /// param path Path to the retrieved license file.
  /// throws FaceException An error has occurred during Face Library execution.
  static void activateSerialKey(String hardwareCode, String serialKey, String commentary, String path) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pSerialKey = serialKey.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_ActivateSerialKey(pHardwareCode, pSerialKey, pCommentary, pPath);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pSerialKey);
    	calloc.free(pCommentary);
    	calloc.free(pPath);
    }
  }

  /// Retrieves a license file buffer using a serial key.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param serialKey The id3 serial key.
  /// param commentary Commentary associated to this license activation.
  /// return Pointer to a pre-allocated buffer to receive the license data.
  /// throws FaceException An error has occurred during Face Library execution.
  static Uint8List activateSerialKeyBuffer(String hardwareCode, String serialKey, String commentary) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pSerialKey = serialKey.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pCommentary = commentary.toNativeUtf8().cast<Int8>();
    Pointer<Uint8> pLicenseFileBuffer = calloc.allocate(2048);
    Pointer<Int32> pLicenseFileBufferSize = calloc.allocate(1);
    pLicenseFileBufferSize[0] = 2048;
    try {
    	var err = faceSDK.id3FaceLicense_ActivateSerialKeyBuffer(pHardwareCode, pSerialKey, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileBuffer = calloc.allocate(pLicenseFileBufferSize.value);
    		err = faceSDK.id3FaceLicense_ActivateSerialKeyBuffer(pHardwareCode, pSerialKey, pCommentary, pLicenseFileBuffer, pLicenseFileBufferSize);
    	}
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pLicenseFileBuffer.asTypedList(pLicenseFileBufferSize.value));
    	return value;
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pSerialKey);
    	calloc.free(pCommentary);
    	calloc.free(pLicenseFileBuffer);
    	calloc.free(pLicenseFileBufferSize);
    }
  }

  /// Checks if a module is present in the license.
  /// 
  /// This function checks if a module (defined by his name as a string) is present in a previously loaded license.
  ///
  /// param moduleName The module name.
  /// throws FaceException An error has occurred during Face Library execution.
  static void checkModule(String moduleName) {
    Pointer<Int8> pModuleName = moduleName.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_CheckModule(pModuleName);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pModuleName);
    }
  }

  /// Retrieves the license expiry date.
  ///
  /// return Pointer to a pre-allocated buffer to receive the license expiry date.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getExpiryDate() {
    Pointer<Int8> pExpiryDate= nullptr;
    Pointer<Int32> pExpiryDateSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetExpiryDate(pExpiryDate, pExpiryDateSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pExpiryDate = calloc.allocate(pExpiryDateSize.value);
    		err = faceSDK.id3FaceLicense_GetExpiryDate(pExpiryDate, pExpiryDateSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pExpiryDate.asTypedList(pExpiryDateSize.value));
    	return value;
    } finally {
    	calloc.free(pExpiryDate);
    	calloc.free(pExpiryDateSize);
    }
  }

  /// Retrieves the hardware code of the external drive you run the library on. This function works on Windows only.
  ///
  /// param hardwareCodeType The requested hardware code type. Must be Windows USB.
  /// param externalDrivePath On Windows to activate a license on a USB device, it must contain the path to the requested USB drive (e.g 'G:\').
  /// return Pointer to a pre-allocated buffer to receive the device hardware code.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getExternalDriveHardwareCode(LicenseHardwareCodeType hardwareCodeType, String externalDrivePath) {
    Pointer<Int8> pCode= nullptr;
    Pointer<Int32> pCodeSize = calloc();
    Pointer<Int8> pExternalDrivePath = externalDrivePath.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_GetExternalDriveHardwareCode(hardwareCodeType.value, pCode, pCodeSize, pExternalDrivePath);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pCode = calloc.allocate(pCodeSize.value);
    		err = faceSDK.id3FaceLicense_GetExternalDriveHardwareCode(hardwareCodeType.value, pCode, pCodeSize, pExternalDrivePath);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pCode.asTypedList(pCodeSize.value));
    	return value;
    } finally {
    	calloc.free(pCode);
    	calloc.free(pCodeSize);
    	calloc.free(pExternalDrivePath);
    }
  }

  /// Retrieves the hardware code of the device using the requested hardware code type.
  /// 
  /// This function retrieves the hardware code of the device you run the library on.
  /// 
  /// The optional parameter is required:
  ///  - On Android, it must be the JNIEnv* pointer cast as a void*.
  ///  - In other cases, it must be set to NULL.
  ///
  /// param hardwareCodeType The requested hardware code type.
  /// return Pointer to a pre-allocated buffer to receive the device hardware code.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getHostHardwareCode(LicenseHardwareCodeType hardwareCodeType) {
    Pointer<Int8> pCode= nullptr;
    Pointer<Int32> pCodeSize = calloc();
    Pointer<Void> pOptionalParameter = nullptr;
    try {
    	var err = faceSDK.id3FaceLicense_GetHostHardwareCode(hardwareCodeType.value, pCode, pCodeSize, pOptionalParameter);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pCode = calloc.allocate(pCodeSize.value);
    		err = faceSDK.id3FaceLicense_GetHostHardwareCode(hardwareCodeType.value, pCode, pCodeSize, pOptionalParameter);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pCode.asTypedList(pCodeSize.value));
    	return value;
    } finally {
    	calloc.free(pCode);
    	calloc.free(pCodeSize);
    }
  }

  /// Retrieves the hardware code of the previously loaded license file.
  ///
  /// return Pointer to a pre-allocated buffer to receive the license file hardware code.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getLicenseFileHardwareCode() {
    Pointer<Int8> pLicenseFileHardwareCode= nullptr;
    Pointer<Int32> pLicenseFileHardwareCodeSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicenseFileHardwareCode(pLicenseFileHardwareCode, pLicenseFileHardwareCodeSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileHardwareCode = calloc.allocate(pLicenseFileHardwareCodeSize.value);
    		err = faceSDK.id3FaceLicense_GetLicenseFileHardwareCode(pLicenseFileHardwareCode, pLicenseFileHardwareCodeSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pLicenseFileHardwareCode.asTypedList(pLicenseFileHardwareCodeSize.value));
    	return value;
    } finally {
    	calloc.free(pLicenseFileHardwareCode);
    	calloc.free(pLicenseFileHardwareCodeSize);
    }
  }

  /// Retrieves the serial of the previously loaded license file.
  ///
  /// return Pointer to a pre-allocated buffer to receive the license file serial.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getLicenseFileSerial() {
    Pointer<Int8> pLicenseFileSerial= nullptr;
    Pointer<Int32> pLicenseFileSerialSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicenseFileSerial(pLicenseFileSerial, pLicenseFileSerialSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileSerial = calloc.allocate(pLicenseFileSerialSize.value);
    		err = faceSDK.id3FaceLicense_GetLicenseFileSerial(pLicenseFileSerial, pLicenseFileSerialSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pLicenseFileSerial.asTypedList(pLicenseFileSerialSize.value));
    	return value;
    } finally {
    	calloc.free(pLicenseFileSerial);
    	calloc.free(pLicenseFileSerialSize);
    }
  }

  /// Retrieves the license name.
  ///
  /// return Pointer to a pre-allocated buffer to receive the name.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getLicenseName() {
    Pointer<Int8> pLicenseName= nullptr;
    Pointer<Int32> pLicenseNameSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicenseName(pLicenseName, pLicenseNameSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseName = calloc.allocate(pLicenseNameSize.value);
    		err = faceSDK.id3FaceLicense_GetLicenseName(pLicenseName, pLicenseNameSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pLicenseName.asTypedList(pLicenseNameSize.value));
    	return value;
    } finally {
    	calloc.free(pLicenseName);
    	calloc.free(pLicenseNameSize);
    }
  }

  /// Retrieves the license owner.
  ///
  /// return Pointer to a pre-allocated buffer to receive the owner.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getLicenseOwner() {
    Pointer<Int8> pLicenseOwner= nullptr;
    Pointer<Int32> pLicenseOwnerSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicenseOwner(pLicenseOwner, pLicenseOwnerSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseOwner = calloc.allocate(pLicenseOwnerSize.value);
    		err = faceSDK.id3FaceLicense_GetLicenseOwner(pLicenseOwner, pLicenseOwnerSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pLicenseOwner.asTypedList(pLicenseOwnerSize.value));
    	return value;
    } finally {
    	calloc.free(pLicenseOwner);
    	calloc.free(pLicenseOwnerSize);
    }
  }

  /// Retrieves the license path.
  ///
  /// return Pointer to a pre-allocated buffer to receive the license path.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getLicensePath() {
    Pointer<Int8> pLicensePath= nullptr;
    Pointer<Int32> pLicensePathSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicensePath(pLicensePath, pLicensePathSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicensePath = calloc.allocate(pLicensePathSize.value);
    		err = faceSDK.id3FaceLicense_GetLicensePath(pLicensePath, pLicensePathSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pLicensePath.asTypedList(pLicensePathSize.value));
    	return value;
    } finally {
    	calloc.free(pLicensePath);
    	calloc.free(pLicensePathSize);
    }
  }

  /// Retrieves the license type.
  ///
  /// return Pointer to a pre-allocated id3LicenseType enum value to receive the type.
  /// throws FaceException An error has occurred during Face Library execution.
  static LicenseType getLicenseType() {
    Pointer<Int32> pLicenseType = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetLicenseType(pLicenseType);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = LicenseTypeX.fromValue(pLicenseType.value);
    	return value;
    } finally {
    	calloc.free(pLicenseType);
    }
  }

  /// Retrieves the number of modules in the license.
  ///
  /// return The number of modules in the license.
  /// throws FaceException An error has occurred during Face Library execution.
  static int getModuleCount() {
    Pointer<Int32> pCount = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetModuleCount(pCount);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pCount.value;
    	return value;
    } finally {
    	calloc.free(pCount);
    }
  }

  /// Retrieves the name of a given module in the license.
  ///
  /// param index index of the module in range (0 ; GetModuleCount() - 1).
  /// return Pointer to a pre-allocated buffer to receive the name.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getModuleName(int index) {
    Pointer<Int8> pName= nullptr;
    Pointer<Int32> pNameSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetModuleName(index, pName, pNameSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pName = calloc.allocate(pNameSize.value);
    		err = faceSDK.id3FaceLicense_GetModuleName(index, pName, pNameSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pName.asTypedList(pNameSize.value));
    	return value;
    } finally {
    	calloc.free(pName);
    	calloc.free(pNameSize);
    }
  }

  /// Retrieves the value of a given module in the license.
  ///
  /// param name Name of the requested module.
  /// return Pointer to an int which will contain the requested value.
  /// throws FaceException An error has occurred during Face Library execution.
  static int getModuleValue(String name) {
    Pointer<Int8> pName = name.toNativeUtf8().cast<Int8>();
    Pointer<Int32> pValue = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetModuleValue(pName, pValue);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pValue.value;
    	return value;
    } finally {
    	calloc.free(pName);
    	calloc.free(pValue);
    }
  }

  /// Retrieves the license product reference.
  ///
  /// return Pointer to a pre-allocated buffer to receive the product reference.
  /// throws FaceException An error has occurred during Face Library execution.
  static String getProductReference() {
    Pointer<Int8> pProductReference= nullptr;
    Pointer<Int32> pProductReferenceSize = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetProductReference(pProductReference, pProductReferenceSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pProductReference = calloc.allocate(pProductReferenceSize.value);
    		err = faceSDK.id3FaceLicense_GetProductReference(pProductReference, pProductReferenceSize);
    		if (err != LicenseError.success.value) {
    			throw FaceException(err);
    		}
    	}
    	final value = String.fromCharCodes(pProductReference.asTypedList(pProductReferenceSize.value));
    	return value;
    } finally {
    	calloc.free(pProductReference);
    	calloc.free(pProductReferenceSize);
    }
  }

  /// Retrieves the number of trial remaining days.
  ///
  /// return Pointer to an int which will contain the requested remainingDays.
  /// throws FaceException An error has occurred during Face Library execution.
  static int getRemainingDays() {
    Pointer<Int32> pRemainingDays = calloc();
    try {
    	var err = faceSDK.id3FaceLicense_GetRemainingDays(pRemainingDays);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = pRemainingDays.value;
    	return value;
    } finally {
    	calloc.free(pRemainingDays);
    }
  }

  /// Loads and checks a license from a file.
  /// 
  ///  This function does two things:
  ///   - First it loads the license from a file using the given path
  ///   - Then it checks the validity of the license regarding the host it is called on (Windows, Linux, Android ...)
  /// 
  ///  Calling this function is required to get access to the license member getters.
  /// 
  ///  The optional parameter is required on Android and must be the JNIEnv* pointer casted as a void*.
  ///  It can be set as NULL for other devices.
  ///
  /// param licensePath Absolute or relative path to the license file.
  /// throws FaceException An error has occurred during Face Library execution.
  static void loadLicense(String licensePath) {
    Pointer<Int8> pLicensePath = licensePath.toNativeUtf8().cast<Int8>();
    Pointer<Void> pOptionalParameter = nullptr;
    try {
    	var err = faceSDK.id3FaceLicense_LoadLicense(pLicensePath, pOptionalParameter);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pLicensePath);
    }
  }

  /// Loads and checks a license from a buffer.
  /// 
  ///  This function does two things:
  ///   - First it loads the license from a buffer
  ///   - Then it checks the validity of the license regarding the host it is called on (Windows, Linux, Android ...)
  /// 
  ///  Calling one of the license loading function is required to get access to all the license member getters.
  /// 
  ///  The optional parameter is required on Android and must be the JNIEnv* pointer casted as a void*.
  ///  It can be set as NULL for other devices.
  ///
  /// param licenseData A buffer containing the license file data.
  /// throws FaceException An error has occurred during Face Library execution.
  static void loadLicenseBuffer(Uint8List licenseData) {
    Pointer<Uint8> pLicenseData = calloc.allocate<Uint8>(licenseData.length);
    Uint8List licenseDataBytes = pLicenseData.asTypedList(licenseData.length);
    licenseDataBytes.setAll(0, licenseData);
    Pointer<Void> pOptionalParameter = nullptr;
    try {
    	var err = faceSDK.id3FaceLicense_LoadLicenseBuffer(pLicenseData, licenseData.length, pOptionalParameter);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pLicenseData);
    }
  }

  /// Reactivates a license file using hardware code and product reference.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param productReference The requested product reference.
  /// param path Path to the retrieved license file.
  /// throws FaceException An error has occurred during Face Library execution.
  static void reactivate(String hardwareCode, String productReference, String path) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pProductReference = productReference.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pPath = path.toNativeUtf8().cast<Int8>();
    try {
    	var err = faceSDK.id3FaceLicense_Reactivate(pHardwareCode, pProductReference, pPath);
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pProductReference);
    	calloc.free(pPath);
    }
  }

  /// Reactivates a license file buffer using hardware code and product reference.
  ///
  /// param hardwareCode The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
  /// param productReference The requested product reference.
  /// return Pointer to a pre-allocated buffer to receive the license data.
  /// throws FaceException An error has occurred during Face Library execution.
  static Uint8List reactivateBuffer(String hardwareCode, String productReference) {
    Pointer<Int8> pHardwareCode = hardwareCode.toNativeUtf8().cast<Int8>();
    Pointer<Int8> pProductReference = productReference.toNativeUtf8().cast<Int8>();
    Pointer<Uint8> pLicenseFileBuffer = calloc.allocate(2048);
    Pointer<Int32> pLicenseFileBufferSize = calloc.allocate(1);
    pLicenseFileBufferSize[0] = 2048;
    try {
    	var err = faceSDK.id3FaceLicense_ReactivateBuffer(pHardwareCode, pProductReference, pLicenseFileBuffer, pLicenseFileBufferSize);
    	if (err == LicenseError.insufficientBuffer.value) {
    		pLicenseFileBuffer = calloc.allocate(pLicenseFileBufferSize.value);
    		err = faceSDK.id3FaceLicense_ReactivateBuffer(pHardwareCode, pProductReference, pLicenseFileBuffer, pLicenseFileBufferSize);
    	}
    	if (err != LicenseError.success.value) {
    		throw FaceException(err);
    	}
    	final value = Uint8List.fromList(pLicenseFileBuffer.asTypedList(pLicenseFileBufferSize.value));
    	return value;
    } finally {
    	calloc.free(pHardwareCode);
    	calloc.free(pProductReference);
    	calloc.free(pLicenseFileBuffer);
    	calloc.free(pLicenseFileBufferSize);
    }
  }

}
