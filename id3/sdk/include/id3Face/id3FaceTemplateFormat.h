//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceTemplateFormat_h
#define _id3FaceTemplateFormat_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceTemplateFormat of the Face module.
 */
typedef enum id3FaceTemplateFormat {
	/**
	 * Undefined template format.
	 */
	id3FaceTemplateFormat_Undefined = 0x0000,
	/**
	 * Template generated with model FaceEncoder8A.
	 */
	id3FaceTemplateFormat_V8A = 0x218A,
	/**
	 * Template generated with model FaceEncoder8B.
	 */
	id3FaceTemplateFormat_V8B = 0x218B,
	/**
	 * Template generated with model FaceEncoder9A.
	 */
	id3FaceTemplateFormat_V9A = 0x219A,
	/**
	 * Template generated with model FaceEncoder9B.
	 */
	id3FaceTemplateFormat_V9B = 0x219B,
	/**
	 * Template generated with model FacePeriocularEncoder2A.
	 */
	id3FaceTemplateFormat_PeriocularV2A = 0x222A,
	/**
	 * Template generated with model FacePeriocularEncoder2B.
	 */
	id3FaceTemplateFormat_PeriocularV2B = 0x222B,
} id3FaceTemplateFormat;

#ifdef __cplusplus
}
#endif

#endif
