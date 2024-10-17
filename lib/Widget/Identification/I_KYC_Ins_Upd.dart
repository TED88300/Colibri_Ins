import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/Ins_Entreprenant.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYC_Ins_0.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_Liste_ActivitesIns.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

class I_KYC_Ins_Upd extends StatefulWidget {
  Function I_Liste_EntreprenantsState_callback;
  I_KYC_Ins_Upd(this.I_Liste_EntreprenantsState_callback);

  @override
  I_KYC_Ins_UpdState createState() => I_KYC_Ins_UpdState();
}

class I_KYC_Ins_UpdState extends State<I_KYC_Ins_Upd> {
  String wError = "";
  String? wScan = "";
  String _message = "";

  List<Entreprenant>? lfEntreprenant;

  void Reload() async {}

  void initLib() async {
    Reload();
  }

  void initState() {
    super.initState();
    initLib();
  }

  @override
  Widget build(BuildContext context) {
    DbTools.isUpdate = false;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          gColors.LinearGradient1,
          gColors.LinearGradient2,
        ],
      )),
      child: Scaffold(
          appBar: AppBar(
            title: CommonAppBar.TitleEcr("KYC", "Edition", 0, 0, "CU"),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
              height: 500,
              child: Column(
                children: [
                  EntreprenantWidget(),
                  Container(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: (DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR! == "")
                        ? Image.asset(
                            'assets/images/CNI_ICV.png',
                            fit: BoxFit.cover,
                          )
                        : Image.memory(
                            base64Decode(DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () async {


                        DbTools.pagesEntr = DbTools.gID3_OK ? 3 : 2;
                        DbTools.pageEntr = 1;
                        PushPop.PushPop_Push(false);
                        DbTools.isUpdate = true;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_0(widget.I_Liste_EntreprenantsState_callback)));

                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      backgroundColor: gColors.primary,
                      elevation: 4,
                    ),
                    child: Text(
                      "Visualiser",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          PushPop.PushPop_Push(false);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => I_Liste_ActivitesIns(), settings: RouteSettings(name: 'I_Liste_ActivitesIns')));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          "Activités",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                  ),
                ],
              ))),
    );
  }

  Widget EntreprenantWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        AutoSizeText(
          "Entreprenant : ${DbTools.gEntreprenant.nomPrenomDirigeant!.toUpperCase()}",
          maxLines: 1,
          style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        AutoSizeText(
          "CNI : ${DbTools.gEntreprenant.cni}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        AutoSizeText(
          "${DbTools.gEntreprenant.telephoneDirigeant} (${DbTools.gEntreprenant.id})",
          style: TextStyle(color: gColors.secondary, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        Container(height: 10),
        Container(height: 1, color: Colors.black)
      ]),
    );
  }
}
