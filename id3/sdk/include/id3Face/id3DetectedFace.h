//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3DetectedFace_h
#define _id3DetectedFace_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceRectangle.h>
#include <id3Face/id3FacePointList.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3FacePoint.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a DetectedFace object of the Face module.
 */
typedef struct id3DetectedFace *ID3_DETECTED_FACE;

/**
 * @brief Initializes a DetectedFace object.
 * @param phDetectedFace [in] Handle to the DetectedFace object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Initialize(ID3_DETECTED_FACE *phDetectedFace);

/**
 * @brief Releases the memory allocated for a DetectedFace.
 * @param phDetectedFace [in] Handle to the DetectedFace object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Dispose(ID3_DETECTED_FACE *phDetectedFace);

/**
 * @brief Checks if the handle object is valid.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_CheckHandle(ID3_DETECTED_FACE hDetectedFace);

/**
 * @brief Copies an instance of DetectedFace object to another.
 * @param hDetectedFaceSrc [in] Handle to the source DetectedFace object.
 * @param hDetectedFaceDst [in] Handle to the destination DetectedFace object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_CopyTo(ID3_DETECTED_FACE hDetectedFaceSrc, ID3_DETECTED_FACE hDetectedFaceDst);

/**
 * Gets the bounds of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param sBounds [out] Bounds of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetBounds(ID3_DETECTED_FACE hDetectedFace, id3FaceRectangle *sBounds);

/**
 * Sets the bounds of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param sBounds [in] Bounds of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_SetBounds(ID3_DETECTED_FACE hDetectedFace, id3FaceRectangle sBounds);

/**
 * Gets the confidence score of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param detectionScore [out] Confidence score of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetDetectionScore(ID3_DETECTED_FACE hDetectedFace, int *detectionScore);

/**
 * Sets the confidence score of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param detectionScore [in] Confidence score of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_SetDetectionScore(ID3_DETECTED_FACE hDetectedFace, int detectionScore);

/**
 * Gets the ID of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param id [out] ID of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetId(ID3_DETECTED_FACE hDetectedFace, int *id);

/**
 * Sets the ID of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param id [in] ID of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_SetId(ID3_DETECTED_FACE hDetectedFace, int id);

/**
 * Gets the landmarks (eyes, nose and mouth corners) of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param hLandmarks [out] Landmarks (eyes, nose and mouth corners) of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetLandmarks(ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks);

/**
 * Sets the landmarks (eyes, nose and mouth corners) of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param hLandmarks [in] Landmarks (eyes, nose and mouth corners) of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_SetLandmarks(ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks);

/**
 * Imports the face object from a buffer.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param data [in] Buffer to import the face object from.
 * @param dataSize [in] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_FromBuffer(ID3_DETECTED_FACE hDetectedFace, unsigned char *data, int dataSize);

/**
 * Imports the face object from a file.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param path [in] Path to the file to import the face object from.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_FromFile(ID3_DETECTED_FACE hDetectedFace, const char *path);

/**
 * Creates a detected face from values.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param sBounds [in] Bounds of the detected face.
 * @param detectionScore [in] Confidence score of the detected face.
 * @param id [in] ID of the detected face.
 * @param hLandmarks [in] Landmarks (eyes, nose and mouth corners) of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_FromValues(ID3_DETECTED_FACE hDetectedFace, id3FaceRectangle sBounds, int detectionScore, int id, ID3_FACE_POINT_LIST hLandmarks);

/**
 * Gets the distance between the detected face and the camera when using a depth map in pixels.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param hDepthImage [in] Depth image to process.
 * @param distanceToCamera [out] Computed distance to camera in pixels.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetDistanceToCamera(ID3_DETECTED_FACE hDetectedFace, ID3_FACE_IMAGE hDepthImage, int *distanceToCamera);

/**
 * Gets the distance between the eyes (IOD) of the detected face in pixels.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param iod [out] Computed interocular distance (IOD) in pixels.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetInterocularDistance(ID3_DETECTED_FACE hDetectedFace, int *iod);

/**
 * Gets the portrait bounds of the detected face.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param eyeImageWidthRatio [in] Ratio between eye distance and image width. Must be in the range ]0;1[. Default recommended value is 0.25.
 * @param eyeImageHeightRatio [in] Ratio between eye distance to top and image height. Must be in the range ]0;1[. Default recommended value is 0.45.
 * @param imageRatio [in] Ratio between image height and image width. Default recommended value is 1.33 (4/3).
 * @param sPortraitBounds [out] Portrait bounds of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_GetPortraitBounds(ID3_DETECTED_FACE hDetectedFace, float eyeImageWidthRatio, float eyeImageHeightRatio, float imageRatio, id3FaceRectangle *sPortraitBounds);

/**
 * Rescales the detected face object bounding box and landmarks. This function can be useful if the image was downscaled to speed up detection, then you need to upscale the detected face to fit the source image size.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param scale [in] The multiplicative rescaling factor to apply to the face object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Rescale(ID3_DETECTED_FACE hDetectedFace, float scale);

/**
 * Rotates the face object by a given angle in degrees from a given center.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param angle [in] Angle of the rotation to apply to the face object.
 * @param sCenter [in] Center of the rotation to apply to the face object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Rotate(ID3_DETECTED_FACE hDetectedFace, int angle, id3FacePoint sCenter);

/**
 * Saves the face object to a file.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param path [in] Path to the file to export the face object to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Save(ID3_DETECTED_FACE hDetectedFace, const char *path);

/**
 * Exports the face object to a buffer.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param data [out] Buffer to export the face object to.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_ToBuffer(ID3_DETECTED_FACE hDetectedFace, unsigned char *data, int *dataSize);

/**
 * Translates the face object.
 * @param hDetectedFace [in] Handle to the DetectedFace object.
 * @param tx [in] Translation to apply to the face object alongside the x-axis.
 * @param ty [in] Translation to apply to the face object alongside the y-axis.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFace_Translate(ID3_DETECTED_FACE hDetectedFace, int tx, int ty);

#ifdef __cplusplus
}
#endif

#endif
