import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Ins_Activite.dart';
import 'package:colibri/Tools/Ins_Entreprenant.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beep/flutter_beep.dart';

class Sync extends StatefulWidget {
  @override
  SyncState createState() {
    return new SyncState();
  }
}

class SyncState extends State<Sync> {
  final TextEditingController textController = new TextEditingController();
  static const platform = const MethodChannel('Px400_Print');

  String DateSync = "";

  String TextLog = "";
  bool isWork = false;

  int isOnline = -1;

  void initLib() async {



    DateSync = await SharedPref.getStrKey("DateSync", "");

    try {
      bool wRet = await DbOdoo.Login( DbTools.gUsername,  DbTools.gPassword );
      if (wRet)
        isOnline = 1;
      else
        isOnline = 0;
    } catch (_) {
      isOnline = 0;
    }
    setState(() {

    });

  }

  void initState() {
    initLib();
    textController.text = TextLog;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("isOnline $isOnline");

    return Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Synchronisation"),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                isOnline == -1 ? Container() :
                Image.asset(isOnline == 1 ?
                'assets/images/OnLine.jpg':
                'assets/images/OffLine.jpg',
                  width: 100,
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "",
                      counterText: "",
                    ),
                    controller: textController,
                    enableInteractiveSelection: false, // will disable paste operation
                    enabled: false,

                    style: new TextStyle(fontSize: 14.0),
                    minLines: 20,
                    maxLines: 300,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 0, bottom: 5),
              child: Container(
                color: Colors.white,
                height: 70,
                width: 250,
                child: Row(
                  children: <Widget>[
                    (isOnline != 1) ? Container() :
                    ElevatedButton(
                      onPressed: () async {
                        if (isWork) {
                          return;
                        }
                        isWork = true;
                        await getData();
                        DbTools.listEntrVoidCallback();
                        isWork = false;

                        print("Beep");
                        FlutterBeep.beep();
                        FlutterBeep.beep(false);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        backgroundColor: gColors.primary,
                        elevation: 4,
                      ),
                      child: Text(
                        "Synchroniser",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Container(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        TextLog = "Verif\n";
                        textController.text = TextLog;

                        var wDt = DateTime.now();
                        var wDt2 = DateTime.now();
                        var difference = wDt2.difference(wDt).inMilliseconds;
                        var dif = difference / 1000.0;

                        List<Entreprenant> lfEntreprenant;
                        lfEntreprenant = await DbTools.getEntreprenants();
                        wDt2 = DateTime.now();



                        difference = wDt2.difference(wDt).inMilliseconds;
                        dif = difference / 1000.0;

                        setState(() {
                          TextLog += "[${dif.toStringAsFixed(2)}] > ${lfEntreprenant.length} Contribuables en base\n";
                          textController.text = TextLog;
                        });


                        for (int i = 0; i < lfEntreprenant.length; ++i) {
                          var element = lfEntreprenant[i];
                          print("lfEntreprenant ${element.name} ${element.nomPrenomDirigeant} ${element.profession}");
                        }

                        wDt = DateTime.now();
                        List<Activite_ins> lfActivite;
                        lfActivite = await DbTools.getActivitesInsAll();
                        wDt2 = DateTime.now();

                        for (int i = 0; i < lfActivite.length; ++i) {
                          var element = lfActivite[i];
                          print("lfActivite ${element.name} ${element.entreprenantId}");
                        }


                        difference = wDt2.difference(wDt).inMilliseconds;
                        dif = difference / 1000.0;

                        setState(() {
                          TextLog += "[${dif.toStringAsFixed(2)}] > ${lfActivite.length} Activites en base\n";
                          textController.text = TextLog;
                        });


                        wDt = DateTime.now();
                        List<Secteur> lfSecteur;
                        lfSecteur = await DbTools.getSecteursSansTri();
                        wDt2 = DateTime.now();

                        difference = wDt2.difference(wDt).inMilliseconds;
                        dif = difference / 1000.0;

                        setState(() {
                          TextLog += "[${dif.toStringAsFixed(2)}] > ${lfSecteur.length} Secteurs en base\n";
                          textController.text = TextLog;
                        });


                        wDt = DateTime.now();
                        List<Country> lfCountry;
                        lfCountry = await DbTools.getCountrys();
                        wDt2 = DateTime.now();

                        difference = wDt2.difference(wDt).inMilliseconds;
                        dif = difference / 1000.0;

                        setState(() {
                          TextLog += "[${dif.toStringAsFixed(2)}] > ${lfCountry.length} Coutry en base\n";
                          textController.text = TextLog;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        backgroundColor: gColors.primary,
                        elevation: 4,
                      ),
                      child: Text(
                        "Verif",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Container(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          TextLog = DbTools.TraceDbg;
                          textController.text = TextLog;
                          FlutterBeep.beep();
                          FlutterBeep.beep(false);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        backgroundColor: gColors.primary,
                        elevation: 4,
                      ),
                      child: Text(
                        "test",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future getData() async {
    TextLog = "Get data Ilot ${DbOdoo.res_Userilot_id}\n";
    DateTime wDtTot = DateTime.now();


    await getlfEntreprenants();
    await getActivites_Ins();

//    await getFournisseurs();
//    await DbTools.initFournisseurDownMennu();
    await getSecteurs();
    await DbTools.initSecteurDownMennu();

    /*
    await getZones();
    await DbTools.initZoneDownMennu();
    await getSvas();
    await DbTools.initSvaDownMennu();
*/

    await getCountrys();
    await DbTools.initCountryDownMennu();

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL ALL\n";
      textController.text = TextLog;
    });
  }



  Future getActivites_Ins() async {
    DateTime wDtTot = DateTime.now();

    DbTools.deleteAll("Activites_Ins");

    int Pas = 400;
    int Deb = 0;
    int Iter = 999999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
      });


      DbOdoo.Ins_Activites.clear();

//      int Pas = 1;

      DateTime wDt = DateTime.now();
      int? NbActivites = await DbOdoo.getActivites_Ins(DbOdoo.res_Userilot_id, Deb + i * Pas, Pas);


      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbActivites Activites Ins chargées\n";
        textController.text = TextLog;
      });

      if (NbActivites == 0) break;

      wDt = DateTime.now();
      NbActivites = await DbOdoo.ActivitesInsIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbActivites Activites intégrées\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();
      List<Activite_ins> lfActivite_ins;
      lfActivite_ins = await DbTools.getActivitesInsAll();
      await DbTools.getActivitesInsAllTest();

      wDt2 = DateTime.now();

      for (int i = 0; i < lfActivite_ins.length; ++i) {
        var element = lfActivite_ins[i];
        print(" lfActivite_ins ${element.name} ${element.statutRegistreCommerce} ");
      }
      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;
    }

//                        db.execute("CREATE UNIQUE INDEX ActivitesPK ON Activites (ActiviteId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }

  Future getlfEntreprenants() async {
    DateTime wDtTot = DateTime.now();

    final db = await DbTools.database;
//                        db.execute("DROP INDEX `ContribuablesPK`;");

    await DbTools.deleteAll("Entreprenants");

    TextLog = "Get data Ilot ${DbOdoo.res_Userilot_id}\n";

    int Pas = 400;
    int Deb = 0;
    int Iter = 9999;

    for (int i = 0; i < Iter; ++i) {
      DateTime wDt = DateTime.now();
      DbOdoo.Ins_Entreprenants.clear();
      int? NbEntreprenants = await DbOdoo.Entreprenants(DbOdoo.res_Userilot_id, Deb + i * Pas, Pas);

      for (int i = 0; i < DbOdoo.Ins_Entreprenants.length; ++i) {
        var element = DbOdoo.Ins_Entreprenants[i];
//        print("element ${element.name} ${element.nomPrenomDirigeant} ${element.profession}");
      }

      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;
      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${DbOdoo.Ins_Entreprenants.length} Entreprenants chargés\n";
        textController.text = TextLog;
      });

//      print("DbOdoo.Ins_Entreprenants ${DbOdoo.Ins_Entreprenants.length}");
      if (DbOdoo.Ins_Entreprenants.length == 0) break;

      wDt = DateTime.now();
      NbEntreprenants = await DbOdoo.EntreprenantsIntegration();
      wDt2 = DateTime.now();
      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;
      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbEntreprenants Entreprenants intégrés\n";
        textController.text = TextLog;
      });
    }

