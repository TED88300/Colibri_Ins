//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceDetector_h
#define _id3FaceDetector_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceModel.h>
#include <id3Face/id3FaceProcessingUnit.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3DetectedFaceList.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceDetector object of the Face module.
 */
typedef struct id3FaceDetector *ID3_FACE_DETECTOR;

/**
 * @brief Initializes a FaceDetector object.
 * @param phFaceDetector [in] Handle to the FaceDetector object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_Initialize(ID3_FACE_DETECTOR *phFaceDetector);

/**
 * @brief Releases the memory allocated for a FaceDetector.
 * @param phFaceDetector [in] Handle to the FaceDetector object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_Dispose(ID3_FACE_DETECTOR *phFaceDetector);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_CheckHandle(ID3_FACE_DETECTOR hFaceDetector);

/**
 * Gets the confidence threshold. Default value is 70. Range is [0;100]. Setting a high threshold reduces false detection but can increase the number of undetected faces.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param confidenceThreshold [out] Confidence threshold. Default value is 70. Range is [0;100]. Setting a high threshold reduces false detection but can increase the number of undetected faces.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_GetConfidenceThreshold(ID3_FACE_DETECTOR hFaceDetector, int *confidenceThreshold);

/**
 * Sets the confidence threshold. Default value is 70. Range is [0;100]. Setting a high threshold reduces false detection but can increase the number of undetected faces.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param confidenceThreshold [in] Confidence threshold. Default value is 70. Range is [0;100]. Setting a high threshold reduces false detection but can increase the number of undetected faces.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_SetConfidenceThreshold(ID3_FACE_DETECTOR hFaceDetector, int confidenceThreshold);

/**
 * Gets the model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param eModel [out] Model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_GetModel(ID3_FACE_DETECTOR hFaceDetector, id3FaceModel *eModel);

/**
 * Sets the model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param eModel [in] Model used to detect and track faces. Default value is FaceDetector3A which is the best available algorithm in this SDK in terms of accuracy. Some better accuracy/speed balances can be found by choosing another model. For more information refer to the user guide.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_SetModel(ID3_FACE_DETECTOR hFaceDetector, id3FaceModel eModel);

/**
 * Gets the non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is [0;100]. Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param nmsIouThreshold [out] Non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is [0;100]. Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_GetNmsIouThreshold(ID3_FACE_DETECTOR hFaceDetector, int *nmsIouThreshold);

/**
 * Sets the non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is [0;100]. Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param nmsIouThreshold [in] Non-maximum suppression (NMS) intersection-over-union (IOU) threshold. Default value is 40. Range is [0;100]. Setting a high threshold allows to detect more overlapping faces which can be useful in a multi-face secenario. On the contrary, in a portrait scenario, a low NMS IOU threshold should be preferred.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_SetNmsIouThreshold(ID3_FACE_DETECTOR hFaceDetector, int nmsIouThreshold);

/**
 * Gets the processing unit where to run the detection process. Default value is CPU.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param eProcessingUnit [out] Processing unit where to run the detection process. Default value is CPU.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_GetProcessingUnit(ID3_FACE_DETECTOR hFaceDetector, id3FaceProcessingUnit *eProcessingUnit);

/**
 * Sets the processing unit where to run the detection process. Default value is CPU.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param eProcessingUnit [in] Processing unit where to run the detection process. Default value is CPU.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_SetProcessingUnit(ID3_FACE_DETECTOR hFaceDetector, id3FaceProcessingUnit eProcessingUnit);

/**
 * Gets the number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param threadCount [out] Number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_GetThreadCount(ID3_FACE_DETECTOR hFaceDetector, int *threadCount);

/**
 * Sets the number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param threadCount [in] Number of threads to use for detection or tracking. Default value is 1. Allocating more than 1 thread here can increase the speed of the process.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_SetThreadCount(ID3_FACE_DETECTOR hFaceDetector, int threadCount);

/**
 * Detects faces in an image and store their info in a DetectedFaceList object. The algorithm searches for faces in the range [16px;512px]. If the image is too large to fit this range, one must resize it before the detection process.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFaceList [out] List of detected faces.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_DetectFaces(ID3_FACE_DETECTOR hFaceDetector, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE_LIST hDetectedFaceList);

/**
 * Loads the set parameters. This function is optional, if not called the loading of the parameters will occur during the first call to DetectFaces() or TrackFaces().
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_LoadParameters(ID3_FACE_DETECTOR hFaceDetector);

/**
 * Tracks faces in an image and update their info in a DetectedFaceList object. The algorithm searches for faces in the range [16px;512px]. If the image is too large to fit this range, one must resize it before the detection process. In a realtime process, one must use this function instead of &quot;detect&quot; to keep the face IDs stable in time.
 * @param hFaceDetector [in] Handle to the FaceDetector object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFaceList [in] List of detected faces.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceDetector_TrackFaces(ID3_FACE_DETECTOR hFaceDetector, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE_LIST hDetectedFaceList);

#ifdef __cplusplus
}
#endif

#endif
