//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImageDict_h
#define _id3FaceImageDict_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceImage.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a ImageDict object of the Face module.
 */
typedef struct id3FaceImageDict *ID3_FACE_IMAGE_DICT;

/**
 * @brief Initializes a ImageDict object.
 * @param phImageDict [in] Handle to the ImageDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Initialize(ID3_FACE_IMAGE_DICT *phImageDict);

/**
 * @brief Releases the memory allocated for a ImageDict.
 * @param phImageDict [in] Handle to the ImageDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Dispose(ID3_FACE_IMAGE_DICT *phImageDict);

/**
 * @brief Checks if the handle object is valid.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_CheckHandle(ID3_FACE_IMAGE_DICT hImageDict);

/**
 * @brief Copies an instance of ImageDict object to another.
 * @param hImageDictSrc [in] Handle to the source ImageDict object.
 * @param hImageDictDst [in] Handle to the destination ImageDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_CopyTo(ID3_FACE_IMAGE_DICT hImageDictSrc, ID3_FACE_IMAGE_DICT hImageDictDst);

/**
 * Adds an item to the ImageDict object.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @param key [in] Unique key of the Image item to add.
 * @param hImageItem [in] Image item to add.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Add(ID3_FACE_IMAGE_DICT hImageDict, const char *key, ID3_FACE_IMAGE hImageItem);

/**
 * Clears the ImageDict object.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Clear(ID3_FACE_IMAGE_DICT hImageDict);

/**
 * Gets an item of the ImageDict object.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @param key [in] Unique key of the Image item to get.
 * @param hImageItem [out] Image item to get.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Get(ID3_FACE_IMAGE_DICT hImageDict, const char *key, ID3_FACE_IMAGE hImageItem);

/**
 * Gets the number of elements in the ImageDict object.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @param count [out] Number of elements in the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_GetCount(ID3_FACE_IMAGE_DICT hImageDict, int *count);

/**
 * Removes an element of the ImageDict object.
 * @param hImageDict [in] Handle to the ImageDict object.
 * @param key [in] Unique key of the Image item to remove.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageDict_Remove(ID3_FACE_IMAGE_DICT hImageDict, const char *key);

#ifdef __cplusplus
}
#endif

#endif
