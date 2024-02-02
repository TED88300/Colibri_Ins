//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceTemplate_h
#define _id3FaceTemplate_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceTemplateFormat.h>
#include <id3Face/id3FaceTemplateBufferType.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceTemplate object of the Face module.
 */
typedef struct id3FaceTemplate *ID3_FACE_TEMPLATE;

/**
 * @brief Initializes a FaceTemplate object.
 * @param phFaceTemplate [in] Handle to the FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_Initialize(ID3_FACE_TEMPLATE *phFaceTemplate);

/**
 * @brief Releases the memory allocated for a FaceTemplate.
 * @param phFaceTemplate [in] Handle to the FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_Dispose(ID3_FACE_TEMPLATE *phFaceTemplate);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_CheckHandle(ID3_FACE_TEMPLATE hFaceTemplate);

/**
 * @brief Copies an instance of FaceTemplate object to another.
 * @param hFaceTemplateSrc [in] Handle to the source FaceTemplate object.
 * @param hFaceTemplateDst [in] Handle to the destination FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_CopyTo(ID3_FACE_TEMPLATE hFaceTemplateSrc, ID3_FACE_TEMPLATE hFaceTemplateDst);

/**
 * Gets the format of the face template.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param eFormat [out] Format of the face template.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_GetFormat(ID3_FACE_TEMPLATE hFaceTemplate, id3FaceTemplateFormat *eFormat);

/**
 * Imports the face template object from a buffer.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param data [in] Buffer to import the face template object from.
 * @param dataSize [in] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_FromBuffer(ID3_FACE_TEMPLATE hFaceTemplate, unsigned char *data, int dataSize);

/**
 * Imports the face template object from a file.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param path [in] Path to the file to import the face template object from.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_FromFile(ID3_FACE_TEMPLATE hFaceTemplate, const char *path);

/**
 * Exports the face template object to a file.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param eTemplateBufferType [in] Face template buffer type to export the face template object to.
 * @param path [in] Path to the file to export the face template object to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_Save(ID3_FACE_TEMPLATE hFaceTemplate, id3FaceTemplateBufferType eTemplateBufferType, const char *path);

/**
 * Exports the face template object to a Biometric Data Template (BDT) buffer. This buffer can only be used with id3 Face Match on Card specific implementations to verify a face template.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param data [out] Buffer to export the BDT buffer to.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_ToBdt(ID3_FACE_TEMPLATE hFaceTemplate, unsigned char *data, int *dataSize);

/**
 * Exports the face template object to a Biometric Information Template (BIT) buffer. This buffer can only be used with id3 Face Match on Card specific implementations to enroll a face template. Threshold value is required and should be set according to the used Face Encoder and desired security level. Threshold values are specific and can be found in the id3 Face Match-On-Card documentation. Reference data qualifier should be set according to the id3 Face Match-On-Card documentation.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param threshold [in] Matching threshold for this BIT buffer.
 * @param referenceDataQualifier [in] Reference data qualifier.
 * @param data [out] Buffer to export the BIT buffer to.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_ToBit(ID3_FACE_TEMPLATE hFaceTemplate, int threshold, unsigned char referenceDataQualifier, unsigned char *data, int *dataSize);

/**
 * Exports the face template object to a buffer.
 * @param hFaceTemplate [in] Handle to the FaceTemplate object.
 * @param eTemplateBufferType [in] Face template buffer type to export the face template object to.
 * @param data [out] Buffer to export the face template object to.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplate_ToBuffer(ID3_FACE_TEMPLATE hFaceTemplate, id3FaceTemplateBufferType eTemplateBufferType, unsigned char *data, int *dataSize);

#ifdef __cplusplus
}
#endif

#endif
