import 'package:auto_size_text/auto_size_text.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Ins_Activite.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins0.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins1.dart';
import 'package:colibri/widgetTools/PushPop.dart';
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  child: ContribuableWidget(),
                ),
                Expanded(
                  child: ActiviteListeWidget(),
                ),
              ])),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: SizedBox(
              width: 140,
              child: FloatingActionButton(
//              child: Icon(Icons.add),
                child: Text(
                  "Nouveau",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),

                backgroundColor: gColors.primary,
                onPressed: () async {
                  DbTools.gActivite_ins = Activite_ins();
                  DbTools.gActivite_ins.init();
                  DbTools.gActivite_ins.secteurId = 1;
                  DbTools.gActivite_ins.ACT_TRANSF_OK = 0;
                  DbTools.gActivite_ins.ACT_Id_Server = -1;


                  print("Add nomPrenomDirigeant ${DbTools.gEntreprenant.nomPrenomDirigeant!} ${DbTools.gActivite_ins.ACT_Id_Server}");

                  DbTools.gActivite_ins.entreprenantId = DbTools.gEntreprenant.id;
                  DbTools.gActivite_ins.id = 0;
                  DbTools.gActivite_ins.Id_Tmp = 0;
                  DbTools.gActivite_ins.ACT_TRANSF_OK = 0;
                  DbTools.pageEntr = 1;
                  DbTools.pagesEntr = 10;
                  DbTools.strEntr = "KYC";
                  DbTools.gActivite_ins.name = "";
                  DbTools.gActivite_ins.street = "";
                  DbTools.gActivite_ins.zip = "";
                  DbTools.gActivite_ins.city = "";
                  DbTools.gActivite_ins.telephoneFixe1Entreprise = "";
                  DbTools.gActivite_ins.mobile = "";
                  DbTools.gActivite_ins.zone_implantation_entreprise = "0";
                  DbTools.gActivite_ins.libelle_zone_implantation_entreprise = "";
                  DbTools.gActivite_ins.numero_batiment = "0";
                  DbTools.gActivite_ins.numero_sequence_batiment_entreprise = "0";
                  DbTools.gActivite_ins.typeTaxe = "???";
                  DbTools.gActivite_ins.dateDebutExploitation = "1900-01-01";
                  DbTools.gActivite_ins.name = "TEDD";
                  DbTools.gActivite_ins.activityBirthday = "2020-01-01";
                  DbTools.gActivite_ins.street = "Rue du Bac";
                  DbTools.gActivite_ins.telephoneFixe1Entreprise = "2112345678";
                  DbTools.gActivite_ins.mobile = "0712345679";
                  DbTools.gActivite_ins.chiffreAffaireTaxable = "123456789";
                  DbTools.gActivite_ins.tailleActivite = "Petite";
                  DbTools.gActivite_ins.activictePrincipal = "Artiste Peintre";
                  DbTools.gActivite_ins.barcode = "261223";

                  DbTools.gActivite_ins.partnerLatitude = "0";
                  DbTools.gActivite_ins.partnerLongitude = "0";
                  DbTools.gActivite_ins.gpsPrecision = "0";




                  await Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins0()));
                  await Reload();
                },
              ),
            ),
          ),
        ));
  }

  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AutoSizeText(
              "Entreprenant : ${DbTools.gEntreprenant.nomPrenomDirigeant!.toUpperCase()}",
              maxLines: 1,
              style: TextStyle(
                  color: gColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),

            AutoSizeText(
              "${DbTools.gEntreprenant.telephoneDirigeant} (${DbTools.gEntreprenant.id})",
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
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          Activite_ins activite_ins = data?.elementAt(index);
          String initials = "i";
          return ListTile(
            onTap: () async {

              activite_ins.init();
              DbTools.gActivite_ins = activite_ins;


              if (DbTools.gActivite_ins.state != "draft" && DbTools.gActivite_ins.state != "cancel") {
                await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('MODIFICATION IMPOSSIBLE', style: TextStyle(color: Colors.red)),
                    content: Text("Activité en mode [${DbTools.gActivite_ins.state}]. La modification n'est pas possible"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                          return;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text('OK', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              }

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
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins1()));
                  await Reload();
            },
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            leading: Container(
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
                      backgroundColor: (activite_ins.ACT_TRANSF_OK == 1)
                          ? gColors.primary
                          : gColors.red,


                    ),
                    backgroundColor: Colors.transparent),
              ),
            ),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        activite_ins.name!.toUpperCase(),
                        style: TextStyle(
                            color: gColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ]),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "${activite_ins.state}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                    ]),
                AutoSizeText(
                  "Entr ${activite_ins.entreprenantId} Id ${activite_ins.id.toString()} Tmp ${activite_ins.Id_Tmp} TRANSF ${activite_ins.ACT_TRANSF_OK} > ${activite_ins.ACT_Id_Server}",
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
