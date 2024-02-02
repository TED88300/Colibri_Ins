//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceMatcher_h
#define _id3FaceMatcher_h

#include <id3Face/id3FaceExports.h>
#include <id3Face/id3FaceTemplateList.h>
#include <id3Face/id3FacePoolingMethod.h>
#include <id3Face/id3FaceTemplate.h>
#include <id3Face/id3FaceTemplateDict.h>
#include <id3Face/id3FaceCandidateList.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Handle to a FaceMatcher object of the Face module.
 */
typedef struct id3FaceMatcher *ID3_FACE_MATCHER;

/**
 * @brief Initializes a FaceMatcher object.
 * @param phFaceMatcher [in] Handle to the FaceMatcher object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_Initialize(ID3_FACE_MATCHER *phFaceMatcher);

/**
 * @brief Releases the memory allocated for a FaceMatcher.
 * @param phFaceMatcher [in] Handle to the FaceMatcher object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_Dispose(ID3_FACE_MATCHER *phFaceMatcher);

/**
 * @brief Checks if the handle object is valid.
 * @param hFaceMatcher [in] Handle to the FaceMatcher object.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_CheckHandle(ID3_FACE_MATCHER hFaceMatcher);

/**
 * Compares two template lists and outputs a comparison score.
 * @param hFaceMatcher [in] Handle to the FaceMatcher object.
 * @param hReferenceList [in] Reference template list.
 * @param hProbeList [in] Probe template list.
 * @param ePoolingMethod [in] Pooling method to apply during the match process.
 * @param score [out] Comparison score. In the range [0:65535].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_CompareTemplateLists(ID3_FACE_MATCHER hFaceMatcher, ID3_FACE_TEMPLATE_LIST hReferenceList, ID3_FACE_TEMPLATE_LIST hProbeList, id3FacePoolingMethod ePoolingMethod, int *score);

/**
 * Compares two templates and outputs a comparison score.
 * @param hFaceMatcher [in] Handle to the FaceMatcher object.
 * @param hReference [in] Reference template.
 * @param hProbe [in] Probe template.
 * @param score [out] Comparison score. In the range [0:65535].
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_CompareTemplates(ID3_FACE_MATCHER hFaceMatcher, ID3_FACE_TEMPLATE hReference, ID3_FACE_TEMPLATE hProbe, int *score);

/**
 * Performs a one-to-many search of a biometric probe against a previously initialized dictionary of biometric references and outputs a candidate list.
 * @param hFaceMatcher [in] Handle to the FaceMatcher object.
 * @param hReferenceDict [in] Reference template dictionary.
 * @param hProbe [in] Probe template.
 * @param maxCandidates [in] Maximum number of candidates to output.
 * @param hCandidateList [in] List of candidates sorted by decreasing match score.
 * @return An error code. See id3FaceError file for the list of possible error codes.
 * @retval id3FaceError_Success The function succeeded.
 */
ID3FACE_C_API int ID3_CDECL id3FaceMatcher_SearchTemplate(ID3_FACE_MATCHER hFaceMatcher, ID3_FACE_TEMPLATE_DICT hReferenceDict, ID3_FACE_TEMPLATE hProbe, int maxCandidates, ID3_FACE_CANDIDATE_LIST hCandidateList);

#ifdef __cplusplus
}
#endif

#endif
