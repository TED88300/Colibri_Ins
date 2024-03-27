import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Ins_Activite.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Send extends StatefulWidget {
  @override
  SendState createState() {
    return new SendState();
  }
}

class SendState extends State<Send> {
  final TextEditingController textController = new TextEditingController();

  bool circularProgressIndicator = false;

  String DateSend = "";

  String TextLog = "";
  List<String> TxtLogs =[];

  int isOnline = -1;

  void initLib() async {

    try {
      await DbOdoo.Login( DbTools.gUsername,  DbTools.gPassword );
      isOnline = 1;
    } catch (_) {
      isOnline = 0;
    }



    await DbTools.getEntreprenantTransf();
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfEntreprenantaTransf <<<< ${DbTools.glfEntreprenantaTransf.length}");
    await DbTools.getActivitesInsTransf();
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfActivite_insTransf <<<< ${DbTools.glfActivite_insTransf.length}");

    TxtLogs.clear();

    TextLog = "\n>>> Entreprenants à envoyer";
    TxtLogs.add(TextLog);

    for (var i = 0; i < DbTools.glfEntreprenantaTransf.length; i++) {
      var element = DbTools.glfEntreprenantaTransf[i];
      TextLog = "     - id ${element.id}/${element.Id_Tmp} :${element.name!} (${element.ENT_TRANSF_OK!}) (${element.ENT_Id_Server})";
      TxtLogs.add(TextLog);
      List<Activite_ins> lfActivite;
      lfActivite = await DbTools.getActivitesIns(element.id!, element.Id_Tmp!);
      for (var i = 0; i < lfActivite.length; i++) {
        var element2 = lfActivite[i];
        if (element2.ACT_TRANSF_OK == 0)
          {
            TextLog = "    > ${element2.id} : ${element2.Id_Tmp} : ${element2.name!} (${element2.ACT_TRANSF_OK!}) (${element2.ACT_Id_Server})";
            TxtLogs.add(TextLog);
          }
      }

    }



    TextLog =  "\n\n>>> Activités seules à envoyer >>>";
    TxtLogs.add(TextLog);
    for (var i = 0; i < DbTools.glfActivite_insTransf.length; i++) {
      var element = DbTools.glfActivite_insTransf[i];

      print("♦♦♦♦ Activités à envoyer ACTIVITE PHOTO ${element.ImageBase64_PHOTO_ACT!.length}");



      TextLog = "     - id ${element.id}/${element.Id_Tmp} :${element.name!} (${element.ACT_TRANSF_OK!}) (${element.ACT_Id_Server})";
      TxtLogs.add(TextLog);
    }

    setState(() {

    });



    }

