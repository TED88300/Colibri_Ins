//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceCandidate_h
#define _id3FaceCandidate_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceCandidate object of the Face module.
 */
typedef struct id3FaceCandidate *ID3_FACE_CANDIDATE;

/**
 * @brief Initializes a FaceCandidate object.
 * @param phFaceCandidate [in] Handle to the FaceCandidate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_Initialize(ID3_FACE_CANDIDATE *phFaceCandidate);

/**
 * @brief Releases the memory allocated for a FaceCandidate.
 * @param phFaceCandidate [in] Handle to the FaceCandidate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_Dispose(ID3_FACE_CANDIDATE *phFaceCandidate);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceCandidate [in] Handle to the FaceCandidate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_CheckHandle(ID3_FACE_CANDIDATE hFaceCandidate);

/**
 * @brief Copies an instance of FaceCandidate object to another.
 * @param hFaceCandidateSrc [in] Handle to the source FaceCandidate object.
 * @param hFaceCandidateDst [in] Handle to the destination FaceCandidate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_CopyTo(ID3_FACE_CANDIDATE hFaceCandidateSrc, ID3_FACE_CANDIDATE hFaceCandidateDst);

/**
 * Gets the ID of the most similar face template as defined in the reference face template list used to perform the search.
 * @param hFaceCandidate [in] Handle to the FaceCandidate object.
 * @param id [out] ID of the most similar face template as defined in the reference face template list used to perform the search.
 * @param idSize [in,out] Size of the 'id' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_GetId(ID3_FACE_CANDIDATE hFaceCandidate, char *id, int *idSize);

/**
 * Gets the match score between the face probe template and the most similar one in the reference face template list used to perform the search.
 * @param hFaceCandidate [in] Handle to the FaceCandidate object.
 * @param score [out] Match score between the face probe template and the most similar one in the reference face template list used to perform the search.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidate_GetScore(ID3_FACE_CANDIDATE hFaceCandidate, int *score);

#ifdef __cplusplus
}
#endif

#endif
