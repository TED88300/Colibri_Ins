//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceTemplateDict_h
#define _id3FaceTemplateDict_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceTemplate.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceTemplateDict object of the Face module.
 */
typedef struct id3FaceTemplateDict *ID3_FACE_TEMPLATE_DICT;

/**
 * @brief Initializes a FaceTemplateDict object.
 * @param phFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Initialize(ID3_FACE_TEMPLATE_DICT *phFaceTemplateDict);

/**
 * @brief Releases the memory allocated for a FaceTemplateDict.
 * @param phFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Dispose(ID3_FACE_TEMPLATE_DICT *phFaceTemplateDict);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_CheckHandle(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict);

/**
 * @brief Copies an instance of FaceTemplateDict object to another.
 * @param hFaceTemplateDictSrc [in] Handle to the source FaceTemplateDict object.
 * @param hFaceTemplateDictDst [in] Handle to the destination FaceTemplateDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_CopyTo(ID3_FACE_TEMPLATE_DICT hFaceTemplateDictSrc, ID3_FACE_TEMPLATE_DICT hFaceTemplateDictDst);

/**
 * Adds an item to the FaceTemplateDict object.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @param key [in] Unique key of the FaceTemplate item to add.
 * @param hFaceTemplateItem [in] FaceTemplate item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Add(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict, const char *key, ID3_FACE_TEMPLATE hFaceTemplateItem);

/**
 * Clears the FaceTemplateDict object.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Clear(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict);

/**
 * Gets an item of the FaceTemplateDict object.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @param key [in] Unique key of the FaceTemplate item to get.
 * @param hFaceTemplateItem [out] FaceTemplate item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Get(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict, const char *key, ID3_FACE_TEMPLATE hFaceTemplateItem);

/**
 * Gets the number of elements in the FaceTemplateDict object.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @param count [out] Number of elements in the FaceTemplate object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_GetCount(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict, int *count);

/**
 * Removes an element of the FaceTemplateDict object.
 * @param hFaceTemplateDict [in] Handle to the FaceTemplateDict object.
 * @param key [in] Unique key of the FaceTemplate item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceTemplateDict_Remove(ID3_FACE_TEMPLATE_DICT hFaceTemplateDict, const char *key);

#ifdef __cplusplus
}
#endif

#endif
