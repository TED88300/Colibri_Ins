import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:Colibri_Collecte/Tools/DbOdoo.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Tools/id3/capture_process.dart';
import 'package:Colibri_Collecte/Widget/3_bottom_navigation_list.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_Liste_ActivitesIns.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:id3_face/id3_face.dart' as sdk;

import '../../Tools/id3/bounds_painter.dart';

class I_KYC_Ins_3 extends StatefulWidget {
  Function I_Liste_EntreprenantsState_callback;
  I_KYC_Ins_3(this.I_Liste_EntreprenantsState_callback);

  @override
  I_KYC_Ins_3State createState() => I_KYC_Ins_3State();
}

class I_KYC_Ins_3State extends State<I_KYC_Ins_3> {
  CameraController? controller;
  EnrollResult? enrollResult = null;
  CaptureProcessResult? lastResult;
  MatchResult? matchResult;
  CaptureProcess? process;
  bool processingImage = false;
  bool circularProgressIndicator = false;
  bool MatchOK = false;
  int pageEntr = 0;


  @override
  void initState() {
    pageEntr = DbTools.pageEntr;

    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ DbTools.gEntreprenant fonctionRepondant ${DbTools.gEntreprenant.fonctionRepondant}");
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ DbTools.gEntreprenant qualiteDirigeant ${DbTools.gEntreprenant.qualiteDirigeant}");


    super.initState();
    // we check available cameras and create controller with the front camera
    availableCameras().then((cameras) {
      controller = CameraController(
        cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back),
        ResolutionPreset.max,
        enableAudio: false,
      );
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        process = CaptureProcess(controller!.description.sensorOrientation);
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();

  }

  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {



    print("build MatchOK ${MatchOK}");


    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYC", "PROOF OF LIFE", pageEntr, DbTools.pagesEntr, "C3"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("leading");
              DbTools.pageEntr--;
              PushPop.PushPop_PopBack(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child:  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 10,
              ),
              Text(
                "${DbTools.gEntreprenant.nomPrenomDirigeant}\n${DbTools.gEntreprenant.cni}",
                textAlign: TextAlign.center,
                style: TextStyle(color: gColors.secondary, fontSize: 16),
              ),
              Container(
                height: 10,
              ),

              ////////////////////

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MatchOK ?
                      Image.memory(enrollResult!.croppedBytes, width : 100)
                  :
                  SizedBox(
                    height: 256,
                    child: (controller == null || !controller!.value.isInitialized)
                        ? Container()
                        : CustomPaint(
                            foregroundPainter: BoundsPainter(
                              bounds: lastResult?.faceBounds ?? Rect.zero,
                              imageWidth: lastResult?.imageWidth ?? 0,
                              imageHeight: lastResult?.imageHeight ?? 0,
                            ),
                            child: CameraPreview(controller!)),
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          MatchOK = false;

                          await process?.isReady;
                          if (controller?.value.isStreamingImages ?? false) {
                            await controller?.stopImageStream();
                            lastResult = null;
                          } else {
                            controller?.startImageStream((cameraImage) async {
                              if (!processingImage) {
                                processingImage = true;

                                process?.processCameraImage(cameraImage).then((result) {
                                  setState(() {
                                    lastResult = result;
                                    processingImage = false;
                                  });
                                });
                              }
                            });
                          }
                        },
                        child: Text((controller?.value.isStreamingImages ?? false) ? 'STOP CAPTURE' : 'START CAPTURE'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          MatchOK = false;
                          enrollResult = null;
                          matchResult = null;

                          if (lastResult != null) {
                            final result = onEnroll(lastResult!);
                            setState(() {
                              enrollResult = result;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: (controller?.value.isStreamingImages ?? false) ? gColors.primary : Colors.grey,
                          elevation: 4,
                        ),
                        child: const Text('ENROLL'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (lastResult != null && enrollResult != null) {
                            final result = onMatch(lastResult!, enrollResult!);

                            setState(() {
                              MatchOK = false;
                              matchResult = result;
                              if (matchResult != null) MatchOK = matchResult!.score > sdk.FaceMatcherThreshold.fmr10000.value;
                              print("ONMATCH MatchOK ${MatchOK}");
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: (lastResult != null && enrollResult != null) ? gColors.primary : Colors.grey,
                          elevation: 4,
                        ),
                        child: const Text('MATCH'),
                      ),
                    ],
                  ),
                  if (enrollResult != null)
                    Text(
                      "Quality: ${enrollResult?.quality}",
                      style: TextStyle(color: gColors.primary, fontSize: 16),
                    ),
                  if (matchResult != null)
                    Text(
                      "Score: ${matchResult?.score} / ${sdk.FaceMatcherThreshold.fmr10000.value}",
                      style: TextStyle(color: gColors.primary, fontSize: 16),
                    ),
                  Container(
                    height: 30,
                  ),

                  Container(
                    height: 10,
                  ),
                ],
              ),
            ]),

        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
            child: ElevatedButton(
              onPressed: () async {
                if (MatchOK) {
                  setState(() {
                    circularProgressIndicator = true;
                  });

                  if (controller?.value.isStreamingImages ?? false) {
                    await controller?.stopImageStream();
                    lastResult = null;
                  }

                  DbTools.gEntreprenant.ID3_templateBytes64 = "";
                  DbTools.gEntreprenant.ID3_croppedBytes64 = "";
                  if (enrollResult != null)
                        {
                        DbTools.gEntreprenant.ID3_templateBytes64 = base64Encode(enrollResult!.templateBytes);
                        DbTools.gEntreprenant.ID3_croppedBytes64 = base64Encode(enrollResult!.croppedBytes);
                        }

                  print(" DbTools.gEntreprenant.milieuImplantation! ${DbTools.gEntreprenant.milieuImplantation!}");


                  int wRes = await DbOdoo.EntreprenantAddUpd();
                  print("Validation wRes $wRes");
                  if (wRes == -1) {
                    String wError = "Erreur d'enregistrement sur le serveur";
                    circularProgressIndicator = false;
                    setState(() {});
                  } else {
                    print("Validation OK");
                    await widget.I_Liste_EntreprenantsState_callback();
                    PushPop.PushPop_Pop(context);
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_Liste_ActivitesIns()));
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                backgroundColor: MatchOK ? gColors.primary : Colors.grey,
                elevation: 4,
              ),
              child: !circularProgressIndicator
                  ? Text(
                      "Enregistrer",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
            ),
          ),
        ),
      ),
    ));
  }
}

