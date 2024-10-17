import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:camera/camera.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Tools/intent_result.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins3_Gps.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

class I_KYB_Ins2_photo extends StatefulWidget {
  @override
  I_KYB_Ins2_photoState createState() => I_KYB_Ins2_photoState();
}

class I_KYB_Ins2_photoState extends State<I_KYB_Ins2_photo> {
  double dLat = 48.858948913622804;
  double dLng = 2.2945242153417604;
  double? dAcc = 0;

  bool circularProgressIndicator = false;



  late List<CameraDescription> cameras;
  late CameraDescription camera;
  late CameraController camerasController;
  Future<void>? _initializeControllerFuture;

  XFile? image = null;

  void Reload() async {}
  int pageEntr = 0;

  void initLib() async {
    Reload();
    print("I_KYB_Ins4  determinePosition");
    var getLocation = await IntentChannel.getLocation();
    if (getLocation != null && getLocation.length > 0) {
      print("I_KYB_Ins4 determinePosition NOT NULL ${getLocation}");
      dLat = getLocation[1];
      dLng = getLocation[0];
      dAcc = getLocation[2];
    } else {
      print("I_KYB_Ins4 determinePosition NULL length ${getLocation!.length}");
      dLat = 48.858948913622804;
      dLng = 2.2945242153417604;
      dAcc = 0;
    }

    WidgetsFlutterBinding.ensureInitialized();
    try {
      cameras = await availableCameras();
      camera = cameras.first;
      print("camera ${camera.toString()}");
    } on CameraException catch (e) {
      print("Error ${e.code} ${e.description}");
    }

    camerasController = CameraController(
      camera, // Define the resolution to use.
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = camerasController.initialize();

    setState(() {});
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    initLib();
    super.initState();

  }

  @override
  void dispose() {
    camerasController.dispose();
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
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: (image == null) ? Colors.black : Colors.white,
      child: Scaffold(
          appBar: AppBar(
            title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}" , "PHOTO", pageEntr, DbTools.pagesEntr, "B2"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
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
                    Navigator.popUntil(context, ModalRoute.withName("I_Liste_ActivitesIns"));
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: Padding(
                  padding: (image == null) ? EdgeInsets.all(10) : EdgeInsets.only(top: 20),
                  child: (image == null) ? CameraPreview(camerasController) : Image.file(File(image!.path)),
                ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.end, children: [
            !DbTools.isUpdate
                ? Container()
                : FloatingActionButton.extended(
                    onPressed: () async {
                      DbTools.gActivite_ins.partnerLatitude = "${dLat}";
                      DbTools.gActivite_ins.partnerLongitude = "${dLng}";
                      DbTools.gActivite_ins.gpsPrecision = "${dAcc}";

                      DbTools.pageEntr++;
                      PushPop.PushPop_Push(false);

                      print("I_KYB_Ins4 Photo ${DbTools.gImageBase64_PHOTO_ACT.toString().length}");
                      var getLocation = await IntentChannel.getLocation();
                      if (getLocation != null && getLocation.length > 0) {
                        print("I_KYB_Ins4 determinePosition NOT NULL ${getLocation}");
                        dLat = getLocation[1];
                        dLng = getLocation[0];
                        dAcc = getLocation[2];
                      } else {
                        print("I_KYB_Ins4 determinePosition NULL length ${getLocation!.length}");
                        dLat = 48.858948913622804;
                        dLng = 2.2945242153417604;
                        dAcc = 0;
                      }

                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins3_Gps()));
                    },
                    label: Text("Suivant"),
                  ),
            Container(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () async {
                if (image == null) {
                  try {
                    await _initializeControllerFuture;
                    image = await camerasController.takePicture();



                    List<int> photoAsBytes = await image!.readAsBytes();
                    DbTools.gImageBase64_PHOTO_ACT = await base64Encode(photoAsBytes);

                    setState(() {
                    });



                  } catch (e) {
                    // If an error occurs, log the error to the console.
                    print(e);
                  }
                } else {
                  image = null;
                  setState(() {});
                }
              },
              child: const Icon(Icons.camera_alt),
            ),
          ]),
          bottomNavigationBar: Container(
            height: (image == null) ? 0.0 : 60.0,
            child: BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                child: ElevatedButton(
                  onPressed: () async {
                    DbTools.gActivite_ins.partnerLatitude = "${dLat}";
                    DbTools.gActivite_ins.partnerLongitude = "${dLng}";
                    DbTools.gActivite_ins.gpsPrecision = "${dAcc}";

                    DbTools.pageEntr++;
                    PushPop.PushPop_Push(false);

                    print("I_KYB_Ins4 Photo ${DbTools.gImageBase64_PHOTO_ACT.toString().length}");
                    var getLocation = await IntentChannel.getLocation();
                    if (getLocation != null && getLocation.length > 0) {
                      print("I_KYB_Ins4 determinePosition NOT NULL ${getLocation}");
                      dLat = getLocation[1];
                      dLng = getLocation[0];
                      dAcc = getLocation[2];
                    } else {
                      print("I_KYB_Ins4 determinePosition NULL length ${getLocation!.length}");
                      dLat = 48.858948913622804;
                      dLng = 2.2945242153417604;
                      dAcc = 0;
                    }

                    Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins3_Gps()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    backgroundColor: gColors.primary,
                    elevation: 4,
                  ),
                  child: Text(
                    "Suivant",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          )),
    ));
  }


  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        AutoSizeText(
          "Entreprenant : ${DbTools.gEntreprenant.name!.toUpperCase()}",
          maxLines: 1,
          style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AutoSizeText(
          "Activité : ${DbTools.gEntreprenant.name}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        AutoSizeText(
          "${DbTools.gEntreprenant.telephoneDirigeant} / ${DbTools.gEntreprenant.telephone_dirigeant_whatsapp}",
          style: TextStyle(color: gColors.secondary, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        Container(height: 10),
        Container(height: 1, color: Colors.black)
      ]),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String? imagePath;

  const DisplayPictureScreen({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath!)),
    );
  }
}
