//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceEncoder_h
#define _id3FaceEncoder_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceModel.h>
#include <id3Face/id3FaceProcessingUnit.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3DetectedFace.h>
#include <id3Face/id3FaceTemplate.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceEncoder object of the Face module.
 */
typedef struct id3FaceEncoder *ID3_FACE_ENCODER;

/**
 * @brief Initializes a FaceEncoder object.
 * @param phFaceEncoder [in] Handle to the FaceEncoder object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_Initialize(ID3_FACE_ENCODER *phFaceEncoder);

/**
 * @brief Releases the memory allocated for a FaceEncoder.
 * @param phFaceEncoder [in] Handle to the FaceEncoder object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_Dispose(ID3_FACE_ENCODER *phFaceEncoder);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_CheckHandle(ID3_FACE_ENCODER hFaceEncoder);

/**
 * Gets the model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param eModel [out] Model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_GetModel(ID3_FACE_ENCODER hFaceEncoder, id3FaceModel *eModel);

/**
 * Sets the model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param eModel [in] Model used to create templates. Default value is FaceEncoder9A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_SetModel(ID3_FACE_ENCODER hFaceEncoder, id3FaceModel eModel);

/**
 * Gets the processing unit where to run the encoding process. Default value is CPU.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param eProcessingUnit [out] Processing unit where to run the encoding process. Default value is CPU.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_GetProcessingUnit(ID3_FACE_ENCODER hFaceEncoder, id3FaceProcessingUnit *eProcessingUnit);

/**
 * Sets the processing unit where to run the encoding process. Default value is CPU.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param eProcessingUnit [in] Processing unit where to run the encoding process. Default value is CPU.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_SetProcessingUnit(ID3_FACE_ENCODER hFaceEncoder, id3FaceProcessingUnit eProcessingUnit);

/**
 * Gets the number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param threadCount [out] Number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_GetThreadCount(ID3_FACE_ENCODER hFaceEncoder, int *threadCount);

/**
 * Sets the number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param threadCount [in] Number of threads to use for encoding templates. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_SetThreadCount(ID3_FACE_ENCODER hFaceEncoder, int threadCount);

/**
 * Computes the quality of a detected face. Here, quality expresses the match capability of an image: a high quality image will generate less match errors (false acceptance or false rejection) than a low quality one.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param quality [out] Estimated quality of the detected face. Range is [0:100].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_ComputeQuality(ID3_FACE_ENCODER hFaceEncoder, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *quality);

/**
 * Extracts the unique features of a detected face and store them in a FaceTemplate.
 * @param hFaceEncoder [in] Handle to the FaceEncoder object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hFaceTemplate [out] Generated face template.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceEncoder_CreateTemplate(ID3_FACE_ENCODER hFaceEncoder, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_TEMPLATE hFaceTemplate);

#ifdef __cplusplus
}
#endif

#endif
