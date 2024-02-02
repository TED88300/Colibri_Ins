//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceProcessingUnit_h
#define _id3FaceProcessingUnit_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a ProcessingUnit of the Face module.
 */
typedef enum id3FaceProcessingUnit {
	/**
	 * CPU.
	 */
	id3FaceProcessingUnit_Cpu = 0,
	/**
	 * GPU.
	 */
	id3FaceProcessingUnit_Gpu = 1,
} id3FaceProcessingUnit;

#ifdef __cplusplus
}
#endif

#endif
