import 'package:auto_size_text/auto_size_text.dart';
import 'package:colibri/Tools/DbPostGres.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/intent_result.dart';
import 'package:colibri/Tools/shared_pref.dart';

import 'package:colibri/Widget/Identification/I_Dashboard.dart';
import 'package:colibri/Widget/Identification/I_Identificateur.dart';

import 'package:colibri/Widget/Identification/I_Liste_Entreprenants.dart';
import 'package:colibri/Widget/Identification/I_Revoir.dart';
import 'package:colibri/Widget/Identification/I_SideDrawer.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title

  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class BottomNavigationList extends StatefulWidget {
  BottomNavigationList();
  @override
  BottomNavigationListState createState() => BottomNavigationListState();
}

class BottomNavigationListState extends State<BottomNavigationList>
//    with WidgetsBindingObserver
{
  String? Token_FBM;

  List<BottomNavigationBarItem> itemsNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: '',
    ),
  ];

  //************ ID *******************

  List<String> itemsTitre = <String>[
    "DASHBOARD",
    "FICHES BROUILLONS",
    "ENTREPRENANTS",
    "FICHES REJETEES",
    "MESSAGERIE",
  ];

  List<Widget> children = [
    I_DashBoard(),
    I_Liste_Entreprenants(),
    I_Liste_Entreprenants(),
    I_Liste_Entreprenants(),
    I_DashBoard(),
  ];

  List<BottomNavigationBarItem> itemsNavID = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Brouillons',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.transparent),
      label: 'Identification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.today),
      label: 'Rejetées',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Messagerie',
    ),
  ];

  late BuildContext ctx;
  CommonAppBar? gAppBar;
  var wErr = "";
  String gTitle = "";
  String gBody = "";

  requestWritePermission() async {
    DbTools.allowWriteFile = true;
  }

  void Menu_screenVoidCallback() {
    print("screenVoidCallback callback()");
    setState(() {

    });
  }

  void initLib() async {
    print("BottomNavigationList initLib >");
    var getLocation = await IntentChannel.getLocation();

    if (getLocation != null && getLocation.length > 0) {
      print("determinePosition NOT NULL ${getLocation}");
    } else {
      print("determinePosition NULL length ${getLocation!.length}");
    }
    print("BottomNavigationList initLib <");

    DbTools.gIsRememberLogin = await SharedPref.getBoolKey("IsRememberLogin", false);
    print("initLib DbTools.gIsRememberLogin " + DbTools.gIsRememberLogin.toString());


    DbTools.gCurrentModeStr = "Identificateur";
    print("initLib Identificateur");

    await DbTools.initSecteurDownMennu();
    await DbTools.initCountryDownMennu();

    setState(() {});
  }

  void RecStat() async {}

  void initState() {
    DbTools.Menu_screenVoidCallback =Menu_screenVoidCallback;

    initLib();
    super.initState();
    requestWritePermission();
    //RecStat();

//    WidgetsBinding.instance!.addObserver(this);
  }

  void onBackPress() {
    if (Navigator.of(ctx).canPop()) {
      Navigator.of(ctx).pop();
    }
  }

  @override
  void dispose() {
//    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
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
        child: Block_MenuApp(context));
  }

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  Widget Block_MenuApp(BuildContext context) {
    bool isTransf = DbTools.fEntreprenantaTransf || DbTools.fActivite_insTransf;

    print("∆∆∆∆∆∆∆∆∆ isTransf ${isTransf} ${DbTools.gCurrentIndex}");

    String title_string = itemsTitre[DbTools.gCurrentIndex];
    Widget wchildren = children[DbTools.gCurrentIndex];
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      endDrawer: I_SideDrawer(),

//      I_SideDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: AutoSizeText(
          title_string,
          maxLines: 1,
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: isTransf ? gColors.red : gColors.white),
              onPressed: () {
                setState(() {
                  _scaffoldState.currentState!.openEndDrawer();
                });
              },
            ),
          ),
        ],
        leading: IconButton(
          icon: Image.asset("assets/images/avatar.png"),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (_) => I_Identificateur()));
            });
          },
        ),
        backgroundColor: gColors.primary,
      ),
      body: wchildren,
      bottomNavigationBar: BottomAppBar(
        color: gColors.primary,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 5,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: gColors.secondary,
          currentIndex: DbTools.gCurrentIndex,
          onTap: (int index) {
            FocusScope.of(context).unfocus();
            setState(() {
              DbTools.gCurrentIndex = index;
            });
          },
          items: itemsNavID,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "bnl1",
        backgroundColor: gColors.primary,
        child: const Icon(Icons.people, color: gColors.secondary),
        onPressed: () {
          setState(() {
            FocusScope.of(context).unfocus();
            DbTools.gCurrentIndex = 2;
          });
//          Navigator.push(context, MaterialPageRoute(builder: (context) => Co_Plan()));
        },
      ),
    );
  }

  void AffMessage(RemoteMessage message) {
    print('AffMessage');

    if (message != null) {
      print('AffMessage ok');

      setState(() {
        DbTools.gCurrentIndex = 0;
      });

      RemoteNotification notification = message.notification!;
      String? title = notification.title;
      String? body = notification.body;

      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: Column(
                    //Slide3
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/AppIco.png'),
                        width: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          title!,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ]),
                content: Text(body!),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }
  }
}