    await DbTools.getEntreprenants();


    for (int i = 0; i < Iter; ++i) {
      setState(() {
        TextLog += "Lecture Entreprenants Sans Activité offset ${Deb + i * Pas}  Limit ${Pas}\n";
        textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();

      DbOdoo.Ins_Entreprenants.clear();
      int? NbEntreprenants = await DbOdoo.Entreprenants_Sans_Activite(DbOdoo.res_Userilot_id, Deb + i * Pas, Pas);
      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;
      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${DbOdoo.Ins_Entreprenants.length} Entreprenants chargés\n";
        textController.text = TextLog;
      });

      print("DbOdoo.Ins_Entreprenants Sans_Activite ${DbOdoo.Ins_Entreprenants.length}");

      if (DbOdoo.Ins_Entreprenants.length == 0) break;
      wDt = DateTime.now();
      NbEntreprenants = await DbOdoo.EntreprenantsIntegration();

      print("Sans_Activite NbEntreprenants ${NbEntreprenants} ${DbOdoo.Ins_Entreprenants.length}");

      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbEntreprenants Entreprenants intégrés\n";
        textController.text = TextLog;
      });
    }


//                        db.execute("CREATE UNIQUE INDEX ContribuablesPK ON Contribuables (contribuableId);");


    DbTools.glfEntreprenant = await DbTools.getEntreprenantDoublons();
    print("getEntreprenantDoublons DbTools.glfEntreprenant.length ${DbTools.glfEntreprenant.length}");


    DbTools.glfEntreprenant = await DbTools.getEntreprenantSansTri();
    print("EntreprenantsIntegration DbTools.glfEntreprenant.length ${DbTools.glfEntreprenant.length}");

    for (int i = 0; i < DbTools.glfEntreprenant.length; ++i) {
      var wEntreprenant = DbTools.glfEntreprenant[i];
      print("wEntreprenant ${wEntreprenant.name} ${wEntreprenant.nomPrenomDirigeant}");
    }


    return DbTools.glfEntreprenant.length;



  }

  //**************************
  //**************************
  //**************************

  Future getFournisseurs() async {
    DateTime wDtTot = DateTime.now();
    final db = await DbTools.database;
//                        db.execute("DROP INDEX `FournisseursPK`;");
    DbTools.deleteAll("Fournisseurs");
    int Pas = 5000;
    int Deb = 0;
    int Iter = 9999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
//                            TextLog = "Lecture Fournisseurs ${Deb+i*Pas}\n";
        //                          textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();

      print("DbOdoo.Fournisseurs >");

      int? NbFournisseurs = await DbOdoo.Fournisseurs(Deb + i * Pas, Pas);

      print("DbOdoo.Fournisseurs <");

      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
//                            TextLog += "[${dif.toStringAsFixed(2)}] > $NbFournisseurs Fournisseurs chargés\n";
//                            textController.text = TextLog;
      });
      if (NbFournisseurs == 0) break;

      wDt = DateTime.now();
      NbFournisseurs = await DbOdoo.FournisseursIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbFournisseurs Fournisseurs intégrés\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();

      List<Fournisseur> lfFournisseur;
      lfFournisseur = await DbTools.getFournisseursSansTriAll();

      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${lfFournisseur.length} Fournisseurs en base\n";
        textController.text = TextLog;
      });
    }

