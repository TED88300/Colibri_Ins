//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceTemplateList_h
#define _id3FaceTemplateList_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceTemplate.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceTemplateList object of the Face module.
 */
typedef struct id3FaceTemplateList *ID3_FACE_TEMPLATE_LIST;

/**
 * @brief Initializes a FaceTemplateList object.
 * @param phFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_Initialize(ID3_FACE_TEMPLATE_LIST *phFaceTemplateList);

/**
 * @brief Releases the memory allocated for a FaceTemplateList.
 * @param phFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_Dispose(ID3_FACE_TEMPLATE_LIST *phFaceTemplateList);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_CheckHandle(ID3_FACE_TEMPLATE_LIST hFaceTemplateList);

/**
 * @brief Copies an instance of FaceTemplateList object to another.
 * @param hFaceTemplateListSrc [in] Handle to the source FaceTemplateList object.
 * @param hFaceTemplateListDst [in] Handle to the destination FaceTemplateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_CopyTo(ID3_FACE_TEMPLATE_LIST hFaceTemplateListSrc, ID3_FACE_TEMPLATE_LIST hFaceTemplateListDst);

/**
 * Adds an item to the FaceTemplateList object.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @param hFaceTemplateItem [in] FaceTemplate item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_Add(ID3_FACE_TEMPLATE_LIST hFaceTemplateList, ID3_FACE_TEMPLATE hFaceTemplateItem);

/**
 * Clears the FaceTemplateList object.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_Clear(ID3_FACE_TEMPLATE_LIST hFaceTemplateList);

/**
 * Gets an item of the FaceTemplateList object.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @param index [in] Index of the FaceTemplate item to get.
 * @param hFaceTemplateItem [out] FaceTemplate item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_Get(ID3_FACE_TEMPLATE_LIST hFaceTemplateList, int index, ID3_FACE_TEMPLATE hFaceTemplateItem);

/**
 * Gets the number of elements in the FaceTemplateList object.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @param count [out] Number of elements in the FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_GetCount(ID3_FACE_TEMPLATE_LIST hFaceTemplateList, int *count);

/**
 * Removes an element of the FaceTemplateList object.
 * @param hFaceTemplateList [in] Handle to the FaceTemplateList object.
 * @param index [in] Index of the FaceTemplate item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateList_RemoveAt(ID3_FACE_TEMPLATE_LIST hFaceTemplateList, int index);

#ifdef __cplusplus
}
#endif

#endif
