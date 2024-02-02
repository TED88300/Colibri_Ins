//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceAttackSupport_h
#define _id3FaceAttackSupport_h

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Enumeration of possible values for a FaceAttackSupport of the Face module.
 */
typedef enum id3FaceAttackSupport {
	/**
	 * No attack support.
	 */
	id3FaceAttackSupport_None = 0,
	/**
	 * ID card support.
	 */
	id3FaceAttackSupport_IdCard = 1,
	/**
	 * Screen support (includes smartphones, tablets, laptops, etc).
	 */
	id3FaceAttackSupport_Screen = 2,
} id3FaceAttackSupport;

#ifdef __cplusplus
}
#endif

#endif
