# id3 Face SDK Changelog
## Version 9.0.4 (2022-03-14)
- Fixed issue when using several objects of the same kind in parallel
- Fixed potential crash in eye gaze estimation

## Version 9.0.3 (2022-03-02)
- Fixed periocular encoder inference
- Fixed issue on dart wrapper when running on iOS devices

## Version 9.0.2 (2022-02-28)
- Fixed search candidate list order
- Fixed face encoding quality estimator (replaced 2A with 3A)

## Version 9.0.1 (2022-02-17)
- Fixed potential crash when calling some objects from different threads

## Version 9.0.0 (2022-02-09)
- Major changes in API:
  - Moved encoding quality estimator to face encoder module
  - Modified parameter getters/setters for each module
  - Added face template buffer type
  - Added face eye gaze structure
  - Added face background uniformity structure
  - Removed segmenter API
  - Merged all libraries in single binary for all targets
- Added face detector 3A and 3B
  - Major improvement in detection accuracy
- Added face encoder 9A and 9B
  - Major improvement in recognition accuracy
- Added dart wrapper
- Added swift wrapper
- Updated image library:
  - Minor API changes
- Updated inference library:
  - Increased inference speed on all target platforms
  - Added TensorRT support
  - Cuda Toolkit (Linux and Windows) dependencies updated to:
    - Cuda 11.5
    - Cudnn 8.3.1
- Updated license library:
 - Optimized activation methods
 - Standardized API
 - Add all wrappers

## Version 8.9.5 (2021-08-06)
- Modified license check APIs for android: does not need activity pointer anymore
- Secured calls to detected face functions
- Fixed potential memory leaks when calling face template from buffer several times in a row

## Version 8.9.4 (2021-07-28)
- Added expression sensibility parameter to FaceAnalyser
- Corrected issue in template BIT export

## Version 8.9.3 (2021-06-15)
- Fixed face depth PAD in API

## Version 8.9.2 (2021-06-02)
- Updated id3Image dependency to 1.7.1:
  - Added BGRA 32 bits pixel format support

## Version 8.9.1 (2021-05-04)
- Fixed issue on ComputeEyesAttributes Java API

## Version 8.9.0 (2021-04-02)
- Added iOS and MacOS support (Preview version) :
  - Distributed as a combined universal XCFramework with C API (can be directly called from ObjectiveC code)
  - iOS :
    - Architectures armv7, armv7s and arm64 + simulator
  - MacOS
    - Architectures x86_64 and arm64
- API changes:
  - Added BIT and BDT template export api
- Misc :
  - Modified _ToBuffer() APIs return codes:
    - now returns "Insufficent Buffer" error instead of "Success" when provided too small export buffers

## Version 8.8.0 (2021-03-04)
- New models:
  - Added RGB-based face PAD algorithm version 1A
  - Added RGB-based face PAD blurriness detection algorithm version 1A
  - Added RGB-based face PAD Moiré detection algorithm version 1A
  - Added RGB-based face attack support detection algorithm version 1A
  - Added face segmenter algorithm version 1A
- API changes:
  - Added uniformity background algorithm in FaceAnalyser
- Misc:
  - Fixed sharpness function
  - Updated id3 Inference dependency to 2.5.3:
    - Protected parallel calls for inference on GPU
  - Updated id3 Image dependency to 1.7.0:
    - Added ImageBuffer API
    - Fixed correctGamma API

## Version 8.7.4 (2021-03-03)
- Correct android samples issues

## Version 8.7.3 (2021-02-16)
- Updated id3 Inference dependency to 2.5.2:
  - Corrected potential issue when performing face tracking in a loop

## Version 8.7.2 (2021-02-09)
- Updated id3 License dependency to 7.2.0:
  - Changed hardware ID on Jetson Nano
    - New method of computation, requires to regenerate licence files
    - Jetson Nano hardware IDs now end with "09"

## Version 8.7.1 (2021-02-04)
- API changes:
  - Added FaceLicense_Reactivate APIs in C, C# and Java

