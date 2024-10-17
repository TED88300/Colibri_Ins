
import 'package:Colibri_Collecte/Tools/DbToolsV3.dart';

import 'package:flutter/material.dart';

class I_DashBoard extends StatefulWidget {
  @override
  I_DashBoardState createState() => I_DashBoardState();
}



class I_DashBoardState extends State<I_DashBoard> {
  String sMatricule = DbToolsV3.UserMat!;
  String sName = DbToolsV3.UserName!;
  String fCrtE = "";
  String fBroE = "";
  String fValE = "";
  String fRejE = "";
  String fConfE = "";

  String fCrtA = "";
  String fBroA = "";
  String fValA = "";
  String fRejA = "";
  String fConfA = "";
  void initLib() async {
    await DbToolsV3.GetStat();

    print("DbToolsV3.gIdentifier_stats ${DbToolsV3.gIdentifier_stats.activitiesCount}");

    fCrtE = "${DbToolsV3.gIdentifier_stats.entrepreneursCount}";
    fBroE = "${DbToolsV3.gIdentifier_stats.draftEntrepreneursCount}";
    fValE = "${DbToolsV3.gIdentifier_stats.approvedEntrepreneursCount}";
    fRejE = "${DbToolsV3.gIdentifier_stats.rejectedEntrepreneursCount}";
    fConfE = "${DbToolsV3.gIdentifier_stats.confirmedEntrepreneursCount}";

    if (fCrtE == "null") fCrtE = "0";
    if (fBroE == "null") fBroE = "0";
    if (fValE == "null") fValE = "0";
    if (fRejE == "null") fRejE = "0";
    if (fConfE == "null") fConfE = "0";

    fCrtA = "${DbToolsV3.gIdentifier_stats.activitiesCount}";
    fBroA = "${DbToolsV3.gIdentifier_stats.draftActivitiesCount}";
    fValA = "${DbToolsV3.gIdentifier_stats.approvedActivitiesCount}";
    fRejA = "${DbToolsV3.gIdentifier_stats.rejectedActivitiesCount}";
    fConfA = "${DbToolsV3.gIdentifier_stats.confirmedActivitiesCount}";

    if (fCrtA == "null") fCrtA = "0";
    if (fBroA == "null") fBroA = "0";
    if (fValA == "null") fValA = "0";
    if (fRejA == "null") fRejA = "0";
    if (fConfA == "null") fConfA = "0";

    setState(() {});
  }

  void initState() {
    initLib();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ts = 22;
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 200),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [


          Container(
            width: 500,
            child: Row(
              children: [
                Container(
                  child: Text("Matricule : ", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 200,
                    child: Text("${sMatricule}",
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),

              ],
            ),
          ),
          Container(height: 8),

          Container(
            width: 500,
            child: Row(
              children: [
                Container(
                  child: Text("Agent : ", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 200,
                    child: Text("${sName}",
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),

              ],
            ),
          ),
          Container(height: 8),

          
          Container(height: 60),
       /*   Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 100,
                ),
                Container(
                    width: 190,
                    child: Text("Entreprenants",
                        textAlign : TextAlign.end,
                        style: TextStyle(

                          fontSize: ts,
                          color: Colors.black,
                        ))),
                Spacer(),
                Container(
                    width: 90,
                    child: Text("Activités",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),
*/
          Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Text("Fiches crées:", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 60,
                    child: Text("${fCrtE}",
                      textAlign : TextAlign.end,
                        style: TextStyle(

                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
                Container(
                    width: 60,
                    child: Text("${fCrtA}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),

          Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Text("Fiches en brouillon:", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 60,
                    child: Text("${fBroE}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
                Container(
                    width: 60,
                    child: Text("${fBroA}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),



          Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Text("Fiches validées:", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 60,
                    child: Text("${fValE}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
                Container(
                    width: 60,
                    child: Text("${fValA}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),


          Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Text("Fiches rejetées:", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 60,
                    child: Text("${fRejE}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
                Container(
                    width: 60,
                    child: Text("${fRejA}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),

          Container(
            width: 600,
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Text("Fiches Confirmées:", style: TextStyle(fontSize: ts, color: Colors.black)),
                ),
                Container(
                    width: 60,
                    child: Text("${fConfE}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
                Container(
                    width: 60,
                    child: Text("${fConfA}",
                        textAlign : TextAlign.end,
                        style: TextStyle(
                          fontSize: ts,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                Spacer(),
              ],
            ),
          ),
          Container(height: 8),


        ]));
  }
}