  void initState() {


    initLib();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: gColors.red,
            title: Text("TRANSFERT OFF LINE ${TxtLogs.length}"),
          ),
          backgroundColor: Colors.transparent,
          body:
              Column(children: [
                isOnline == -1 ? Container() :
                Image.asset(isOnline == 1 ?
                'assets/images/OnLine.jpg':
                'assets/images/OffLine.jpg',
                width: 100,
                height: 100,
              ),
                Expanded(child:
                ListView.builder(
                  itemCount: TxtLogs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(TxtLogs[index] ,style : TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -3), // to compact
                    );
                  },
                ),),
              ],),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: Colors.white,
              height: 70,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                    child: isOnline != 1 ? Container() :
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          circularProgressIndicator = true;
                        });
                        TxtLogs.clear();
                        TextLog = "Traitement Entreprenants ${DbTools.glfEntreprenantaTransf.length} \n";
                        TxtLogs.add(TextLog);

                        for (var i = 0; i < DbTools.glfEntreprenantaTransf.length; i++) {
                          DbTools.gEntreprenant = DbTools.glfEntreprenantaTransf[i];
                          TextLog =  "${DbTools.gEntreprenant.name!}\n";
                          TxtLogs.add(TextLog);
                          TextLog = "> EntreprenantId  A ${DbTools.gEntreprenant.id} t ${DbTools.gEntreprenant.Id_Tmp} ${DbTools.gEntreprenant.ENT_Id_Server}\n";
                          TxtLogs.add(TextLog);

                          int wOldID = DbTools.gEntreprenant.id!;
                          print ("> EntreprenantId A ${DbTools.gEntreprenant.id} t ${DbTools.gEntreprenant.Id_Tmp} ${DbTools.gEntreprenant.ENT_Id_Server}\n");
                          await DbOdoo.EntreprenantAddUpd();
                          print ("> EntreprenantId B ${DbTools.gEntreprenant.id} t ${DbTools.gEntreprenant.Id_Tmp} ${DbTools.gEntreprenant.ENT_Id_Server}\n");

                          await DbTools.getActivitesInsTransfEntID(wOldID);

                          for (var i = 0; i < DbTools.glfActivite_insTransf.length; i++) {
                            DbTools.gActivite_ins = DbTools.glfActivite_insTransf[i];
/*
                            print ("> EntreprenantId B ${DbTools.gEntreprenant.id} t ${DbTools.gEntreprenant.Id_Tmp} ${DbTools.gEntreprenant.ENT_Id_Server}\n");
                            DbTools.gEntreprenant = await DbTools.getEntreprenantsID(DbTools.gActivite_ins.entreprenantId!);
                            print ("> EntreprenantId C ${DbTools.gEntreprenant.id} t ${DbTools.gEntreprenant.Id_Tmp} ${DbTools.gEntreprenant.ENT_Id_Server}\n");
*/

                            DbTools.gActivite_ins.entreprenantId = DbTools.gEntreprenant.id!;
                            TextLog = "${DbTools.gActivite_ins.name!}\n";
                            TxtLogs.add(TextLog);
                            TextLog =  "-----> Activite_ins ${DbTools.gActivite_ins.id} ${DbTools.gActivite_ins.Id_Tmp}\n";
                            TxtLogs.add(TextLog);
                            await DbOdoo.Activite_insAddUpd();
                            TextLog = "-----< Activite_ins ${DbTools.gActivite_ins.id} ${DbTools.gActivite_ins.Id_Tmp}\n";
                            TxtLogs.add(TextLog);

                          }


                          TextLog = "< EntreprenantId ${DbTools.gEntreprenant.id} ${DbTools.gEntreprenant.Id_Tmp}\n";
                          TxtLogs.add(TextLog);


                          setState(() {
                            textController.text = TextLog;
                          });
                        }




                        await DbTools.getActivitesInsTransf();
                        TextLog = "Traitement glfActivite_insTransf ${DbTools.glfActivite_insTransf.length}\n";
                        TxtLogs.add(TextLog);

                        for (var i = 0; i < DbTools.glfActivite_insTransf.length; i++) {
                          DbTools.gActivite_ins = DbTools.glfActivite_insTransf[i];
                          DbTools.gEntreprenant = await DbTools.getEntreprenantsID(DbTools.gActivite_ins.entreprenantId!);

                          TextLog = "${DbTools.gActivite_ins.name!}\n";
                          TxtLogs.add(TextLog);
                          TextLog =  "> Activite_ins ${DbTools.gActivite_ins.id} ${DbTools.gActivite_ins.Id_Tmp}\n";
                          TxtLogs.add(TextLog);
                          await DbOdoo.Activite_insAddUpd();
                          TextLog = "< Activite_ins ${DbTools.gActivite_ins.id} ${DbTools.gActivite_ins.Id_Tmp}\n";
                          TxtLogs.add(TextLog);

                        }


                        await DbTools.getEntreprenantTransf();
                        print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfEntreprenantaTransf <<<< ${DbTools.glfEntreprenantaTransf.length}");
                        await DbTools.getActivitesInsTransf();

                        DbTools.listEntrVoidCallback();

                        setState(() {
                          circularProgressIndicator = false;
                          textController.text = TextLog;
                          isOnline = -1;
                          DbTools.Menu_screenVoidCallback();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        backgroundColor: gColors.primary,
                        elevation: 4,
                      ),
                      child: !circularProgressIndicator
                          ? Text(
                              "TRANSFERER",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            )
                          : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                    ),
                  ),
                  Container(width: 10),
                ],
              ),
            ),
          ),
        ));
  }
}
