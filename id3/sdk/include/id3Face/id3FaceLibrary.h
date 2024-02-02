//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceLibrary_h
#define _id3FaceLibrary_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceModel.h>
#include <id3Face/id3FaceProcessingUnit.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Checks the license file.
 * @param licensePath [in] License path.
 * @param optionalParameter [in] Internal usage only. Must be set to nullptr.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLibrary_CheckLicense(const char *licensePath, void *optionalParameter);

/**
 * Checks the license from a buffer.
 * @param licenseBuffer [in] License buffer.
 * @param licenseBufferSize [in] Size of the 'licenseBuffer' buffer.
 * @param optionalParameter [in] Internal usage only. Must be set to nullptr.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLibrary_CheckLicenseBuffer(unsigned char *licenseBuffer, int licenseBufferSize, void *optionalParameter);

/**
 * Loads a model from the zoo into the required processing unit.
 * @param modelPath [in] Path to the models' directory.
 * @param eFaceModel [in] Face model to load.
 * @param eProcessingUnit [in] Processing unit to load the model into.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLibrary_LoadModel(const char *modelPath, id3FaceModel eFaceModel, id3FaceProcessingUnit eProcessingUnit);

/**
 * Loads a model from the zoo into the required processing unit.
 * @param modelBuffer [in] Buffer containing the model to load.
 * @param modelBufferSize [in] Size of the 'modelBuffer' buffer.
 * @param eFaceModel [in] Face model to load.
 * @param eProcessingUnit [in] Processing unit to load the model into.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLibrary_LoadModelBuffer(unsigned char *modelBuffer, int modelBufferSize, id3FaceModel eFaceModel, id3FaceProcessingUnit eProcessingUnit);

/**
 * Unloads a model from the processing unit it was loaded into.
 * @param eFaceModel [in] Face model to unload.
 * @param eProcessingUnit [in] Processing unit to unload the model from.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceLibrary_UnloadModel(id3FaceModel eFaceModel, id3FaceProcessingUnit eProcessingUnit);

#ifdef __cplusplus
}
#endif

#endif
