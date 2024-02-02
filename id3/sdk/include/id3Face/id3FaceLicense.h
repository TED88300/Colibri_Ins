//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceLicense_h
#define _id3FaceLicense_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceLicenseHardwareCodeType.h>
#include <id3Face/id3FaceLicenseType.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Retrieves a license file using id3 account credentials and a product reference.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param login [in] The id3 account login.
 * @param password [in] The id3 account password.
 * @param productReference [in] The requested product reference.
 * @param commentary [in] Commentary associated to this license activation.
 * @param path [in] Path to the retrieved license file.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_Activate(const char *hardwareCode, const char *login, const char *password, const char *productReference, const char *commentary, const char *path);

/**
 * Retrieves a license file using an activation key.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param activationKey [in] The id3 activation key.
 * @param commentary [in] Commentary associated to this license activation.
 * @param path [in] Path to the retrieved license file.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ActivateActivationKey(const char *hardwareCode, const char *activationKey, const char *commentary, const char *path);

/**
 * Retrieves a license file buffer using an activation key.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param activationKey [in] The id3 activation key.
 * @param commentary [in] Commentary associated to this license activation.
 * @param licenseFileBuffer [out] Pointer to a pre-allocated buffer to receive the license data.
 * @param licenseFileBufferSize [in,out] Size of the 'licenseFileBuffer' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ActivateActivationKeyBuffer(const char *hardwareCode, const char *activationKey, const char *commentary, unsigned char *licenseFileBuffer, int *licenseFileBufferSize);

/**
 * Retrieves a license file buffer using id3 account credentials and a product reference.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param login [in] The id3 account login.
 * @param password [in] The id3 account password.
 * @param productReference [in] The requested product reference.
 * @param commentary [in] Commentary associated to this license activation.
 * @param licenseFileBuffer [out] Pointer to a pre-allocated buffer to receive the license data.
 * @param licenseFileBufferSize [in,out] Size of the 'licenseFileBuffer' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ActivateBuffer(const char *hardwareCode, const char *login, const char *password, const char *productReference, const char *commentary, unsigned char *licenseFileBuffer, int *licenseFileBufferSize);

/**
 * Retrieves a license file using a serial key.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param serialKey [in] The id3 serial key.
 * @param commentary [in] Commentary associated to this license activation.
 * @param path [in] Path to the retrieved license file.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ActivateSerialKey(const char *hardwareCode, const char *serialKey, const char *commentary, const char *path);

/**
 * Retrieves a license file buffer using a serial key.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param serialKey [in] The id3 serial key.
 * @param commentary [in] Commentary associated to this license activation.
 * @param licenseFileBuffer [out] Pointer to a pre-allocated buffer to receive the license data.
 * @param licenseFileBufferSize [in,out] Size of the 'licenseFileBuffer' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ActivateSerialKeyBuffer(const char *hardwareCode, const char *serialKey, const char *commentary, unsigned char *licenseFileBuffer, int *licenseFileBufferSize);

/**
 * Checks if a module is present in the license.
 * 
 * This function checks if a module (defined by his name as a string) is present in a previously loaded license.
 * @param moduleName [in] The module name.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_CheckModule(const char *moduleName);

/**
 * Retrieves the license expiry date.
 * @param expiryDate [out] Pointer to a pre-allocated buffer to receive the license expiry date.
 * @param expiryDateSize [in,out] Size of the 'expiryDate' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetExpiryDate(char *expiryDate, int *expiryDateSize);

/**
 * Retrieves the hardware code of the external drive you run the library on. This function works on Windows only.
 * @param eHardwareCodeType [in] The requested hardware code type. Must be Windows USB.
 * @param code [out] Pointer to a pre-allocated buffer to receive the device hardware code.
 * @param codeSize [in,out] Size of the 'code' buffer.
 * @param externalDrivePath [in] On Windows to activate a license on a USB device, it must contain the path to the requested USB drive (e.g 'G:\').
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetExternalDriveHardwareCode(id3FaceLicenseHardwareCodeType eHardwareCodeType, char *code, int *codeSize, const char *externalDrivePath);

/**
 * Retrieves the hardware code of the device using the requested hardware code type.
 * 
 * This function retrieves the hardware code of the device you run the library on.
 * 
 * The optional parameter is required:
 *  - On Android, it must be the JNIEnv* pointer cast as a void*.
 *  - In other cases, it must be set to NULL.
 * @param eHardwareCodeType [in] The requested hardware code type.
 * @param code [out] Pointer to a pre-allocated buffer to receive the device hardware code.
 * @param codeSize [in,out] Size of the 'code' buffer.
 * @param optionalParameter [in] Only used on Android for JNIEnv* pointer. Ignored for other devices (NULL).
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetHostHardwareCode(id3FaceLicenseHardwareCodeType eHardwareCodeType, char *code, int *codeSize, void *optionalParameter);

/**
 * Retrieves the hardware code of the previously loaded license file.
 * @param licenseFileHardwareCode [out] Pointer to a pre-allocated buffer to receive the license file hardware code.
 * @param licenseFileHardwareCodeSize [in,out] Size of the 'licenseFileHardwareCode' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicenseFileHardwareCode(char *licenseFileHardwareCode, int *licenseFileHardwareCodeSize);

/**
 * Retrieves the serial of the previously loaded license file.
 * @param licenseFileSerial [out] Pointer to a pre-allocated buffer to receive the license file serial.
 * @param licenseFileSerialSize [in,out] Size of the 'licenseFileSerial' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicenseFileSerial(char *licenseFileSerial, int *licenseFileSerialSize);

/**
 * Retrieves the license name.
 * @param licenseName [out] Pointer to a pre-allocated buffer to receive the name.
 * @param licenseNameSize [in,out] Size of the 'licenseName' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicenseName(char *licenseName, int *licenseNameSize);

/**
 * Retrieves the license owner.
 * @param licenseOwner [out] Pointer to a pre-allocated buffer to receive the owner.
 * @param licenseOwnerSize [in,out] Size of the 'licenseOwner' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicenseOwner(char *licenseOwner, int *licenseOwnerSize);

/**
 * Retrieves the license path.
 * @param licensePath [out] Pointer to a pre-allocated buffer to receive the license path.
 * @param licensePathSize [in,out] Size of the 'licensePath' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicensePath(char *licensePath, int *licensePathSize);

/**
 * Retrieves the license type.
 * @param eLicenseType [out] Pointer to a pre-allocated id3LicenseType enum value to receive the type.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetLicenseType(id3FaceLicenseType *eLicenseType);

/**
 * Retrieves the number of modules in the license.
 * @param count [out] The number of modules in the license.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetModuleCount(int *count);

/**
 * Retrieves the name of a given module in the license.
 * @param index [in] index of the module in range [0 ; GetModuleCount() - 1].
 * @param name [out] Pointer to a pre-allocated buffer to receive the name.
 * @param nameSize [in,out] Size of the 'name' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetModuleName(int index, char *name, int *nameSize);

/**
 * Retrieves the value of a given module in the license.
 * @param name [in] Name of the requested module.
 * @param value [out] Pointer to an int which will contain the requested value.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetModuleValue(const char *name, int *value);

/**
 * Retrieves the license product reference.
 * @param productReference [out] Pointer to a pre-allocated buffer to receive the product reference.
 * @param productReferenceSize [in,out] Size of the 'productReference' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetProductReference(char *productReference, int *productReferenceSize);

/**
 * Retrieves the number of trial remaining days.
 * @param remainingDays [out] Pointer to an int which will contain the requested remainingDays.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_GetRemainingDays(int *remainingDays);

/**
 * Loads and checks a license from a file.
 * 
 *  This function does two things:
 *   - First it loads the license from a file using the given path
 *   - Then it checks the validity of the license regarding the host it is called on (Windows, Linux, Android ...)
 * 
 *  Calling this function is required to get access to the license member getters.
 * 
 *  The optional parameter is required on Android and must be the JNIEnv* pointer casted as a void*.
 *  It can be set as NULL for other devices.
 * @param licensePath [in] Absolute or relative path to the license file.
 * @param optionalParameter [in] Only used on Android: JNIEnv* pointer casted as a void*. Ignored for other devices.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_LoadLicense(const char *licensePath, void *optionalParameter);

/**
 * Loads and checks a license from a buffer.
 * 
 *  This function does two things:
 *   - First it loads the license from a buffer
 *   - Then it checks the validity of the license regarding the host it is called on (Windows, Linux, Android ...)
 * 
 *  Calling one of the license loading function is required to get access to all the license member getters.
 * 
 *  The optional parameter is required on Android and must be the JNIEnv* pointer casted as a void*.
 *  It can be set as NULL for other devices.
 * @param licenseData [in] A buffer containing the license file data.
 * @param licenseDataSize [in] Size of the 'licenseData' buffer.
 * @param optionalParameter [in] Only used on Android: JNIEnv* pointer casted as a void*. Ignored for other devices.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_LoadLicenseBuffer(unsigned char *licenseData, int licenseDataSize, void *optionalParameter);

/**
 * Reactivates a license file using hardware code and product reference.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param productReference [in] The requested product reference.
 * @param path [in] Path to the retrieved license file.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_Reactivate(const char *hardwareCode, const char *productReference, const char *path);

/**
 * Reactivates a license file buffer using hardware code and product reference.
 * @param hardwareCode [in] The hardware code on which the license file will be attached, to be retrieved using the GetHostHardwareCode function.
 * @param productReference [in] The requested product reference.
 * @param licenseFileBuffer [out] Pointer to a pre-allocated buffer to receive the license data.
 * @param licenseFileBufferSize [in,out] Size of the 'licenseFileBuffer' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLicense_ReactivateBuffer(const char *hardwareCode, const char *productReference, unsigned char *licenseFileBuffer, int *licenseFileBufferSize);

#ifdef __cplusplus
}
#endif

#endif
