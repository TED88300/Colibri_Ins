//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceTemplateBufferType_h
#define _id3FaceTemplateBufferType_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceTemplateBufferType of the Face module.
 */
typedef enum id3FaceTemplateBufferType {
	/**
	 * Standard face template buffer type.
	 */
	id3FaceTemplateBufferType_Normal = 0,
	/**
	 * Card compact face template buffer type. For match-on-card enrolment applications, this buffer type is mandatory.
	 */
	id3FaceTemplateBufferType_Card = 1,
} id3FaceTemplateBufferType;

#ifdef __cplusplus
}
#endif

#endif