## Version 8.7.0 (2021-01-29)
- API changes:
  - Added FaceTemplateDict object API
  - Added API to create a DetectedFace object from values
  - Added API to get portrait landmarks from a DetectedFace object
  - Added parameters to the API to get portrait bounds from a DetectedFace object
  - Replaced FaceTemplateList by FaceTemplateDict in the FaceMatcher search API
- Misc:
  - Updated id3 Image dependency to 1.4.0:
    - Added error codes
    - Fixed C# fromBuffer API
  - Updated id3 License dependency to 7.1.0:
    - Modified id3License_GetLicenseType() behaviour
    - Added id3LicenseType enum
  - Return nullptr handles when initializations fail

## Version 8.6.3 (2021-01-15)
- Fixed license activation in C# when using console inputs

## Version 8.6.2 (2021-01-14)
- Fixed license activation in C#

## Version 8.6.1 (2021-01-07)
- Fixed id3 Inference dependency to 2.4.3:
  - Fixed GPU support for some platforms
- Fixed photographic attributes crash

## Version 8.6.0 (2020-12-11)
- New models:
  - Added age estimation algorithm 1A
  - Added face depth-based presentation attack detection (PAD) algorithm version 2A
    - Increases the accuracy of the face liveness detection for depth images
  - Added face expression classifier algorithm version 1A
    - Allows to detect if a person has a neutral expression or not for an ID photograph
  - Added face occlusion detection algorithm 1A
    - Allows to detect if the eyes are hidden behind tinted glasses, or if the mouth and nose are covered by a mask
- Bug fixes:
  - Fixed eye attributes classification algorithm
    - The outputs of the algorithm have changed, be careful when updating to adapt the thresholds to the new documentation
  - Fixed photographic attributes potential crash
  - Fixed issue with FingerTemplate_ToBufferCC() with encoder 8A
  - Updated id3 Inference dependency to 2.4.2
    - Corrected potential crashes introduced in 8.5.0 for some models
- Deprecated models:
    - Depreciated face depth-base PAD algorithm version 1A

## Version 8.5.0 (2020-11-25)
- Supported targets:
  - Updated id3 Inference dependency to 2.4.1
    - Added Windows, Linux and Jetson Nano GPU CUDA support for models FaceEncoder8A and FacePeriocularEncoder1A
- Bug fixes:
  - Fixed empty search list to return success instead of invalid template format
  - Fixed detected face list copy function
- Misc:
  - Updated id3 Image dependency to 1.3.1
    - Allowed buffers to be too large for toBuffer methods
  - Updated id3 License dependency to 7.0.3
    - Activation CLI tool now handles inputs by environment variables

## Version 8.4.1 (2020-10-19)
- Updated id3 Inference dependency to 2.2.2
  - Corrected inference time regression on windows
- Updated id3 Image dependency to 1.2.3
- Fixed rescale API for DetectedFaceList

## Version 8.4.0 (2020-10-09)
- New models:
  - Added periocular algorithm version 1A
    - It is recommended to use this encoder when users wear chirugical masks
  - Added face quality estimation algorithm version 2A
    - The face quality score is now better correlated with the matching performances
  - Added face attribute estimation algorithm 2A
    - Lighter model and more precise attributes
- Misc:
  - Modified API for the ComputeAttributes function in the FaceAnalyser module
- Bug fixes:
  - Corrected error handling issues in template I/O functions
  - Removed noise in console outputs when using the SDK
- Deprecated models:
  - Depreciated face quality estimation algorithm version 1A
  - Depreciated face attribute estimation algorithm 1A

## Version 8.3.2 (2020-09-23)
- Fixed id3 Image dependency to 1.2.1

## Version 8.3.1 (2020-09-21)
- Added rescaling API for a detected face
- Fixed detector bug:
  - there is no internal resizing anymore
  - min and max head sizes are deprecated
  - it is up to the app developer to handle a resizing if necessary for real-time speed (see samples)
- Updated id3 Image dependency to 1.2.1

