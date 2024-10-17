import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CommonAppBar {



  static Widget getPrimaryAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: gColors.primary,


      title: Text(title,),
      leading: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showToastClicked(context, "Seach");
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {Navigator.pop(context);},
        ),
      ],

    );
  }


  static Widget getEmptyAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: gColors.primary,
      title: Text(title, style: TextStyle(color: gColors.secondary),),
      automaticallyImplyLeading: false,
    );
  }

  static Widget getEmptyAppbarCountDown(BuildContext context, String title, String J){
    return AppBar(
      backgroundColor: gColors.primary,
      title: Text(title, style: TextStyle(color: gColors.secondary),),
      automaticallyImplyLeading: false,
      leading:
          Padding(
              padding: EdgeInsets.fromLTRB(5, 17, 0, 0),
          child:
            Text(J, style: TextStyle(fontSize: 20, color: Colors.white),),
    ));
  }



  static Widget getEmptyAppbarSmall(BuildContext context, String title){
    return AppBar(
      backgroundColor: gColors.primary,
      title: Text(title, style: TextStyle(fontSize: 22, color: gColors.secondary),),
      automaticallyImplyLeading: false,
    );
  }

  static Widget getEmptyAppbar3L(BuildContext context, String title){
    return AppBar(
      backgroundColor: gColors.secondary,
      title: Text(title, style: TextStyle(color: gColors.secondary),),
      automaticallyImplyLeading: false,
    );
  }


  static Widget getPrimarySettingAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: gColors.primary,
        title: Text(title,),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Seach");
            },
          ),// overflow menu
          PopupMenuButton<String>(
            onSelected: (String value){
              showToastClicked(context, value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Settings", child: Text("Settings"),
              ),
            ],
          )
        ]
    );
  }

  static Widget getPrimaryBackAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: gColors.primary,
      title: AutoSizeText(title,
        maxLines: 1,
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  static Widget getPrimaryBackSearchAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: gColors.primary,
        title: Text(title,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Seach");
            },
          ),
        ]
    );
  }

  static Widget TitleEcr(String Grp, String title, int Page, int Pages, String Tag){
    String wPages = "";
//    if (Page >0 && Pages > 0 ) wPages ="$Page / $Pages";

    return Row(
      children: [
        Text("$Grp: $title",style: gColors.TitreText,),
        Spacer(),
        Text("$wPages [$Tag]",style: gColors.TitreText2,),
      ],
    );
  }



  static void showToastClicked(BuildContext context, String action){
    print(action);
//    Toast.show(action+" clicked", context);
  }
}
