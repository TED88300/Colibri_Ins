
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/DbToolsV3.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Widget/3_bottom_navigation_list.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYC_Ins_1.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYC_Ins_0 extends StatefulWidget {
  Function I_Liste_EntreprenantsState_callback;
  I_KYC_Ins_0(this.I_Liste_EntreprenantsState_callback);
  @override
  I_KYC_Ins_0State createState() => I_KYC_Ins_0State();
}

class I_KYC_Ins_0State extends State<I_KYC_Ins_0> {
  Item QF_B5 = Item();
  Screen Screen_QF_B5 = Screen();
  int pageEntr = 0;

  void initState() {
    QF_B5 = Tools.Get_FORMEL("QF_B5");
    pageEntr = DbTools.pageEntr;

    super.initState();

    if (DbTools.gEntreprenant.milieuImplantation == "0") DbTools.gEntreprenant.milieuImplantation = "1";
    print("DbTools.gEntreprenant.milieuImplantation! ${DbTools.gEntreprenant.milieuImplantation!}");
//    Screen_QF_B5 = Tools.Get_Screen(QF_B5, context, DbTools.gEntreprenant.milieuImplantation!, 0, false);
    Screen_QF_B5 = Tools.Get_Screen(QF_B5, context, DbTools.gEntreprenant.milieuImplantation!, 0, false);

    setState(() {});

  }





  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>   Build KYC 0 ${DbTools.pageEntr} $pageEntr  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYC", "ILOT", pageEntr, DbTools.pagesEntr, "C0"),
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
                Screen_QF_B5.Screen_Row,

                Container(
                  height: 20,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Commentaire Backoffice",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      )),
                    Text("${DbTools.gEntreprenant.commentaire_backoffice}",
                        maxLines: 15,
                        style: TextStyle(
                            fontSize: 17,
                        )),

                ],)
              ],)



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
                DbTools.gEntreprenant.milieuImplantation = (Screen_QF_B5.Screen_Rep_Int ).toString();
                print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ DbTools.gEntreprenant milieuImplantation ${DbTools.gEntreprenant.milieuImplantation}");

                DbTools.pageEntr++;
                PushPop.PushPop_Push(false);
                Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_1(widget.I_Liste_EntreprenantsState_callback)));
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
    );
  }
}
