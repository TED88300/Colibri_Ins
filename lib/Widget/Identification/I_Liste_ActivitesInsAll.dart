import 'package:auto_size_text/auto_size_text.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/Ins_Activite.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins0.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class I_Liste_ActivitesIns extends StatefulWidget {
  @override
  I_Liste_ActivitesInsState createState() => I_Liste_ActivitesInsState();
}

class I_Liste_ActivitesInsState extends State<I_Liste_ActivitesIns> {
  Future<List<Activite_ins>>? lfActivite_ins;

  Future<List<Activite_ins>> loadData() async {
    await DbTools.getActivitesInsAllTest();

    print("loadData ${DbTools.gEntreprenant.id} ${DbTools.gEntreprenant.Id_Tmp!}");
    return await DbTools.getActivitesIns(DbTools.gEntreprenant.id!, DbTools.gEntreprenant.Id_Tmp!);
  }

  Future Reload() async {
    setState(() {
      lfActivite_ins = loadData();
    });
  }

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

    print(">->->->>->->->>->->-> ActiviteListView build ${DbTools.isUpdate}");

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("ACTIVITES"),
          ),
          body: Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: ContribuableWidget(),
            ),
            Expanded(
              child: ActiviteListeWidget(),
            ),
          ])),
        ));
  }

  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        AutoSizeText(
          "Entreprenant : ${DbTools.gEntreprenant.nomPrenomDirigeant!.toUpperCase()}",
          maxLines: 1,
          style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
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

  Widget ActiviteListeWidget() {
    return FutureBuilder<List<Activite_ins>>(
      future: lfActivite_ins,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Activite_ins> data = snapshot.data!;
          return ActiviteListView(data);
        } else if (snapshot.hasError) {
          return Text("Liste vide...");
        } else {
//          print("data " + snapshot.connectionState.toString());
        }
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SpinKitThreeBounce(
            color: gColors.primary,
            size: 100.0,
          ),
          Container(
            height: 10,
          ),
          Text(
            "Lecture...",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ]);
      },
    );
  }

  ListView ActiviteListView(data) {
    DbTools.isUpdate = false;
    print(">->->->->->->->->-> ActiviteListView ${DbTools.isUpdate}");
    var formatter = NumberFormat(',###,000');


    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          Activite_ins activite_ins = data?.elementAt(index);

          String initials = getInitials(activite_ins.name!.toUpperCase());

          String secteur_name = "";
          for (int i = 0; i < DbTools.lfSecteur.length; ++i) {
            var element = DbTools.lfSecteur[i];
            if (DbTools.gActivite_ins.secteurId!.compareTo(element.secteurid!) == 0 )
            {
              DbTools.selectedSecteur = element;
              DbTools.gActivite_ins.secteurId = element.secteurid;
              secteur_name = element.secteur_name!;
              break;
            }
          }
;

          return ListTile(
            onTap: () async {
            },
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            leading: InkWell(
              child: Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CircleAvatar(
                      child: CircleAvatar(
                        child: Text(
                          initials,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: (activite_ins.ACT_TRANSF_OK == 1) ? gColors.primary : gColors.red,
                      ),
                      backgroundColor: Colors.transparent),
                ),
              ),
              onTap: () async{

                activite_ins.init();
                DbTools.gActivite_ins = activite_ins;
                print(">TAP ActiviteListView ${DbTools.gActivite_ins.ACT_Id_Server}");
                await DbTools.initFournisseurDownMennu(DbTools.gActivite_ins.id!);
                DbTools.pagesKYB = 6;
                DbTools.pageKYB = 1;
                DbTools.isUpdate = true;
                print(">->->->->->->->->-> ActiviteListView DbTools.isUpdate TAP ${DbTools.isUpdate}");

                DbTools.pageEntr = 1;
                DbTools.pagesEntr = 9;
                DbTools.strEntr = "KYC";

                PushPop.PushPop_Push(true);
                await Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins0()));
                await Reload();
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  AutoSizeText(
                    activite_ins.name!.toUpperCase(),
                    style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  AutoSizeText(
                    "${activite_ins.state} ${secteur_name}",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ]),
                AutoSizeText(
                  "CA Tax. : ${activite_ins.taxe_base}          Taxe Annuelle : ${activite_ins.taxe_mt}",
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(color: gColors.secondary, fontSize: 16),
                ),
                Container(height: 10),
                Container(height: 1, color: gColors.primary)
              ],
            ),
          );
        });
  }

  String getInitials(String wInitial) {
    if (wInitial.isEmpty) return "";

    wInitial = wInitial.trim();
    List<String> names = wInitial.split(" ");

    String initials = "";
    int numWords = 2;

    if (names.length < numWords) {
      numWords = names.length;
    }

    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return initials;
  }
}
