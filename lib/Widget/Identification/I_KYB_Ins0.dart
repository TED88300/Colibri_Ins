import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/DbToolsV3.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins1.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins2_photo.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins3_Gps.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

class I_KYB_Ins0 extends StatefulWidget {
  I_KYB_Ins0();
  @override
  I_KYB_Ins0State createState() => I_KYB_Ins0State();
}

class I_KYB_Ins0State extends State<I_KYB_Ins0> {
  int pageEntr = 0;

  void initState() {
    pageEntr = DbTools.pageEntr;

    super.initState();

    setState(() {});
  }

  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>   Build KYB 0  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    print("Build KYB   ${DbTools.pageEntr}" );

    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "ILOT", pageEntr, DbTools.pagesEntr, "B0"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("leading");
              DbTools.pageEntr--;
              Navigator.popUntil(context, ModalRoute.withName("I_Liste_ActivitesIns"));
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("Cluster ${DbToolsV3.Ilots[0].clusterName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Région ${DbToolsV3.Ilots[0].regionName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Département ${DbToolsV3.Ilots[0].departementName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Sous-Préfecture ${DbToolsV3.Ilots[0].sousPrefectureName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  height: 20,
                ),
                Text("Commune ${DbToolsV3.Ilots[0].communeName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Localité ${DbToolsV3.Ilots[0].localiteName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  height: 20,
                ),
                Text("ZD ${DbToolsV3.Ilots[0].zoneRecensementName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Quartier ${DbToolsV3.Ilots[0].quartierName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  height: 20,
                ),
                Text("Ilot ${DbToolsV3.Ilots[0].ilotName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  height: 20,
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Commentaire Backoffice",

                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        )),
                    Text("${DbTools.gActivite_ins.comment}",
                        maxLines: 15,
                        style: TextStyle(
                          fontSize: 17,
                        )),

                  ],),

              ],),


              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
            child: ElevatedButton(
              onPressed: () async {
                DbTools.pageEntr++;
                PushPop.PushPop_Push(true);
                Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins3_Gps()));

//                Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins1()));

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
}
