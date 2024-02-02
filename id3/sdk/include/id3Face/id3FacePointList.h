//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FacePointList_h
#define _id3FacePointList_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FacePoint.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a PointList object of the Face module.
 */
typedef struct id3FacePointList *ID3_FACE_POINT_LIST;

/**
 * @brief Initializes a PointList object.
 * @param phPointList [in] Handle to the PointList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_Initialize(ID3_FACE_POINT_LIST *phPointList);

/**
 * @brief Releases the memory allocated for a PointList.
 * @param phPointList [in] Handle to the PointList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_Dispose(ID3_FACE_POINT_LIST *phPointList);

/**
 * @brief Checks if the handle object is valid.
 * @param hPointList [in] Handle to the PointList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_CheckHandle(ID3_FACE_POINT_LIST hPointList);

/**
 * @brief Copies an instance of PointList object to another.
 * @param hPointListSrc [in] Handle to the source PointList object.
 * @param hPointListDst [in] Handle to the destination PointList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_CopyTo(ID3_FACE_POINT_LIST hPointListSrc, ID3_FACE_POINT_LIST hPointListDst);

/**
 * Adds an item to the PointList object.
 * @param hPointList [in] Handle to the PointList object.
 * @param sPointItem [in] Point item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_Add(ID3_FACE_POINT_LIST hPointList, id3FacePoint sPointItem);

/**
 * Clears the PointList object.
 * @param hPointList [in] Handle to the PointList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_Clear(ID3_FACE_POINT_LIST hPointList);

/**
 * Gets an item of the PointList object.
 * @param hPointList [in] Handle to the PointList object.
 * @param index [in] Index of the Point item to get.
 * @param sPointItem [out] Point item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_Get(ID3_FACE_POINT_LIST hPointList, int index, id3FacePoint *sPointItem);

/**
 * Gets the number of elements in the PointList object.
 * @param hPointList [in] Handle to the PointList object.
 * @param count [out] Number of elements in the Point object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_GetCount(ID3_FACE_POINT_LIST hPointList, int *count);

/**
 * Removes an element of the PointList object.
 * @param hPointList [in] Handle to the PointList object.
 * @param index [in] Index of the Point item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FacePointList_RemoveAt(ID3_FACE_POINT_LIST hPointList, int index);

#ifdef __cplusplus
}
#endif

#endif
