import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins7F.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYB_Ins6F extends StatefulWidget {
  @override
  I_KYB_Ins6FState createState() => I_KYB_Ins6FState();
}

class I_KYB_Ins6FState extends State<I_KYB_Ins6F> {
  Item Q_C15 = Item();
  Screen Screen_Q_C15 = Screen();
  Item Q_C15A = Item();
  Screen Screen_Q_C15A = Screen();
  Item Q_C15C = Item();
  Screen Screen_Q_C15C = Screen();

  Item Q_C15D = Item();
  Screen Screen_Q_C15D = Screen();



  int pageEntr = 0;

  void screenVoidCallback() {
    print("screenVoidCallback");
    setState(() {});
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    Q_C15 = Tools.Get_UNIQUE("Q_C15");
    Q_C15A = Tools.Get_UNIQUE("Q_C15A");
    Q_C15C = Tools.Get_UNIQUE("Q_C15C");
    Q_C15D = Tools.Get_UNIQUE("Q_C15D");

    Screen_Q_C15 = Tools.Get_ScreenCallBack(Q_C15, context, DbTools.gActivite_ins.hasActivicteSecondaire!, 0, false, screenVoidCallback);
    Screen_Q_C15C = Tools.Get_ScreenCallBack(Q_C15C, context, DbTools.gActivite_ins.autre_activite_secondaire!, 0, false, screenVoidCallback);

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
    Screen_Q_C15A = Tools.Get_Screen(Q_C15A, context, DbTools.gActivite_ins.nameActiviteSecondaire!, 0, false);
    Screen_Q_C15D = Tools.Get_Screen(Q_C15D, context, DbTools.gActivite_ins.autreActivitePrecision!, 0, false);


    print(">>>>>>>>>>>>>>>>>>>   Build   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  ${Screen_Q_C15C.Screen_Rep_Int}");
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "ACT SEC", pageEntr, DbTools.pagesEntr, "B6F"),
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Screen_Q_C15.Screen_Row,
                  Screen_Q_C15.Screen_Rep_Int != 1 ? Container() : Screen_Q_C15A.Screen_Row,
                  Screen_Q_C15.Screen_Rep_Int != 1 ? Container() : Screen_Q_C15C.Screen_Row,
                  Screen_Q_C15C.Screen_Rep_Int != 1 ? Container() : Screen_Q_C15D.Screen_Row,
                ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
            child: ElevatedButton(
              onPressed: () async {
                print("Validation OK");
                  DbTools.gActivite_ins.hasActivicteSecondaire = Screen_Q_C15.Screen_Rep_Str;
                  DbTools.gActivite_ins.nameActiviteSecondaire = Screen_Q_C15A.Screen_Rep_Str;
                  DbTools.gActivite_ins.autreActivte = Screen_Q_C15C.Screen_Rep_Str;
                  DbTools.gActivite_ins.autreActivitePrecision = Screen_Q_C15D.Screen_Rep_Str;






                  DbTools.pageEntr++;
                  PushPop.PushPop_Push(false);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins7F()));
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
