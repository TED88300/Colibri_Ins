//----------------------------------------------------------------------------------------------------------------------
// Copyright (c) id3 Technologies
// All Rights Reserved.
//----------------------------------------------------------------------------------------------------------------------
#ifndef _id3FaceExports_h
#define _id3FaceExports_h

#ifdef __WIN32__
#ifndef _WIN32
#define _WIN32
#endif
#endif

#ifdef _WIN32
#ifdef ID3FACE_EXPORTS
#define ID3FACE_C_API extern __declspec(dllexport)
#else
#define ID3FACE_C_API extern __declspec(dllimport)
#endif
#ifndef ID3_CDECL
#define ID3_CDECL __cdecl
#endif
#ifndef ID3_STDCALL
#define ID3_STDCALL __stdcall
#endif
#else
#ifdef ID3FACE_EXPORTS
#define ID3FACE_C_API __attribute__ ((visibility("default")))
#else
#define ID3FACE_C_API
#endif
#define ID3_CDECL
#define ID3_STDCALL
#endif

#endif
