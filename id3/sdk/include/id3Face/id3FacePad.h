//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePad_h
#define _id3FacePad_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3DetectedFace.h>
#include <id3Face/id3DetectedFaceAttackSupport.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FacePad object of the Face module.
 */
typedef struct id3FacePad *ID3_FACE_PAD;

/**
 * @brief Initializes a FacePad object.
 * @param phFacePad [in] Handle to the FacePad object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_Initialize(ID3_FACE_PAD *phFacePad);

/**
 * @brief Releases the memory allocated for a FacePad.
 * @param phFacePad [in] Handle to the FacePad object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_Dispose(ID3_FACE_PAD *phFacePad);

/**
 * @brief Checks if the handle object is valid.
 * @param hFacePad [in] Handle to the FacePad object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_CheckHandle(ID3_FACE_PAD hFacePad);

/**
 * Computes a blurriness score for a color image. An attack presented on a low resolution support has more chance to be blurred than a bonafide. The maximum recommended value is 20.
 * @param hFacePad [in] Handle to the FacePad object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param score [out] Computed blurriness score. In the range [0:100].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_ComputeBlurrinessScore(ID3_FACE_PAD hFacePad, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *score);

/**
 * Computes the PAD score of a detected face using only the color image. A high score means a high probability for the face to be bona-fide, hence not an attack. The minimum recommended value is 50.
 * @param hFacePad [in] Handle to the FacePad object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param score [out] Computed PAD score. In the range [0:100].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_ComputeColorBasedScore(ID3_FACE_PAD hFacePad, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *score);

/**
 * Computes the PAD score of a detected face using a depth map image. A high score means a high probability for the face to be bona-fide, hence not an attack. The minimum recommended value is 10.
 * @param hFacePad [in] Handle to the FacePad object.
 * @param hImage [in] Source image to process. Must be Grayscale 16 Bits.
 * @param hDetectedFace [in] Detected face to process.
 * @param score [out] Computed PAD score. In the range [0:100].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_ComputeDepthBasedScore(ID3_FACE_PAD hFacePad, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *score);

/**
 * Computes the Moiré score of a detected face using a color image. An attack presented on a screen will likely present Moiré effects whereas a bonafide will not. The maximum recommended value is 10.
 * @param hFacePad [in] Handle to the FacePad object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param score [out] Computed Moiré score. In the range [0:100].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_ComputeMoireScore(ID3_FACE_PAD hFacePad, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, int *score);

/**
 * Detects if an attack support surrounds the detected face. The recommended usage is to consider the image to be an attack as soon as an attack support is detected.
 * @param hFacePad [in] Handle to the FacePad object.
 * @param hImage [in] Source image to process.
 * @param hDetectedFace [in] Detected face to process.
 * @param sDetectedFaceAttackSupport [out] Detected face attack support.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePad_DetectAttackSupport(ID3_FACE_PAD hFacePad, ID3_FACE_IMAGE hImage, ID3_DETECTED_FACE hDetectedFace, id3DetectedFaceAttackSupport *sDetectedFaceAttackSupport);

#ifdef __cplusplus
}
#endif

#endif