## Version 8.3.0 (2020-09-16)
- Added Raspberry Pi 4 support (Raspberry Pi OS armv7l)
- New models :
  - Added face encoder 8B for 1-to-1 embedded applications
    - Encoder8B is released under specific licensing and can only be used with the associated license package
  - Updated face landmarks estimation model to FaceLandmarksEstimator_2A (lighter and more precise)
  - Updated head pose estimation model FacePoseEstimator_1A (lighter, more precise and now only requires detection results)
- New APIs :
  - Added API to retrieve Compact Card templates
  - Added APIs to retrieve id3 license files from id3 server (C / C# / Java)
- Misc
  - Added dependency to id3 Image Library 1.1.0
  - Updated license dependency to id3 License 7.0.1
    - Support for "online" type licenses
    - New linux and jetson nano hardware codes - will require to re-generate licenses on these platforms
    - Added CLI activation tool on all platforms
      - Retrieve license file using id3 credentials, activation key or serial key
      - Print local hardware code
      - Display a license file information
    - CheckLicense() functions now require a path/buffer to a license file
  - Reduced binaries size for all libraries
- Bug fixes :
  - Corrected issue when using Face Detector in a multithread context
  - Corrected issues in C# samples post build events

## Version 8.2.1 (2020-08-24)
- Fixed android delivery

## Version 8.2.0 (2020-08-03)
- Updated Jetson Nano build to Nvidia Jetpack 4.4
- Added C# capture sample
- Bug fixes :
  - Corrected issue in detector module multithread behaviour
  - Corrected private visibility for EyesAttributes java fields
  - Corrected noise in android logcat when using detector or encoder_v8a

## Version 8.1.2 (2020-07-24)
- Bug fix :
  - Corrected issue in android template extraction for models 7s/7a on android

## Version 8.1.1 (2020-07-17)
- Bug fixes :
  - Fixed issue in id3Inference.so linux x64 dependencies
  - Fixed regression in computation times on android arm64-v8a for some models
    - face_encoder_v7a/s
    - face_quality_estimator_v1a

## Version 8.1.0 (2020-07-16)
- Added Windows x86 library
- New APIs :
  - Load model from a buffer
  - Rotate and Translate point
  - DetectedFace copy
- Updated samples :
  - Added C# sample to create a compressed thumbnail of a face image
  - Added android capture sample
- Bug fixes :
  - Fixed issue in image copy function
  - Fixed issue in android samples delivery

## Version 8.0.0 (2020-07-01)
- Major changes in the API. See documentation for more details.
- Improved face detection algorithm.
- Improved face recognition algorithm: added face encoder 8A.
- Improved ICAO criteria classification algorithm.
- Added face mask detection.
- Added Jetson Nano libraries.
- Removed FaceCapture API (will be released as a separate package).

## Version 7.5.10 (2020-03-01)
- Corrected android readme and sample on license activation issues
- Removed depreciated android activation app apk

## Version 7.5.9 (2020-02-11)
- Change the 'Time to live' (TTL) value for ONVIF Discover.
- Added functions to log Camera IP Discover.

## Version 7.5.8 (2020-01-24)
- ANDROID: Change FaceImage_nSetPixelsFromAndroidPlane() and Java FaceImage.setPixelsFromAndroidPlane() API to add support for the 3 YUV planes buffer.

## Version 7.5.7 (2019-10-30)
- Fixed crash if model file 'ENCODER_07.BIN' is not present even if it not used.
- Added id3Image_ClonePicture() to creates a copy of a specific picture type of a FaceImage object.

## Version 7.5.6 (2019-10-22)
- Fixed bug with Logitech C270 Webcam.

## Version 7.5.5 (2019-10-03)
- Added java function FaceNative.setPath and getPath.

## Version 7.5.4 (2019-08-08)
- Fixed crash in id3FacePad module.

## Version 7.5.3 (2019-08-01)
- Changed FaceCaptureFragment.FaceCaptureListener.onFaceProcess() callback to onFaceProcessed().

## Version 7.5.2 (2019-07-31)
- Improve capture/detection process with Android.

## Version 7.5.1 (2019-07-18)
- Fixed bug: The Java event onFaceDetected doesn't work.
- Added Java function FaceTemplateDatabase.clear()

## Version 7.5.0 (2019-07-16)
- Fixed bug: The Face Processed event triggered a Face Removed event.
- Added FaceCapture.GetFirstMulticamSlotForDevice(), FaceCapture.GetAllMulticamSlotForDevice() and FaceImage.getAllFaceBounds().
- Addef FaceCaptureDevice.startPreview(), stopPreview() and capturePhoto() in Java.
- Added FaceCapture java API for FaceCameraMediaType and FaceMediaFileMode.
- Fixed FaceCapture java API bugs.

## Version 7.4.0 (2019-06-18)
- Added id3FaceEncoder_LoadModels(), id3FaceEncoder_UnloadModels() and id3FaceEncoder_SetFaceExtractionProcessingUnit().
- Remove enum FaceEncoderStatus, replace by FaceError.
- Changed API for id3FaceEncoder_Initialize(): remove 'model_path' and add 'ExtractionProcessingUnit_Cpu'.
- Changed FaceEncoder API: models must be loaded (and unloaded) by the user before (and after) using objects.
- Integrated FaceCapture on Linux.

## Version 7.3.5 (2019-06-26)
- Added FaceCapture java modules.

## Version 7.3.4 (2019-06-21)
- Fixed bug in FaceImage_nGetShapes (java in Android)
- Fixed bug in Android faces tracking

## Version 7.3.3 (2019-06-20)
- Added FaceCapture Linux and FaceCapture java modules.
- Fixed bug in FaceImage_nToBuffer() (java)

## Version 7.3.2 (2019-05-14)
- Fixed bugs.
- Fixed RotateAndCrop for ICAO compliance.

## Version 7.3.1 (2019-04-19)
- Fixed bugs.
- Suppress x64_gpu folder.

## Version 7.3.0 (2019-04-13)
- Added modules FaceTemplateRecord and FaceTemplateDatabase.
- Made FaceMatcher thread-safe.
- Updated RealSense SDK version to 2.20.0.771.

## Version 7.2.0 (2019-04-09)
- Deleted x64_GPU folder.
- Added functions to set extraction processing unit (CPU or GPU).
- Changed enum FaceExtractionProcess to FaceExtractionProcessingUnit.

## Version 7.1.1 (2019-03-20)
- Fixed crash with RealSense when depth process and rotation is enabled both.

## Version 7.1.0 (2019-03-12)
- Added GPU/CPU support with the sames entry points in id3Face.dll.
- Added getter to access quality from template.
- The number of multicam slot is no longer limited.
- FaceCapture license now controls the number of streams (webcam, files, ip camera) used in parallel.
- Added FaceRecognitionProcess.
- Added depth-based pad detection algorithm.

## Version 7.0.1 (2019-02-13)
- Fixed bug in search process. Scores were often equal
- Fixed java fromValue function on all enum
- Change return error code for id3FaceMatcher_AddReference() when the template format is not good then the error code is ID3_E_INVALID_FORMAT rather than ID3_E_INVALID_PARAMETER
- Change id3FaceTemplate_GetFormat() parameters, return an id3FaceTemplateFormat enumeration.
- Fixed bugs in id3FaceMatcher_AddReference and id3FaceTemplate_FromBuffer when the template has a wrong format

## Version 7.0.0 (2019-02-05)
- Added algo version 3.0.0 => 2 possible extraction(optim for Speed or optim for accuracy)

## Version 6.10.3 (2019-02-01)
- Fixed FaceAssembly.Initialize() when using x64_gpu subfolder in bin folder.

## Version 6.10.2 (2019-01-31)
- Fixed FaceAssembly.Initialize() when used in a multi AppDomain context.

## Version 6.10.1 (2019-01-29)
- Added Realsense autoconfiguration with the first available video format (640x480x6 fps)
- Added support for left and right infrared stream (RealSense)

## Version 6.10.0 (2019-01-28)
- Corrected bug in Intel RealSense module.
- Corrected lock of webcam at FaceCapture initalizing.
- Added support for capturing the infrared stream of the camera.
- Added infrared projector control support for the camera.
- Added support for saving a depth picture and a infrared picture.
- It is now possible to change value of the property CaptureBuffers between 8 to 64.
- Added support to use infrared stream in the detect and track process.

## Version 6.9.0 (2018-12-20)
- Added android online license activation functions.
- Corrected lacking dependency dll vcomp140.dll on windows since 6.8.0.
- Added support for Intel RealSense depth camera.
- Added API id3Image_SetRequestedPictureType and id3Image_GetRequestedPictureType.
- Added API FaceDrawing.DrawMosaik
- Added support for média player loop mode (id3FaceCameraProperty.MediaLoopMode)

## Version 6.8.1 (2018-11-22)
- Fixed detection module initialization bug with a camera.
- Fixed crash in the streaming module when setting rotation or flip.

## Version 6.8.0 (2018-11-20)
- Added multithread mode for face extraction (~ x3.5 speedup).

## Version 6.7.5 (2018-11-14)
- Corrected bug introduced in 6.7.4 in face detection on linux and android systems.

## Version 6.7.4 (2018-10-31)
- Added FaceDrawingInfo.SetMessage()
- Added FaceDrawingProcess.GetFaceDrawinginfoForUserID()
- Fixed bug in quality score computation
- Fixed bug in GetAndLockPicture(): the function now return the correct picture index
- FaceCapture:
    - Breaking API changes :
        - Deleted FaceCapture.StopPreview(), use FaceCapture.StopAllCameras() instead
        - Deleted FaceCapture.StartPreview(), use FaceCamera.StartPreview() instead
        - Deleted FaceCapture.TakePicture(), use FaceCamera.TakePicture() instead
        - Deleted property FaceCapture.SelectedCamera, use FaceCapture.SelectCamera() instead
    - Added id3FaceCapture_SetFaceProcessedEvent (c++) and FaceProcessed (C#): event called when the tracker finish it's process
- C# API:
    - Added property FaceMatcher.ReferencesCount
    - Fixed flicker with the background in FaceDrawingProcess when the control is resized
- Android API:
    - Added FaceCaptureFragment.getCameraType() function

## Version 6.7.3 (2018-10-25)
- Corrected samples
- Fixed the crash when using the GPU

## Version 6.7.2 (2018-10-24)
- Modified FaceEncoderStatus (C++,C#,JAVA) (Success or error codes)

## Version 6.7.1 (2018-10-23)
- Added 'data' and 'windows\java' folder in samples
- Corrected bug when using software gamma if rotation is 180°

## Version 6.7.0 (2018-10-19)
- Added quality assessment API (Warning: ComputeQuality becomes ComputeQualityMetrics)
- Android :
    - Corrected issue when calling setCameraType() on a non initialized FaceCaptureFragment
    - Added onFaceCaptureViewCreated() interface callback
    - Corrected horizontal swap on capture

## Version 6.6.0 (2018-10-15)
- Corrected bugs in multicam process
- Android :
    - Added support of back camera
    - Added setCameraType() function to FaceCaptureFragment to perform camera switches during capture

## Version 6.5.0 (2018-10-12)
- Optimized extract and detect on windows x64
- Renamed QUALITY.bin model file as ICAO.bin
- Fixed bug in rotateAndCrop

## Version 6.4.1 (2018-10-08)
- Corrected 100% CPU usage in stream capture module
- Corrected bug with IP Camera (password and name)
- Corrected bug with Webcam with RGB24 or I420 video format

## Version 6.4.0 (2018-10-02)
- Added Motion Detection in FaceCapture
- Fixed stream capture issues
- Fixed problems when started/stopped webcams
- Added functions in id3FaceLicense API to mimic id3License API
- Fixed bug in search on list JAVA implementation

## Version 6.3.0 (2018-09-27)
- Added API to search on list of IDs
- Corrected bug in getEyesPosition C# API

## Version 6.2.9 (2018-09-24)
- Added getAndroidHardwareID android function.
- Added id3License_ShowHardwareID.apk tool in android activation

## Version 6.2.8 (2018-09-18)
- Fixed missing files in the Toolkit package

## Version 6.2.7 (2018-08-10)
- Fixed bug when FaceID is read before the tracking thread is finished.

## Version 6.2.6 (2018-08-08)
- Corrected start/stop preview crash with IP Camera and stream.

## Version 6.2.5 (2018-08-06)
- Corrected bug in RotateAndCrop.

## Version 6.2.4 (2018-07-30)
- Added inpedendant thread for streaming capture (STREAM and IP CAM)

## Version 6.2.2 (2018-07-26)
- Changed internal storage method for template.
- Corrected bug in FaceImage.FaceCount et FaceIDList (C/C#) when a face as been detected by not yet tracking.

## Version 6.2.1 (2018-07-25)
- Corrected bug in FaceImage.RotateAndCrop

## Version 6.2.0 (2018-07-23)
- Android changes :
    - Added support for evaluation licenses
    - Added android license manager apk
    - Added android usage samples
- Java and Android implementations :
    - Corrected FaceImage.getHeadOrientation bug
    - Corrected FaceSpoof.getResult bug
- FaceImage : Suppress FaceSlot and replace it by FaceID.
    - FaceID automaticaly increment if a new face is detected.
    - All API that used faceSlot now use FaceID.
    - It is possible to change the size of the list of FaceID using property MaxNumberOfFacesSlots (FaceCamera and FaceEncoder).
- FaceDrawing new APIs :
    - FaceDrawing.DrawBitmap() to automaticaly draw all face drawing informations (use of a dictionnary is optional).
    - FaceDrawing.DrawFaceID() to draw the FaceID inside the cropping bound.
    - FaceDrawingProcess module to draw face information in a background worker. This module include the FaceID dictionnary for DrawBitmap.
- New face spoofing detection algorithm
- Corrected multi-thread issue with FacesData.

## Version 6.1.3 (2018-07-19)
- External sur id3.Licences V5.7

## Version 6.1.2 (2018-07-05)
- Corrected bug (lost face) in TakePicture.

## Version 6.1.1 (2018-07-02)
- Corrected FaceDrawing crash when the application is hidden in the task bar.

## Version 6.1.0 (2018-06-29)
- Added support for Matrix Vision cameras.
- Added event for file analysis: FaceCapture.CaptureEvent with StreamAnalysePicture type.
- Added capture support for Android.
- Corrected bug in FaceImage for BMP image with 4 channels.

## Version 6.0.4 (2018-06-28)
- Added Capture Buffer Reset (SetProperty with automatic flag)

## Version 6.0.3 (2018-06-26)
- Added FaceImage.ColorProcess() to correct brightness, contrast and gamma.
- Deleted support for the FaceCameraProperty_FrameRate property in webcam and IDS device.

## Version 6.0.2 (2018-06-26)
- Added support for YUYV and NV12 format for webcams.

## Version 6.0.1 (2018-06-22)
- Added software gamme correction for capture device (FaceCameraProperty_SoftwareGamma).
- Property 'FaceCameraProperty_Gamma' renamed 'FaceCameraProperty_HardwareGamma'
- Accelerate StretchHistogram() function.
- Removed 'ID3_E_NO_DEVICE' error in StartPreview().
- Corrected drawing bug in FaceDrawing.DrawFaceImage() if color depth of the image is not 24 bits.

## Version 6.0.0 (2018-06-15)
- Great improvement in face recognition accuracy (new templates are are not compatible with previous templates created from older SDK)
- Only one type of template available. Size is now 264 bytes.

## Version 5.4.2 (2018-05-23)
- Added support for Histogram stretching (level min and max)
- Extended support for FrameRate (all value from min to max)

## Version 5.4.1 (2018-05-18)
- Corrected FaceCapture.SelectCamera default init for callEvent (true)
- Moved ClearDetectedFace internal call from StopPreview to StartPreview

## Version 5.4.0 (2018-05-16)
- Added support for FileAnalysis
- Added property descriptor for FaceDetectionEnabled, FaceDetection_MinHeadSize, FaceDetection_ConfidenceThreshold, FaceDetection_Speed and FaceDetection_Mode.
- Added FaceCapture.CallSelectCameraEvent and FaceCapture.SelectCamera callEvent argument.

## Version 5.3.0 (2018-05-14)
- Added support for FrameRate property

## Version 5.3.0.7 BETA (2018-04-16)
- Added preload the first picture for video file
- Added flush of decoder buffer when seeking video file

## Version 5.3.0.6 BETA (2018-04-09)
- Added multi-cam support (beta)
- Use native FaceImage as captured pictures

## Version 5.3.0.5 BETA (2018-04-06)
- Corrected capture process
- Corrected drawing process
- Changed preview and capture event
- Corrected samples

## Version 5.3.0.2 BETA (2018-03-14)
- Correct bug error 155 with IDS Imaging cameras
- Correct playing file with 29.97 FPS
- Suppress API id3FaceCapture_SelectDevice()

## Version 5.3.0.0 BETA (2018-03-12)
- Correct c# sample
- Update support of event GetUserPassword for IP cameras
- [JAVA] nGetBitrate becomes nGetColorDepth

## Version 5.2.4 (2018-03-07)
- Correct crash of sample 'capture'

## Version 5.2.3 (2018-02-27)
- Correct crash in id3FaceEncoder_ComputeQuality

## Version 5.2.2 (2018-02-21)
- Correct bug in IDS TakePicture
- Correct bug in FaceImage property default value for FaceCapturePreview control

## Version 5.2.1 (2018-01-15)
- Change use of camera handle under API
- Correct bug under image format for webcam
- id3FaceCapture_SelectDevice is deprecated, use id3FaceCapture_SelectDeviceByHandle

## Version 5.2.0 (2018-01-08)
- Add plug & play support
- Add API function 'id3Image_GetDetectionScore'
- Add Linux

## Version 5.1.1 (2017-12-13)
- Canon DSLR: Force ISO Auto in preview mode
- Canon DSLR: Fix a problem with external flash triggering

## Version 5.1.0 (2017-11-14)
- Add NVIDIA GPU support
- Add tracking functions in C#
- Add Java wrapper

## Version 5.0.1 (2017-09-15)
- Improvement of multi face tracking process
- Improve tight cropped face detection

## Version 5.0.0 (2017-08-10)
- Improvement of face detection process
- New face antispoofing module

## Version 4.0.0 (2017-04-26)
- Great improvement of face extraction and matching process

## Version 3.3.3 (2017-02-23)
- Solves a face detection issue that occured in some conditions when the subject moved while taking the picture with Canon DSLR.

## Version 3.3.2 (2017-01-31)
- Manage JPEG-2000 compression ratio
- Bug fix

## Version 3.3.0 (2016-12-05)
 - Add support for Canon DLSRs
 - Add support for IDS uEye cameras

## Version 3.2.0 (2016-08-12)
 - Improvement in face quality analysis
 - New API to handle multiple face in C# and C/C++
 - Improvement in face tracking for high yaw angle

## Version 3.1.5899 (2016-02-25)
 - Improvement in facial verification and identification
 - Improvement in non frontal face detection
 - Memory leaks fixes

## Version 3.0.5794 (2015-11-24)
 - Improvement in facial recognition
 - Multi face tracking ( C# and C/C++)
 - Bug fixes

## Version 2.2.5542 (2015-03-06)
 - Some API changes
 - Adds Java API
 - Bug fixes

 ## Version 2.2.5030 (2014-09-29)
 - Integration of facial recognition.

 ## Version 1.0.5030 (2013-10-09)
 - Initial release.
