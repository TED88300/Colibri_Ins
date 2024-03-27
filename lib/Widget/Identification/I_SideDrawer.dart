import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/shared_pref.dart';
import 'package:colibri/Widget/1-Login.dart';
import 'package:colibri/Widget/Commun/P_FlutterWifiIoT.dart';
import 'package:colibri/Widget/Commun/P_Send.dart';
import 'package:colibri/Widget/Commun/P_Sync.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class I_SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Block_Menu_App(context);
  }

  @override
  Widget Block_Menu_App(BuildContext context) {
    int Transf = DbTools.glfEntreprenantaTransf.length + DbTools.glfActivite_insTransf.length;

    print("Transf $Transf");

    return Container(
        width: 300,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: gColors.primary,
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Mafa Colibri INS",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: gColors.TextColor1, fontSize: 35),
                            ),
                            Text(
                              DbTools.gCurrentModeStr,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: gColors.TextColor1, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: gColors.TextColor1,
                  ),
                  Container(height: 10),
                ]),
              ),
              ListTile(
                leading: Icon(Icons.sync),
                title: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('SYNCHRONISATION'),
                ),
                onTap: () async {
                  if (Transf != 0) {
                    FlutterBeep.beep();
                    FlutterBeep.beep(false);
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Synchronisation impossible !!!',style : TextStyle(color: Colors.red)),
                        content: const Text("Vous avez des données à transférer avant d'exécuter la synchronisation!!!\n\nVoulez-vous forcer cette synchronisation ?"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text('Annuler'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              FlutterBeep.beep();
                              FlutterBeep.beep(false);
                              Navigator.pop(context, 'Cancel');
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('SYNCHRONISATION FORCE !!!',style : TextStyle(color: Colors.red)),
                                  content: const Text("Les données en attente de transfert vont être effacés !!!\n\nVoulez-vous forcer cette synchronisation ?",style : TextStyle(color: Colors.red)),
                                  actions: <Widget>[

                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sync()));
                                        print("RETOUR Sync");

                                        

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: Text(
                                        "Confirmer"
                                      ),
                                    ),
                                    Container(width : 150),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text('Annuler',style : TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Confirmer'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => Sync()));
                    print("RETOUR SYNC");
                    DbTools.listEntrVoidCallback();
                    print("RETOUR SYNC");

                  }
                },
              ),
              (Transf == 0)
                  ? Container()
                  : ListTile(
                      title: ElevatedButton(
                          onPressed: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => Send()));
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            backgroundColor: gColors.red,
                            elevation: 4,
                          ),
                          child: Row(
                            children: [
                              Text("TRANSFERT "),
                              Spacer(),
                              Text("E ${DbTools.glfEntreprenantaTransf.length} A ${DbTools.glfActivite_insTransf.length}"),
                            ],
                          )),
                    ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.wifi),
                title: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('Networks'),
                ),
                onTap: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterWifiIoT()));
                  Navigator.of(context).pop();
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () async {
                  DbTools.gIsRememberLogin = false;
                  DbTools.gIsRememberLoginOffLine = false;
                  await SharedPref.setBoolKey("IsRememberLogin", DbTools.gIsRememberLogin);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              Text("              " + DbTools.gVersion, textAlign: TextAlign.left, style: TextStyle(color: Colors.grey, fontSize: 12)),
              Container(height: 40),
            ],
          ),
        ));
  }
}
