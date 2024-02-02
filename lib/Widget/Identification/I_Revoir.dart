import 'package:auto_size_text/auto_size_text.dart';
import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class I_Revoir extends StatefulWidget {
  @override
  I_RevoirState createState() => I_RevoirState();
}

class I_RevoirState extends State<I_Revoir> {
  String searchText = "";

  TextEditingController Filtre_Nom = new TextEditingController();
  TextEditingController Search = new TextEditingController();

  String? _currentPrdFam = "";


  void Reload() async {

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
          body: Container(
              color: Colors.transparent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchWidget(),


                  ]))),
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
                        if (wSearchText.length > 2) {
                          print("Search $wSearchText");
                          setState(() {
                            searchText = wSearchText;
                          });
                        } else if (searchText != "") {
                          setState(() {
                            searchText = "";
                          });
                        }
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
                  new Container(
//                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new IconButton(
                        icon: new Icon(
                          Icons.filter_alt,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () async {
                          Filtre_Nom.text = Search.text;
                          await _openPopup(context);
                        }),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: Colors.black)
          ]),
    );
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

  _openPopup(context) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  'Filtres',
                  style: TextStyle(color: gColors.white),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: gColors.TextColor1,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: Form(
                  key: _formKey,
                  child: Container(
                      width: 600,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            maxLines: 1,
                            controller: Filtre_Nom,
                            decoration: InputDecoration(
                              labelText: 'Nom',
                            ),
                          ),
                          Container(
                            width: 15,
                          ),

                          Row(children: [
                            Text("Type: "),
                            Container(width: 15,),                            DropdownButton(
                              value: _currentPrdFam!.isNotEmpty
                                  ? _currentPrdFam
                                  : null,
                              items: DbTools.TypeDownMenu,
                              onChanged: (String? wFam) {
                                setState(() {
                                  _currentPrdFam = wFam;
                                });
                              },
                            ),
                          ],)
                        ],
                      ))),
              actions: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      InkWell(
                        child: Text(
                          'ANNULER',
                          style: TextStyle(color: gColors.secondary),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      Spacer(),
                      InkWell(
                        child: Text(
                          'FILTRER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: gColors.primary),
                        ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                      Spacer()
                    ]),
              ],
            );
          });
        });
  }
}