//                        db.execute("CREATE UNIQUE INDEX FournisseursPK ON Contribuables (contribuableId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }

  //**************************
  //**************************
  //**************************

  Future getSecteurs() async {

    setState(() {
      TextLog += "getSecteurs\n";
      textController.text = TextLog;
    });



    DateTime wDtTot = DateTime.now();

    final db = await DbTools.database;
    DbTools.deleteAll("Secteurs");
    int Pas = 5000;
    int Deb = 0;
    int Iter = 9999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
//                            TextLog = "Lecture Secteurs ${Deb+i*Pas}\n";
        //                          textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();

      print("DbOdoo.Secteurs >");

      int? NbSecteurs = await DbOdoo.Secteurs(Deb + i * Pas, Pas);

      print("DbOdoo.Secteurs <");

      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
//                            TextLog += "[${dif.toStringAsFixed(2)}] > $NbSecteurs Secteurs chargés\n";
//                            textController.text = TextLog;
      });
      if (NbSecteurs == 0) break;

      wDt = DateTime.now();
      NbSecteurs = await DbOdoo.SecteursIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbSecteurs Secteurs intégrés\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();
      List<Secteur> lfSecteur;
      lfSecteur = await DbTools.getSecteursSansTri();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${lfSecteur.length} Secteurs en base\n";
        textController.text = TextLog;
      });
    }

