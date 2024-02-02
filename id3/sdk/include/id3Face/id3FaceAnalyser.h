//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceAnalyser_h
#define _id3FaceAnalyser_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3DetectedFace.h>
#include <id3Face/id3FaceAttributes.h>
#include <id3Face/id3FaceBackgroundUniformity.h>
#include <id3Face/id3FaceExpression.h>
#include <id3Face/id3FacePointList.h>
#include <id3Face/id3FaceEyeGaze.h>
#include <id3Face/id3FaceGeometricAttributes.h>
#include <id3Face/id3FaceGlassesAttributes.h>
#include <id3Face/id3FacePhotographicAttributes.h>
#include <id3Face/id3FacePose.h>
#include <id3Face/id3FaceOcclusionScores.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceAnalyser object of the Face module.
 */
typedef struct id3FaceAnalyser *ID3_FACE_ANALYSER;

/**
 * @brief Initializes a FaceAnalyser object.
 * @param phFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_Initialize(ID3_FACE_ANALYSER *phFaceAnalyser);

/**
 * @brief Releases the memory allocated for a FaceAnalyser.
 * @param phFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_Dispose(ID3_FACE_ANALYSER *phFaceAnalyser);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_CheckHandle(ID3_FACE_ANALYSER hFaceAnalyser);

/**
 * Gets the sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param expressionSensibility [out] Sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_GetExpressionSensibility(ID3_FACE_ANALYSER hFaceAnalyser, int *expressionSensibility);

/**
 * Sets the sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param expressionSensibility [in] Sensibility of the expression classifier. The higher the value, the more sensitive the algorithm will be, meaning that it will be less likely to estimate neutral expression out of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_SetExpressionSensibility(ID3_FACE_ANALYSER hFaceAnalyser, int expressionSensibility);

/**
 * Computes the age of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param age [out] Estimated age of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeAge(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *age);

/**
 * Computes the attributes of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param sAttributes [out] Estimated attributes of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeAttributes(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, id3FaceAttributes *sAttributes);

/**
 * Computes the background uniformity behind a detected face. This function must be used for a portrait image with only one face in it. A high uniformity score means that the background is uniform.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param sBackgroundUniformity [out] Estimated background uniformity. Both color and texture scores are in the range [0:100]. The minimum recommended thresholds are respectively 80 for color and 80 for texture.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeBackgroundUniformity(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, id3FaceBackgroundUniformity *sBackgroundUniformity);

/**
 * Computes the expression of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param eExpression [out] Estimated expression of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeExpression(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, id3FaceExpression *eExpression);

/**
 * Computes the eye gaze of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param sEyeGaze [out] Estimated gaze of left and right eyes of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeEyeGaze(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, id3FaceEyeGaze *sEyeGaze);

/**
 * Computes the eye openness of a detected face. The minimum recommanded value for is 90.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param eyeOpennessScores [out] Estimated openness scores of left and right eyes of the detected face in this order.
 * @param eyeOpennessScoresSize [in,out] Size of the 'eyeOpennessScores' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeEyeOpenness(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, int *eyeOpennessScores, int *eyeOpennessScoresSize);

/**
 * Computes the eye redness of a detected face. The maximum recommanded value for an ICAO-compliant portrait is 10.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param eyeRednessScores [out] Estimated redness scores of left and right eyes of the detected face in this order.
 * @param eyeRednessScoresSize [in,out] Size of the 'eyeRednessScores' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeEyeRedness(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, int *eyeRednessScores, int *eyeRednessScoresSize);

/**
 * Computes the geometric attributes of a detected face. This function must be used for a portrait image with only one face in it.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param sGeometricAttributes [out] Estimated geometric attributes of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeGeometricAttributes(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, id3FaceGeometricAttributes *sGeometricAttributes);

/**
 * Computes the glasses attributes of a detected face. This function must be used for a portrait image with only one face in it.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param sGlassesAttributes [out] Estimated glasses attributes of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeGlassesAttributes(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, id3FaceGlassesAttributes *sGlassesAttributes);

/**
 * Computes 68 landmarks of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [out] Estimated landmarks of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputeLandmarks(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks);

/**
 * Computes the photographic attributes of a detected face. This function must be used for a portrait image with only one face in it.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param hLandmarks [in] Estimated landmarks of the detected face. Must be computed with the face analyser.
 * @param sPhotographicAttributes [out] Estimated photographic attributes of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputePhotographicAttributes(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, ID3_FACE_POINT_LIST hLandmarks, id3FacePhotographicAttributes *sPhotographicAttributes);

/**
 * Computes the pose of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hDetectedFace [in] Detected face to process.
 * @param sPose [out] Estimated pose of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_ComputePose(ID3_FACE_ANALYSER hFaceAnalyser, ID3_DETECTED_FACE hDetectedFace, id3FacePose *sPose);

/**
 * Detects the presence of a face mask on a detected face. A high score means that there is a high chance that the person is wearing a mask. The minimum recommended threshold is 15.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param score [out] Face mask presence score of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_DetectFaceMask(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *score);

/**
 * Detects the presence of occlusions on top of a detected face.
 * @param hFaceAnalyser [in] Handle to the FaceAnalyser object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param sScores [out] Occlusion scores of the detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceAnalyser_DetectOcclusions(ID3_FACE_ANALYSER hFaceAnalyser, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, id3FaceOcclusionScores *sScores);

#ifdef __cplusplus
}
#endif

#endif
