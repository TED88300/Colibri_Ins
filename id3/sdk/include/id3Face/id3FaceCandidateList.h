//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceCandidateList_h
#define _id3FaceCandidateList_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceCandidate.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceCandidateList object of the Face module.
 */
typedef struct id3FaceCandidateList *ID3_FACE_CANDIDATE_LIST;

/**
 * @brief Initializes a FaceCandidateList object.
 * @param phFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_Initialize(ID3_FACE_CANDIDATE_LIST *phFaceCandidateList);

/**
 * @brief Releases the memory allocated for a FaceCandidateList.
 * @param phFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_Dispose(ID3_FACE_CANDIDATE_LIST *phFaceCandidateList);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_CheckHandle(ID3_FACE_CANDIDATE_LIST hFaceCandidateList);

/**
 * @brief Copies an instance of FaceCandidateList object to another.
 * @param hFaceCandidateListSrc [in] Handle to the source FaceCandidateList object.
 * @param hFaceCandidateListDst [in] Handle to the destination FaceCandidateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_CopyTo(ID3_FACE_CANDIDATE_LIST hFaceCandidateListSrc, ID3_FACE_CANDIDATE_LIST hFaceCandidateListDst);

/**
 * Adds an item to the FaceCandidateList object.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @param hFaceCandidateItem [in] FaceCandidate item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_Add(ID3_FACE_CANDIDATE_LIST hFaceCandidateList, ID3_FACE_CANDIDATE hFaceCandidateItem);

/**
 * Clears the FaceCandidateList object.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_Clear(ID3_FACE_CANDIDATE_LIST hFaceCandidateList);

/**
 * Gets an item of the FaceCandidateList object.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @param index [in] Index of the FaceCandidate item to get.
 * @param hFaceCandidateItem [out] FaceCandidate item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_Get(ID3_FACE_CANDIDATE_LIST hFaceCandidateList, int index, ID3_FACE_CANDIDATE hFaceCandidateItem);

/**
 * Gets the number of elements in the FaceCandidateList object.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @param count [out] Number of elements in the FaceCandidate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_GetCount(ID3_FACE_CANDIDATE_LIST hFaceCandidateList, int *count);

/**
 * Removes an element of the FaceCandidateList object.
 * @param hFaceCandidateList [in] Handle to the FaceCandidateList object.
 * @param index [in] Index of the FaceCandidate item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceCandidateList_RemoveAt(ID3_FACE_CANDIDATE_LIST hFaceCandidateList, int index);

#ifdef __cplusplus
}
#endif

#endif
