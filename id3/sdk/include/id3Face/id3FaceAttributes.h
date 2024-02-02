//--------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//--------------------------------------------------------------------------------------------------
#ifndef _id3FaceAttributes_h
#define _id3FaceAttributes_h

#include <id3Face/id3FaceExports.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * Structure that defines a FaceAttributes object of the Face module.
 */
typedef struct id3FaceAttributes {
	/**
	 * Value indicating whether the person is wearing glasses or not. 100 means that the person is definitely wearing glasses. The minimum recommended threshold is 10.
	 */
    int Glasses;
	/**
	 * Value indicating whether the person is wearing a hat or not. 100 means that the person is definitely wearing a hat. The minimum recommended threshold is 10.
	 */
    int Hat;
	/**
	 * Value indicating whether the person is wearing make-up or not. 100 means that the person is definitely wearing make-up. The minimum recommended threshold is 50.
	 */
    int MakeUp;
	/**
	 * Value indicating whether the person is a male or a female. A value close to 0 means that the person is estimated to be female. A value close to 100 means that the person is estimated to be male. The recommended threshold is 50.
	 */
    int Male;
	/**
	 * Value indicating whether the person's mouth is open or not. 100 means that the person's mouth is definitely open. The minimum recommended threshold is 35.
	 */
    int MouthOpen;
	/**
	 * Value indicating whether the person is smiling or not. 100 means that the person is definitely smiling. The minimum recommended threshold is 75.
	 */
    int Smile;
} id3FaceAttributes;

#ifdef __cplusplus
}
#endif

#endif
