//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImageBuffer_h
#define _id3FaceImageBuffer_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a ImageBuffer object of the Face module.
 */
typedef struct id3FaceImageBuffer *ID3_FACE_IMAGE_BUFFER;

/**
 * @brief Initializes a ImageBuffer object.
 * @param phImageBuffer [in] Handle to the ImageBuffer object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageBuffer_Initialize(ID3_FACE_IMAGE_BUFFER *phImageBuffer);

/**
 * @brief Releases the memory allocated for a ImageBuffer.
 * @param phImageBuffer [in] Handle to the ImageBuffer object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageBuffer_Dispose(ID3_FACE_IMAGE_BUFFER *phImageBuffer);

/**
 * @brief Checks if the handle object is valid.
 * @param hImageBuffer [in] Handle to the ImageBuffer object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageBuffer_CheckHandle(ID3_FACE_IMAGE_BUFFER hImageBuffer);

/**
 * @brief Copies an instance of ImageBuffer object to another.
 * @param hImageBufferSrc [in] Handle to the source ImageBuffer object.
 * @param hImageBufferDst [in] Handle to the destination ImageBuffer object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageBuffer_CopyTo(ID3_FACE_IMAGE_BUFFER hImageBufferSrc, ID3_FACE_IMAGE_BUFFER hImageBufferDst);

/**
 * Gets the image buffer data.
 * @param hImageBuffer [in] Handle to the ImageBuffer object.
 * @param data [out] Data of the image buffer object.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImageBuffer_GetData(ID3_FACE_IMAGE_BUFFER hImageBuffer, unsigned char *data, int *dataSize);

#ifdef __cplusplus
}
#endif

#endif