//                        db.execute("CREATE UNIQUE INDEX SecteursPK ON Contribuables (contribuableId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;


    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }

  Future getZones() async {
    DateTime wDtTot = DateTime.now();

    final db = await DbTools.database;
//                        db.execute("DROP INDEX `ZonesPK`;");

    DbTools.deleteAll("Zones");
    int Pas = 5000;
    int Deb = 0;
    int Iter = 9999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
//                            TextLog = "Lecture Zones ${Deb+i*Pas}\n";
        //                          textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();
      int? NbZones = await DbOdoo.Zones(Deb + i * Pas, Pas);
      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
//                            TextLog += "[${dif.toStringAsFixed(2)}] > $NbZones Zones chargés\n";
//                            textController.text = TextLog;
      });
      if (NbZones == 0) break;

      wDt = DateTime.now();
      NbZones = await DbOdoo.ZonesIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbZones Zones intégrés\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();
      List<Zone> lfZone;
      lfZone = await DbTools.getZonesSansTri();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${lfZone.length} Zones en base\n";
        textController.text = TextLog;
      });
    }

//                        db.execute("CREATE UNIQUE INDEX ZonesPK ON Contribuables (contribuableId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }

  Future getSvas() async {
    DateTime wDtTot = DateTime.now();

    final db = await DbTools.database;
//                        db.execute("DROP INDEX `SvasPK`;");

    DbTools.deleteAll("Svas");
    int Pas = 5000;
    int Deb = 0;
    int Iter = 9999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
        TextLog += "Lecture Svas ${Deb + i * Pas}\n";
        textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();
      int? NbSvas = await DbOdoo.Svas(Deb + i * Pas, Pas);
      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbSvas Svas chargés\n";
        textController.text = TextLog;
      });
      if (NbSvas == 0) break;

      wDt = DateTime.now();
      NbSvas = await DbOdoo.SvasIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbSvas Svas intégrés\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();
      List<Sva> lfSva;
      lfSva = await DbTools.getSvasSansTri();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${lfSva.length} Svas en base\n";
        textController.text = TextLog;
      });
    }

//                        db.execute("CREATE UNIQUE INDEX SvasPK ON Contribuables (contribuableId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }

  Future getCountrys() async {
    DateTime wDtTot = DateTime.now();

    final db = await DbTools.database;
//                        db.execute("DROP INDEX `CountrysPK`;");

    DbTools.deleteAll("Countrys");
    int Pas = 5000;
    int Deb = 0;
    int Iter = 9999;
    for (int i = 0; i < Iter; ++i) {
      setState(() {
//                            TextLog = "Lecture Countrys ${Deb+i*Pas}\n";
        //                          textController.text = TextLog;
      });
      DateTime wDt = DateTime.now();
      int? NbCountrys = await DbOdoo.Countrys(Deb + i * Pas, Pas);
      DateTime wDt2 = DateTime.now();
      var difference = wDt2.difference(wDt).inMilliseconds;
      double dif = difference / 1000.0;

      setState(() {
//                            TextLog += "[${dif.toStringAsFixed(2)}] > $NbCountrys Countrys chargés\n";
//                            textController.text = TextLog;
      });
      if (NbCountrys == 0) break;

      wDt = DateTime.now();
      NbCountrys = await DbOdoo.CountrysIntegration();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > $NbCountrys Countrys intégrés\n";
        textController.text = TextLog;
      });

      wDt = DateTime.now();
      List<Country> lfCountry;
      lfCountry = await DbTools.getCountrys();
      wDt2 = DateTime.now();

      difference = wDt2.difference(wDt).inMilliseconds;
      dif = difference / 1000.0;

      setState(() {
        TextLog += "[${dif.toStringAsFixed(2)}] > ${lfCountry.length} Countrys en base\n";
        textController.text = TextLog;
      });
    }

//                        db.execute("CREATE UNIQUE INDEX CountrysPK ON Contribuables (contribuableId);");

    DateTime wDt2Tot = DateTime.now();
    var difference = wDt2Tot.difference(wDtTot).inMilliseconds;
    double dif = difference / 1000.0;

    setState(() {
      TextLog += "[${dif.toStringAsFixed(2)}] > TEMPS TOTAL\n";
      textController.text = TextLog;
    });
  }
}
