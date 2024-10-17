import 'dart:async';
//import 'dart:js_interop';
import 'package:Colibri_Collecte/Tools/DbOdoo.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/DbToolsV3.dart';
import 'package:Colibri_Collecte/Tools/Tools.dart';
import 'package:Colibri_Collecte/Tools/shared_pref.dart';
import 'package:Colibri_Collecte/Widget/1-Login.dart';
import 'package:Colibri_Collecte/Widget/3_bottom_navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  var _visible = true;
  var IsRememberLogin = false;
  var milliseconds = 2000;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(milliseconds: milliseconds); //SetUp duration here
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    DbTools.gIsRememberLogin = await SharedPref.getBoolKey("IsRememberLogin", false);
    DbTools.gUsername = await SharedPref.getStrKey("username", "");
    DbTools.gPassword = await SharedPref.getStrKey("password", "");

    await Tools.Load_UNIQUE();
    await Tools.Load_FORMEL();
    await Tools.Load_INFORMEL();

    print("SplashScreen >>>>> ${DbTools.gIsRememberLogin} ${DbTools.gUsername} ${DbTools.gPassword} ");

    if (DbTools.gIsRememberLogin) {
      try {

//        bool LoginOK = await DbOdoo.Login(DbTools.gUsername, DbTools.gPassword);
        bool LoginOK = await DbToolsV3.LoginV3(DbTools.gUsername, DbTools.gPassword);
        print("∆∆∆∆∆∆∆∆ SplashScreen >>>>> LoginOK $LoginOK");

        if (!LoginOK) {
          DbTools.gIsRememberLoginOffLine = true;
          print("∆∆∆∆∆∆∆∆ Login DbTools.gIsRememberLoginOffLine ${DbTools.gIsRememberLoginOffLine}");
        } else {
          print(" Login DbTools.gIsRememberLogin ${DbTools.gIsRememberLogin}");
          DbTools.gIsRememberLoginOffLine = false;
          print(" SplashScreen >>>>> LOGIN OK ${DbToolsV3.Ilots.length} ${DbToolsV3.Ilots.length > 0}");

          if (DbToolsV3.Ilots.length > 0) {
            print(" ONLINE ILOT0 ${DbToolsV3.Ilots[0].ilotName}");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
            return;
          } else {
            print(" ONLINE ILOTS VIDE}");
          }

        }
      } catch (e) {
        print("SplashScreen >>>>> LOGIN ERROR $e");
        DbTools.gIsRememberLoginOffLine = true;
      }


      print("SplashScreen >>>>> res_Usercommune_id ERROR ${await SharedPref.getStrKey("res_Usercommune_id", "0")}");
      DbOdoo.res_Usercommune_id = int.parse(await SharedPref.getStrKey("res_Usercommune_id", "0"));



       }
    if (DbOdoo.Ilots.length > 0) {
      print(" OFFLINE ILOT0 ${DbToolsV3.Ilots[0].ilotName}");
    } else {
      DbTools.gIsRememberLogin = false;
      print(" OFFLINE ILOTS VIDE}");
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  void initLib() async {
    DbTools.packageInfo = await PackageInfo.fromPlatform();
    DbTools.gVersion = "V${DbTools.packageInfo.version} b${DbTools.packageInfo.buildNumber}";
    await DbTools.initSqlite();



  }

  @override
  void initState() {
    super.initState();
    initLib();

    if (DbTools.gTED) {
      milliseconds = 800;
    }

    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    final double width = MediaQuery.of(context).size.width * 0.9;
    final double height = MediaQuery.of(context).size.height * 0.9;

//    print("Screen Size ${MediaQuery.of(context).size.width} ${MediaQuery.of(context).size.height}");

    double w = animation.value * 700;
    double h = animation.value * 700;

    if (w > width) w = width;
    if (h > height) h = height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/AppIco.png',
                width: w,
                height: h,
//                color: (DbTools.gTED || DbTools.gEMULATEUR) ? Colors.red : null,
              ),
              Text("Colibri Collecte",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.green,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
