//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImageList_h
#define _id3FaceImageList_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceImage.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a ImageList object of the Face module.
 */
typedef struct id3FaceImageList *ID3_FACE_IMAGE_LIST;

/**
 * @brief Initializes a ImageList object.
 * @param phImageList [in] Handle to the ImageList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_Initialize(ID3_FACE_IMAGE_LIST *phImageList);

/**
 * @brief Releases the memory allocated for a ImageList.
 * @param phImageList [in] Handle to the ImageList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_Dispose(ID3_FACE_IMAGE_LIST *phImageList);

/**
 * @brief Checks if the handle object is valid.
 * @param hImageList [in] Handle to the ImageList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_CheckHandle(ID3_FACE_IMAGE_LIST hImageList);

/**
 * @brief Copies an instance of ImageList object to another.
 * @param hImageListSrc [in] Handle to the source ImageList object.
 * @param hImageListDst [in] Handle to the destination ImageList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_CopyTo(ID3_FACE_IMAGE_LIST hImageListSrc, ID3_FACE_IMAGE_LIST hImageListDst);

/**
 * Adds an item to the ImageList object.
 * @param hImageList [in] Handle to the ImageList object.
 * @param hImageItem [in] Image item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_Add(ID3_FACE_IMAGE_LIST hImageList, ID3_FACE_IMAGE hImageItem);

/**
 * Clears the ImageList object.
 * @param hImageList [in] Handle to the ImageList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_Clear(ID3_FACE_IMAGE_LIST hImageList);

/**
 * Gets an item of the ImageList object.
 * @param hImageList [in] Handle to the ImageList object.
 * @param index [in] Index of the Image item to get.
 * @param hImageItem [out] Image item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_Get(ID3_FACE_IMAGE_LIST hImageList, int index, ID3_FACE_IMAGE hImageItem);

/**
 * Gets the number of elements in the ImageList object.
 * @param hImageList [in] Handle to the ImageList object.
 * @param count [out] Number of elements in the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_GetCount(ID3_FACE_IMAGE_LIST hImageList, int *count);

/**
 * Removes an element of the ImageList object.
 * @param hImageList [in] Handle to the ImageList object.
 * @param index [in] Index of the Image item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageList_RemoveAt(ID3_FACE_IMAGE_LIST hImageList, int index);

#ifdef __cplusplus
}
#endif

#endif
