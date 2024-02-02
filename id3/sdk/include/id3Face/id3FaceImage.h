//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceImage_h
#define _id3FaceImage_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FacePixelFormat.h>
#include <id3Face/id3FaceRectangle.h>
#include <id3Face/id3FaceImage.h>
#include <id3Face/id3FaceImageFormat.h>
#include <id3Face/id3FaceImageBuffer.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a Image object of the Face module.
 */
typedef struct id3FaceImage *ID3_FACE_IMAGE;

/**
 * @brief Initializes a Image object.
 * @param phImage [in] Handle to the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Initialize(ID3_FACE_IMAGE *phImage);

/**
 * @brief Releases the memory allocated for a Image.
 * @param phImage [in] Handle to the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Dispose(ID3_FACE_IMAGE *phImage);

/**
 * @brief Checks if the handle object is valid.
 * @param hImage [in] Handle to the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_CheckHandle(ID3_FACE_IMAGE hImage);

/**
 * @brief Copies an instance of Image object to another.
 * @param hImageSrc [in] Handle to the source Image object.
 * @param hImageDst [in] Handle to the destination Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_CopyTo(ID3_FACE_IMAGE hImageSrc, ID3_FACE_IMAGE hImageDst);

/**
 * Gets the raw data buffer of the image.
 * @param hImage [in] Handle to the Image object.
 * @param data [out] Raw data buffer of the image.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetData(ID3_FACE_IMAGE hImage, unsigned char *data, int *dataSize);

/**
 * Gets the height in pixels.
 * @param hImage [in] Handle to the Image object.
 * @param height [out] Height in pixels.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetHeight(ID3_FACE_IMAGE hImage, int *height);

/**
 * Gets the pixel depth.
 * @param hImage [in] Handle to the Image object.
 * @param pixelDepth [out] Pixel depth.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetPixelDepth(ID3_FACE_IMAGE hImage, int *pixelDepth);

/**
 * Gets the pixel format.
 * @param hImage [in] Handle to the Image object.
 * @param ePixelFormat [out] Pixel format.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetPixelFormat(ID3_FACE_IMAGE hImage, id3FacePixelFormat *ePixelFormat);

/**
 * Gets the stride in bytes.
 * @param hImage [in] Handle to the Image object.
 * @param stride [out] Stride in bytes.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetStride(ID3_FACE_IMAGE hImage, int *stride);

/**
 * Gets the width in pixels.
 * @param hImage [in] Handle to the Image object.
 * @param width [out] Width in pixels.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetWidth(ID3_FACE_IMAGE hImage, int *width);

/**
 * Applies a gamma correction to the image object.
 * @param hImage [in] Handle to the Image object.
 * @param contrast [in] Contrast coefficient to apply. Range is [-255;255]. Default value is 0.
 * @param brightness [in] Brightness coefficient to apply. Range is [-255;255]. Default value is 0.
 * @param gamma [in] Gamma coefficient to apply. Range is [0.25;2.50]. Default value is 1.00.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_CorrectGamma(ID3_FACE_IMAGE hImage, int contrast, int brightness, float gamma);

/**
 * Downscales an image so that its maximum dimension equals the given maximum size while preserving the aspect ratio. If the maximum dimension is already smaller than the given maximum size, the function does nothing and the returned scale ratio is 1.
 * @param hImage [in] Handle to the Image object.
 * @param maxSize [in] Maximum size to fit the image in. Range is [1:+inf[.
 * @param scaleRatio [out] Applied scale ratio. Range is ]0:1].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Downscale(ID3_FACE_IMAGE hImage, int maxSize, float *scaleRatio);

/**
 * Extracts a region of interest in the image object according to the given bounds.
 * @param hImage [in] Handle to the Image object.
 * @param sBounds [in] Bounds of the crop to extract.
 * @param hImageRoi [out] Extracted region of interest.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_ExtractRoi(ID3_FACE_IMAGE hImage, id3FaceRectangle sBounds, ID3_FACE_IMAGE hImageRoi);

/**
 * Flips the image object.
 * @param hImage [in] Handle to the Image object.
 * @param flipHorizontally [in] Set to 'true' to flip horizontally the image.
 * @param flipVertically [in] Set to 'true' to flip vertically the image.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Flip(ID3_FACE_IMAGE hImage, bool flipHorizontally, bool flipVertically);

/**
 * Imports the image object from a buffer.
 * @param hImage [in] Handle to the Image object.
 * @param data [in] Buffer to import the image object from.
 * @param dataSize [in] Size of the 'data' buffer.
 * @param ePixelFormat [in] The destination pixel format to convert the input to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_FromBuffer(ID3_FACE_IMAGE hImage, unsigned char *data, int dataSize, id3FacePixelFormat ePixelFormat);

/**
 * Imports the image object from a file.
 * @param hImage [in] Handle to the Image object.
 * @param filepath [in] Path to the file to import the image object from.
 * @param ePixelFormat [in] The destination pixel format to convert the input to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_FromFile(ID3_FACE_IMAGE hImage, const char *filepath, id3FacePixelFormat ePixelFormat);

/**
 * Imports the image object from a raw buffer.
 * @param hImage [in] Handle to the Image object.
 * @param pixels [in] Buffer containing the pixels of the image.
 * @param pixelsSize [in] Size of the 'pixels' buffer.
 * @param width [in] Width in pixels of the image.
 * @param height [in] Height in pixels of the image.
 * @param stride [in] Stride in pixels of the image.
 * @param eSrcPixelFormat [in] The source pixel format of the input image.
 * @param eDstPixelFormat [in] The destination pixel format to convert the input image to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_FromRawBuffer(ID3_FACE_IMAGE hImage, unsigned char *pixels, int pixelsSize, int width, int height, int stride, id3FacePixelFormat eSrcPixelFormat, id3FacePixelFormat eDstPixelFormat);

/**
 * Imports the image object from YUV planes.
 * @param hImage [in] Handle to the Image object.
 * @param yPlane [in] Buffer containing the Y plane.
 * @param yPlaneSize [in] Size of the 'yPlane' buffer.
 * @param uPlane [in] Buffer containing the U plane.
 * @param uPlaneSize [in] Size of the 'uPlane' buffer.
 * @param vPlane [in] Buffer containing the V plane.
 * @param vPlaneSize [in] Size of the 'vPlane' buffer.
 * @param yWidth [in] Width in pixels of the Y plane.
 * @param yHeight [in] Height in pixels of the Y plane.
 * @param uvPixelStride [in] Pixel-level stride in pixels of the U and V planes.
 * @param uvRowStride [in] Row-level stride in pixels of the U and V planes.
 * @param eDstPixelFormat [in] The destination pixel format to convert the input image to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_FromYuvPlanes(ID3_FACE_IMAGE hImage, unsigned char *yPlane, int yPlaneSize, unsigned char *uPlane, int uPlaneSize, unsigned char *vPlane, int vPlaneSize, int yWidth, int yHeight, int uvPixelStride, int uvRowStride, id3FacePixelFormat eDstPixelFormat);

/**
 * Gets a pointer to the pixels of the image. Unsafe! The user must handle the pixels pointer carefully.
 * @param hImage [in] Handle to the Image object.
 * @param pixels [out] Pointer to the pixels of the image.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_GetPixels(ID3_FACE_IMAGE hImage, void **pixels);

/**
 * Reallocates the internal memory of an image object from parameters. If the given parameters are the same as the ones of the object, then there is nothing done in this function.
 * @param hImage [in] Handle to the Image object.
 * @param width [in] Width to reallocate the image object to.
 * @param height [in] Height to reallocate the image object to.
 * @param ePixelFormat [in] Pixel format to reallocate the image object to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Reallocate(ID3_FACE_IMAGE hImage, int width, int height, id3FacePixelFormat ePixelFormat);

/**
 * Resizes the image object to the required width and height.
 * @param hImage [in] Handle to the Image object.
 * @param width [in] Width to resize the image object to.
 * @param height [in] Height to resize the image object to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Resize(ID3_FACE_IMAGE hImage, int width, int height);

/**
 * Rotates the image object of the required angle. The rotation is performed counter-clockwise.
 * @param hImage [in] Handle to the Image object.
 * @param angle [in] Counter-clockwise angle to apply. Supported values are [0, 90, 180, 270].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Rotate(ID3_FACE_IMAGE hImage, int angle);

/**
 * Exports the image object to a file. The compression level meaning depends on the used algorithm:
 * - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
 * - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
 * - For PNG compression, the value is the compression rate and may vary from 1 to 10.
 * - For all other formats, the value is ignored.
 * @param hImage [in] Handle to the Image object.
 * @param filepath [in] Path to the file to export the image object to.
 * @param compressionLevel [in] Compression level to apply.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Save(ID3_FACE_IMAGE hImage, const char *filepath, float compressionLevel);

/**
 * Sets the image object fields. This function does not allocate any memory and is unsafe! The user must handle the pixels pointer carefully.
 * @param hImage [in] Handle to the Image object.
 * @param width [in] Width in pixels of the image.
 * @param height [in] Height in pixels of the image.
 * @param ePixelFormat [in] The pixel format of the image.
 * @param pixels [in] Pointer to the pixels of the image. Unsafe!
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Set(ID3_FACE_IMAGE hImage, int width, int height, id3FacePixelFormat ePixelFormat, void *pixels);

/**
 * Exports the image object to a buffer. The compression level meaning depends on the used algorithm:
 * - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
 * - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
 * - For PNG compression, the value is the compression rate and may vary from 1 to 10.
 * - For all other formats, the value is ignored.
 * @param hImage [in] Handle to the Image object.
 * @param eImageFormat [in] The image format to export the image to.
 * @param compressionLevel [in] Compression level to apply.
 * @param data [out] Buffer to export the image object to.
 * @param dataSize [in,out] Size of the 'data' buffer.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_ToBuffer(ID3_FACE_IMAGE hImage, id3FaceImageFormat eImageFormat, float compressionLevel, unsigned char *data, int *dataSize);

/**
 * Exports the image object to a buffer object. The compression level meaning depends on the used algorithm:
 * - For JPEG compression, the value is the expected quality and may vary from 1 to 100.
 * - For JPEG2000 compression, the value is the compression rate and may vary from 1 to 512.
 * - For PNG compression, the value is the compression rate and may vary from 1 to 10.
 * - For all other formats, the value is ignored.
 * @param hImage [in] Handle to the Image object.
 * @param eImageFormat [in] The image format to export the image to.
 * @param compressionLevel [in] Compression level to apply.
 * @param hBuffer [in] Buffer object to export the image object to.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_ToBufferObject(ID3_FACE_IMAGE hImage, id3FaceImageFormat eImageFormat, float compressionLevel, ID3_FACE_IMAGE_BUFFER hBuffer);

/**
 * Transposes the image object.
 * @param hImage [in] Handle to the Image object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceImage_Transpose(ID3_FACE_IMAGE hImage);

#ifdef __cplusplus
}
#endif

#endif
