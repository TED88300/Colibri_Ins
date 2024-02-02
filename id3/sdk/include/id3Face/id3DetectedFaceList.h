//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3DetectedFaceList_h
#define _id3DetectedFaceList_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3DetectedFace.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a DetectedFaceList object of the Face module.
 */
typedef struct id3DetectedFaceList *ID3_DETECTED_FACE_LIST;

/**
 * @brief Initializes a DetectedFaceList object.
 * @param phDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_Initialize(ID3_DETECTED_FACE_LIST *phDetectedFaceList);

/**
 * @brief Releases the memory allocated for a DetectedFaceList.
 * @param phDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_Dispose(ID3_DETECTED_FACE_LIST *phDetectedFaceList);

/**
 * @brief Checks if the handle object is valid.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_CheckHandle(ID3_DETECTED_FACE_LIST hDetectedFaceList);

/**
 * @brief Copies an instance of DetectedFaceList object to another.
 * @param hDetectedFaceListSrc [in] Handle to the source DetectedFaceList object.
 * @param hDetectedFaceListDst [in] Handle to the destination DetectedFaceList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_CopyTo(ID3_DETECTED_FACE_LIST hDetectedFaceListSrc, ID3_DETECTED_FACE_LIST hDetectedFaceListDst);

/**
 * Adds an item to the DetectedFaceList object.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param hDetectedFaceItem [in] DetectedFace item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_Add(ID3_DETECTED_FACE_LIST hDetectedFaceList, ID3_DETECTED_FACE hDetectedFaceItem);

/**
 * Clears the DetectedFaceList object.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_Clear(ID3_DETECTED_FACE_LIST hDetectedFaceList);

/**
 * Gets an item of the DetectedFaceList object.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param index [in] Index of the DetectedFace item to get.
 * @param hDetectedFaceItem [out] DetectedFace item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_Get(ID3_DETECTED_FACE_LIST hDetectedFaceList, int index, ID3_DETECTED_FACE hDetectedFaceItem);

/**
 * Gets the number of elements in the DetectedFaceList object.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param count [out] Number of elements in the DetectedFace object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_GetCount(ID3_DETECTED_FACE_LIST hDetectedFaceList, int *count);

/**
 * Removes an element of the DetectedFaceList object.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param index [in] Index of the DetectedFace item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_RemoveAt(ID3_DETECTED_FACE_LIST hDetectedFaceList, int index);

/**
 * Finds a detected face by ID.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param id [in] ID of the detected face to find in the list.
 * @param hDetectedFace [out] Found detected face.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_FindDetectedFace(ID3_DETECTED_FACE_LIST hDetectedFaceList, int id, ID3_DETECTED_FACE hDetectedFace);

/**
 * Gets the list of IDs in the list.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param ids [out] List of IDs in the list.
 * @param idsSize [in,out] Size of the 'ids' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_GetIdList(ID3_DETECTED_FACE_LIST hDetectedFaceList, int *ids, int *idsSize);

/**
 * Gets the largest face in the list.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param hLargestFace [out] Largest detected face in the list.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_GetLargestFace(ID3_DETECTED_FACE_LIST hDetectedFaceList, ID3_DETECTED_FACE hLargestFace);

/**
 * Rescales all detected faces in the list.
 * @param hDetectedFaceList [in] Handle to the DetectedFaceList object.
 * @param scale [in] Scale factor to apply. Range is [0;+inf[.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3DetectedFaceList_RescaleAll(ID3_DETECTED_FACE_LIST hDetectedFaceList, float scale);

#ifdef __cplusplus
}
#endif

#endif
