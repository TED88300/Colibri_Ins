import 'dart:convert';
import 'package:Colibri_Collecte/Tools/DbToolsV3.dart';
import 'package:Colibri_Collecte/Widget/3_bottom_navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Tools/shared_pref.dart';

import 'package:Colibri_Collecte/Tools/DbTools.dart';

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

    if (DbTools.gTED) {
      tecMail.text = "daudiert2@wanadoo.fr";
      tecPW.text = "1234567890";
//      tecMail.text = "charles.kouadio@id30.ci";
//      tecPW.text = "@ck@2024";
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
                                  'assets/images/AppIco200.png',
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
                          child:
                          ElevatedButton(
                            onPressed: () async {
                              DbTools.gIsRememberLoginOffLine = false;
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
                                  bool LoginOK = await DbToolsV3.LoginV3(tecMail.text, tecPW.text);
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
                        Text(DbTools.gVersion, textAlign: TextAlign.left, style: TextStyle(color: Colors.grey, fontSize: 12)),

                      (!DbTools.gTED) ? Container() :
                      Container(
                        child: Row(children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              tecMail.text = "agent1@id30.ci";
                              tecPW.text = "@Agent1";
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              backgroundColor: gColors.primary,
                              elevation: 4,
                            ),
                            child: Text(
                              "User 1",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Spacer(),

                          ElevatedButton(
                            onPressed: () async {
                              tecMail.text = "agent2@id30.ci";
                              tecPW.text = "@Agent2";
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              backgroundColor: gColors.primary,
                              elevation: 4,
                            ),
                            child: Text(
                              "User 2",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Spacer(),

                          ElevatedButton(
                            onPressed: () async {
                              tecMail.text = "agent3@id30.ci";
                              tecPW.text = "@Agent3";
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              backgroundColor: gColors.primary,
                              elevation: 4,
                            ),
                            child: Text(
                              "User 3",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Spacer(),

                          ElevatedButton(
                            onPressed: () async {
                              tecMail.text = "agent4@id30.ci";
                              tecPW.text = "@Agent4";
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              backgroundColor: gColors.primary,
                              elevation: 4,
                            ),
                            child: Text(
                              "User 4",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Spacer(),


                        ],)
                      ),


                      ],
                    ),
                  ),
                ])))));
  }
}
