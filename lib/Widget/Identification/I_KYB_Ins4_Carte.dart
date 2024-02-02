import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins5_Name.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class I_KYB_Ins4_Carte extends StatefulWidget {
  @override
  I_KYB_Ins4_CarteState createState() => I_KYB_Ins4_CarteState();
}



class I_KYB_Ins4_CarteState extends State<I_KYB_Ins4_Carte> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late FocusNode CarteFocusNode;
  TextEditingController Edt_Carte = new TextEditingController();

  String wError = "";
  String qRcodeText = "";
  String result = "";

  bool circularProgressIndicator = false;



  int pageEntr = 0;

  void initLib() async {
  }

  void initState() {
    pageEntr = DbTools.pageEntr;
    super.initState();
    CarteFocusNode = FocusNode();

    Edt_Carte.text = "${DbTools.gActivite_ins.barcode}";
    qRcodeText = "${DbTools.gActivite_ins.barcode}";
    result = "${DbTools.gActivite_ins.barcode}";

    initLib();
  }

  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }


  @override
  Widget build(BuildContext context) {

    wError = "";
    if (Edt_Carte.text.isEmpty) {
          wError = "N° de Carte vide";
    }



    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "CARTE", pageEntr, DbTools.pagesEntr, "B4.2"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print("leading");
                  DbTools.pageEntr--;
                  PushPop.PushPop_Pop(context);

                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
            body: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child :
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [

              Spacer(),
              gColors.colTextField(Edt_Carte, 'N° CARTE* :', CarteFocusNode, wError, Mand : true),


              Container(height: 20,),
              FloatingActionButton.extended(
                onPressed: _scanQR,
                label: Text("Scan"),
                icon: Icon(Icons.camera_alt),
              ),
              Spacer(),


            ]),

            ),


            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {


                      if (Edt_Carte.text.isEmpty) {
                        setState(() {});
                        return;
                      }

                      DbTools.gActivite_ins.barcode = Edt_Carte.text;
                      DbTools.pageEntr++;
                      PushPop.PushPop_Push(false);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins5_Name()));
                    });
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
          ),
        ));
  }


  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();

      print("qrResult ${qrResult.rawContent}");
      print("qrResult ??? ${qrResult.rawContent.contains("https://www.pde.ci/")}");
//      print("qrResult i ${int.parse(qrResult.rawContent)}");

      if (!qrResult.rawContent.contains("https://www.pde.ci/")) return;



      String qrResultNum =
      qrResult.rawContent.replaceAll("https://www.pde.ci/", "");

      setState(() {
        result = qrResultNum;
        Edt_Carte.text = result;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission denied";
        });
      } else {
        setState(() {
          result = "PlatformException Unkown error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (e) {
      setState(() {
        result = "Unkown error $e";
      });
    }
    print("result $result");
  }


}