class EnrollResult {
  EnrollResult(this.croppedBytes, this.templateBytes, this.quality);

  final Uint8List croppedBytes;
  final int quality;
  final Uint8List templateBytes;
}

/// to enroll we need to extract template from face
/// for that we get the result from CaptureProcess and recreate native objects
/// we need a FaceEncoder, an image with associate DetectedFaced
EnrollResult onEnroll(CaptureProcessResult result) {
  final faceEncoder = sdk.FaceEncoder();
  faceEncoder.setModel(sdk.FaceModel.faceEncoder9B);

  final image = sdk.Image.fromBuffer(result.imageBytes, sdk.PixelFormat.bgr24Bits);

  final detectedFace = sdk.DetectedFace.fromBuffer(result.detectedFaceBytes);
  // get a cropped image of face with ICAO settings
  final croppingBounds = detectedFace.getPortraitBounds(0.25, 0.45, 1.33);
  final cropped = image.extractRoi(croppingBounds);
  cropped.flip(true, false);

  final jpg = cropped.toBuffer(sdk.ImageFormat.jpeg, 75);

  final template = faceEncoder.createTemplate(image, detectedFace); // TEMPLATE
  final quality = faceEncoder.computeQuality(image, detectedFace); // QUAL.

  return EnrollResult(
    jpg,
    template.toBuffer(sdk.FaceTemplateBufferType.normal),
    quality,
  );
}

class MatchResult {
  MatchResult(this.quality, this.score);

  final int quality;
  final int score;
}

MatchResult onMatch(CaptureProcessResult captureResult, EnrollResult enrollResult) {
  final faceEncoder = sdk.FaceEncoder();
  faceEncoder.setModel(sdk.FaceModel.faceEncoder9B);

  final image = sdk.Image.fromBuffer(captureResult.imageBytes, sdk.PixelFormat.bgr24Bits);

  final detectedFace = sdk.DetectedFace.fromBuffer(captureResult.detectedFaceBytes);

  final quality = faceEncoder.computeQuality(image, detectedFace);

  final template = faceEncoder.createTemplate(image, detectedFace);

  final faceMatcher = sdk.FaceMatcher();
  final refTemplate = sdk.FaceTemplate.fromBuffer(enrollResult.templateBytes);
  final score = faceMatcher.compareTemplates(refTemplate, template);

  return MatchResult(quality, score);
}
