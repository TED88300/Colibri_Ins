import 'dart:ffi';

import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:flutter/material.dart';

class I_DashBoard extends StatefulWidget {
  @override
  I_DashBoardState createState() => I_DashBoardState();
}

class I_DashBoardState extends State<I_DashBoard> {
  String sMatricule = DbOdoo.res_UserMat;
  String sName = DbOdoo.res_UserName;
  String fCrt = DbOdoo.nombre_fiche_create.toString();
  String fBro = DbOdoo.nombre_fiche_draft.toString();
  String fVal = DbOdoo.nombre_fiche_valid.toString();
  String fRej = DbOdoo.nombre_fiche_cancel.toString();

  void initLib() async {
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
        padding: const EdgeInsets.fromLTRB(30, 30, 15, 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Matricule: ${sMatricule}", style: TextStyle(fontSize: ts, color: Colors.black)),
          Container(height: 10),
          Text("Agent: ${sName}", style: TextStyle(fontSize: ts, color: Colors.black)),
          Container(height: 20),
          Text("Fiches crées: ${fCrt}", style: TextStyle(fontSize: ts, color: Colors.black)),
          Container(height: 8),
          Text("Fiches en brouillon: ${fBro}", style: TextStyle(fontSize: ts, color: Colors.black)),
          Container(height: 8),
          Text("Fiches validées: ${fVal}", style: TextStyle(fontSize: ts, color: Colors.black)),
          Container(height: 8),
          Text("Fiches rejetées: ${fRej}", style: TextStyle(fontSize: ts, color: Colors.black)),
        ]));
  }
}
