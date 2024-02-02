import 'dart:async';
//import 'dart:js_interop';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Tools.dart';
import 'package:colibri/Tools/shared_pref.dart';
import 'package:colibri/Widget/1-Login.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
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
        bool LoginOK = await DbOdoo.Login(DbTools.gUsername, DbTools.gPassword);
        print("∆∆∆∆∆∆∆∆ SplashScreen >>>>> LoginOK $LoginOK");

        if (!LoginOK) {
          DbTools.gIsRememberLoginOffLine = true;
          print("∆∆∆∆∆∆∆∆ Login DbTools.gIsRememberLoginOffLine ${DbTools.gIsRememberLoginOffLine}");
        } else {
          print(" Login DbTools.gIsRememberLogin ${DbTools.gIsRememberLogin}");

          DbTools.gIsRememberLoginOffLine = false;
          print(" SplashScreen >>>>> LOGIN OK");

          if (DbOdoo.Ilots.length > 0) {
            print(" ONLINE ILOT0 ${DbOdoo.Ilots[0].ilotName}");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
            return;
          } else {
            print(" ONLINE ILOTS VIDE}");
          }

        }
      } catch (_) {
        print("SplashScreen >>>>> LOGIN ERROR");
        DbTools.gIsRememberLoginOffLine = true;
      }
    }
    if (DbOdoo.Ilots.length > 0) {
      print(" OFFLINE ILOT0 ${DbOdoo.Ilots[0].ilotName}");
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
              ),
              Text("Version N°2",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.purpleAccent,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
