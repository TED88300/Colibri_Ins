import 'dart:convert';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbPostGres.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/shared_pref.dart';

import 'package:colibri/Tools/DbTools.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class LoginState extends State<Login> {
  var users = const {
    't@srf.fr': '123',
  };

  bool Ecr1 = true;
  bool? isChecked = false;
  Map<String, dynamic>? _userData;
//  AccessToken _accessToken;
  bool _checking = true;

  final _formKey = GlobalKey<FormState>();

  final tecMail = TextEditingController();
  final tecPW = TextEditingController();

  String LoginError = "";

  void initLib() async {}

  @override
  void initState() {
    super.initState();
    initLib();

    //if (DbTools.gTED)
    {
      tecMail.text = "thierry@id30.com";
      tecPW.text = "thierry@id30.com";

//      tecMail.text = "id1@id30.com";
      //    tecPW.text = "AZ12";

//      tecMail.text = "daudiert2@wanadoo.fr";
      //    tecPW.text = "Zzt88300";
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text("Login"),
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Visibility(
                    visible: (Ecr1),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Card(
                                elevation: 2,
                                child: Image.asset(
                                  'assets/images/AppIco.png',
                                  width: 200,
                                  height: 200,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: tecMail,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Erreur eMail vide";
                              }
                              return null;
                            },
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Mail", hintText: "Entrez votre eMail"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 5, bottom: 0),
                          child: TextFormField(
                            controller: tecPW,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Erreur mot de passe vide";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Mot de passe", hintText: "Entrez votre mot de passe"),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Se souvenir de moi",
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print("gIsRememberLoginOffLine ${DbTools.gIsRememberLoginOffLine}");
                                if (DbTools.gIsRememberLoginOffLine) {
                                  DbTools.gUsername = await SharedPref.getStrKey("username", "");
                                  DbTools.gPassword = await SharedPref.getStrKey("password", "");
                                  if (DbTools.gUsername == tecMail.text && DbTools.gPassword == tecPW.text) {
                                    await SharedPref.setBoolKey("IsRememberLogin", isChecked!);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
                                  }
                                } else {
                                  print("Login");
                                  bool LoginOK = await DbOdoo.Login(tecMail.text, tecPW.text);
                                  print("Login LoginOK $LoginOK");
                                  if (LoginOK) {
                                    await SharedPref.setBoolKey("IsRememberLogin", isChecked!);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
                                  } else {
                                    print("Login ERROR");

                                    setState(() {
                                      LoginError = "Erreur eMail ou mot de passe invalide";
                                    });
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              backgroundColor: gColors.primary,
                              elevation: 4,
                            ),
                            child: Text(
                              "Se connecter",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 5, bottom: 0),
                          child: Text(
                            LoginError,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 50,
                        ),
//                        !DbTools.gTED
                        //                          ? Container()
                        //            :
/*                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      print("Login");

                                      setState(() {
                                        tecMail.text = "daudiert2@wanadoo.fr";
                                        tecPW.text = "Zzt88300";
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: gColors.secondary,
                                      elevation: 4,
                                    ),
                                    child: Text(
                                      "COL",
                                      style: TextStyle(color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        tecMail.text = "daudiert@skyviewprod.com";
//                                              tecPW.text = "Toya#Gnobks";
                                        tecPW.text = "daud@@azerty123";
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: gColors.secondary,
                                      elevation: 4,
                                    ),
                                    child: Text(
                                      "IND",
                                      style: TextStyle(color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        tecMail.text = "daudiert@skyviewprod1.com";
//                                              tecPW.text = "Toya#Gnobks";
                                        tecPW.text = "12345678";
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: gColors.secondary,
                                      elevation: 4,
                                    ),
                                    child: Text(
                                      "EVAL",
                                      style: TextStyle(color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),*/
                        Visibility(
                          visible: (!Ecr1),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Center(
                                  child: Card(elevation: 16, child: Image.asset('assets/images/PFO_ITC.jpg')),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15, bottom: 0),
                                child: TextField(
                                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "eMail", hintText: "Entrez votre eMail"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25, bottom: 25),
                                child: Container(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        Ecr1 = !Ecr1;
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
                                      "Réinitialiser votre mot de passe",
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 0, bottom: 25),
                                child: Container(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        Ecr1 = !Ecr1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor: Colors.white,
                                      elevation: 4,
                                    ),
                                    child: Text(
                                      "Retour",
                                      style: TextStyle(color: gColors.primary, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ])))));
  }
}
