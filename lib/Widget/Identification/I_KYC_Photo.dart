import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
import 'package:colibri/Widget/Identification/I_KYC_Ins_2.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

class I_KYC_Photo extends StatefulWidget {
  Function I_Liste_ContribuablesState_callback;
  I_KYC_Photo(this.I_Liste_ContribuablesState_callback);

  @override
  I_KYC_PhotoState createState() => I_KYC_PhotoState();
}

class I_KYC_PhotoState extends State<I_KYC_Photo> {
  bool circularProgressIndicator = false;



  late List<CameraDescription> cameras;
  late CameraDescription camera;
  late CameraController camerasController;
  Future<void>? _initializeControllerFuture;

  XFile? image = null;
  String ImgPath = "";
  int pageEntr = 0;

  void initLib() async {



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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: (image == null) ? Colors.black : Colors.white,
      child: Scaffold(
          appBar: AppBar(
            title: CommonAppBar.TitleEcr("KYC", "Photo", DbTools.pageEntr, DbTools.pagesEntr, "CP"),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: Padding(
                  padding: (image == null)
                      ? EdgeInsets.all(10)
                      : EdgeInsets.only(top: 20),
                  child: (image == null)
                      ? CameraPreview(camerasController)
                      : Image.file(File(image!.path)),
                ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),

          floatingActionButton:
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                !DbTools.isUpdate ? Container() :
                FloatingActionButton.extended(
                  onPressed: () async {
                    DbTools.pageEntr++;
                    PushPop.PushPop_Push(false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => I_KYC_Ins_2(widget.I_Liste_ContribuablesState_callback)));
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
                        DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR = base64Encode(photoAsBytes);
                        print("I_KYC_Photo ${DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!.toString().length}");
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
                    DbTools.pageEntr++;
                    PushPop.PushPop_Push(false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => I_KYC_Ins_2( widget.I_Liste_ContribuablesState_callback)));
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

  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AutoSizeText(
              "Entreprenant : ${DbTools.gEntreprenant.name!.toUpperCase()}",
              maxLines: 1,
              style: TextStyle(
                  color: gColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            AutoSizeText(
              "Activité : ${DbTools.gEntreprenant.name}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            AutoSizeText(
              "${DbTools.gEntreprenant.telephoneDirigeant} / ${DbTools.gEntreprenant.telephone_dirigeant_whatsapp}",
              style: TextStyle(
                  color: gColors.secondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
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
