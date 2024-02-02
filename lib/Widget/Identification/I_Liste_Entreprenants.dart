import 'package:auto_size_text/auto_size_text.dart';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Ins_Entreprenant.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYC_Ins_0.dart';
import 'package:colibri/Widget/Identification/I_KYC_Ins_Upd.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:consumer/consumer.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var consumer = Consumer(I_Liste_EntreprenantsState());

class I_Liste_Entreprenants extends StatefulWidget {
  @override
  I_Liste_EntreprenantsState createState() => I_Liste_EntreprenantsState();
}

class I_Liste_EntreprenantsState extends State<I_Liste_Entreprenants> {
  String searchText = "";
  TextEditingController Filtre_Nom = new TextEditingController();
  TextEditingController Search = new TextEditingController();

  String? _currentPrdFam = "";

  Future<List<Entreprenant>>? lfEntreprenant;
  Future<List<Entreprenant>> loadData() async {
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ >>>>");

    try{
      await DbOdoo.Login(DbTools.gUsername, DbTools.gPassword);
    } catch (e) {}

    await DbTools.gloadDataEntr();
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfEntreprenant <<<< ${DbTools.glfEntreprenant.length}");
    await DbTools.getEntreprenantTransf();
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfEntreprenantaTransf <<<< ${DbTools.glfEntreprenantaTransf.length}");
    await DbTools.getActivitesInsTransf();
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ glfActivite_insTransf <<<< ${DbTools.glfActivite_insTransf.length}");
    await DbTools.getActivitesInsAllTest();

    String Srch = removeDiacritics(searchText.toUpperCase());
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ loadData");
    return await  DbTools.getEntreprenantsFiltre(Srch);
  }

  Future Reload() async {
    setState(() {
      lfEntreprenant = loadData();
    });
  }

  void initLib() async {
    Reload();
  }

  void Entr_screenVoidCallback() {
    print("screenVoidCallback callback()");
    Reload();
  }



  void initState() {



    DbTools.listEntrVoidCallback =Entr_screenVoidCallback;
    searchText = "";
    Search.text = searchText;
    initLib();
    super.initState();
    DbTools.gI_Liste_EntreprenantsState_callback = this.I_Liste_EntreprenantsState_callback;
  }

   I_Liste_EntreprenantsState_callback() async {
    print("I_Liste_EntreprenantsState callback()");
    await Reload();

  }

    @override
  Widget build(BuildContext context) {

      DbTools.isUpdate = false;

      print("consumer.build");
      if (DbTools.gCurrentIndexVP != DbTools.gCurrentIndex)
        {
          Reload();
          DbTools.gCurrentIndexVP = DbTools.gCurrentIndex;
        }


    return
         Container(
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
            body: Container(
                color: Colors.transparent,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchWidget(),
                      Expanded(
                        child: EntreprenantListeWidget(),
                      ),
                    ])),


            floatingActionButton:
            DbTools.gCurrentIndex != 2 ? Container():
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child:

              FloatingActionButton(
                child: const Icon(Icons.add, color: gColors.secondary),
                backgroundColor: gColors.primary,
                onPressed: () async {
                  await _launchEnrol();
                },
              ),
              //),
            ),



          ),
        );


  }

  Future<Null> _textMessageSubmitted(String text) async {
    Search.clear();
    setState(() {
      print("Search $text");
    });
  }

  Widget searchWidget() {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new IconButton(
                        icon: new Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () async {}),
                  ),
                  new Flexible(
                    child: new TextField(
                      controller: Search,
                      onChanged: (String wSearchText) {
                        print("onChanged Search $wSearchText");

/*
                        if (wSearchText.length >= 2) {
                            searchText = wSearchText;
                            Reload();
                        } else if (searchText == "") {
                            searchText = wSearchText;
                            Reload();
                        }
*/

                        searchText = wSearchText;
                        Reload();



                      },
                      decoration: new InputDecoration(
                        hintText: "Recherche",
                        suffixIcon: IconButton(
                          onPressed: Search.clear,
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Container(height: 1, color: Colors.black)
          ]),
    );
  }


  Widget EntreprenantListeWidget() {
    String Srch = removeDiacritics(searchText.toUpperCase());

    print("EntreprenantListeWidget Srch  |$Srch|");

    return FutureBuilder<List<Entreprenant>>(
      future: lfEntreprenant, // DbTools.getEntreprenantsFiltre(Srch),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Entreprenant> data = snapshot.data!;
          return EntreprenantListView(data);
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
                "Filtre...",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ]);
      },
    );
  }

  ListView EntreprenantListView(data) {
    DbTools.isUpdate = false;
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          Entreprenant entreprenant = data?.elementAt(index);

          String initials = getInitials(entreprenant.nomPrenomDirigeant!);

          return ListTile(
            onTap: () {
              print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈Upd ");
              DbTools.gEntreprenant = entreprenant;
              DbTools.isUpdate = true;
              PushPop.PushPop_Push(true);
              Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_Upd(this.I_Liste_EntreprenantsState_callback)));
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
                      backgroundColor: (entreprenant.ENT_TRANSF_OK == 1)
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
                        "${entreprenant.nomPrenomDirigeant!.toUpperCase()} (${entreprenant.id})",
                        style: TextStyle(
                            color: gColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ]),
                AutoSizeText(
                  "${entreprenant.state} id ${entreprenant.id} Tmp ${entreprenant.Id_Tmp} TRF ${entreprenant.ENT_TRANSF_OK} > Srv ${entreprenant.ENT_Id_Server}",
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(color: gColors.secondary, fontSize: 20),
                ),
                Container(height: 10),
                Container(height: 1, color: gColors.primary)
              ],
            ),
          );
        });
  }

  String getInitials(String wInitial) {
//    if (wInitial.isEmpty) return "PP";
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

  //*******************************************************************

  String wError = "";
  String? wScan = "";
  String _message = "";
  Image? ImageCNI = null;

  Future _launchEnrol() async {

    DbTools.gEntreprenant = Entreprenant();
    DbTools.gEntreprenant.init();




print("_launchEnrol DbTools.gID3_OK ${DbTools.gID3_OK}");

    DbTools.pagesEntr = DbTools.gID3_OK ? 4 : 3;
    DbTools.pageEntr = 1;
    PushPop.PushPop_Push(true);
    Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_0(this.I_Liste_EntreprenantsState_callback)));
    return;


  }
}
