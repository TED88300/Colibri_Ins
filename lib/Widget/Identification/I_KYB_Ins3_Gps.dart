import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Tools/intent_result.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins4_Carte.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins5_Name.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class I_KYB_Ins3_Gps extends StatefulWidget {
  @override
  I_KYB_nEState createState() => I_KYB_nEState();
}

class I_KYB_nEState extends State<I_KYB_Ins3_Gps> {
  TextEditingController Edt_Lat = new TextEditingController();
  TextEditingController Edt_Long = new TextEditingController();
  TextEditingController Edt_Acc = new TextEditingController();

//  double dLat = 48.858948913622804;
//  double dLng = 2.2945242153417604;

  double? dLat = 4.742813735998598;
  double? dLng = -6.63435163296897;
  double? dAcc = 0;

  MapController mapController = MapController();
  bool circularProgressIndicator = false;
  FocusNode? EmptyFocusNode;


  Image? Image_KYC = null;
  int pageEntr = 0;

  Future ReloadLocation() async {
    await IntentChannel.getLocation();

    debugPrint("getLocation lat: ${dLat}");
    debugPrint("getLocation long: ${dLng}");
    debugPrint("getLocation Acc: ${dAcc}");

    print("mapController move >");

    await mapController.move(LatLng(dLat!, dLng!), 16);
    print("mapController move <");

    setState(() {});
  }

  void initLib() async {
    await ReloadLocation();

    final decodedBytes = await base64Decode(DbTools.gImageBase64_PHOTO_ACT);
    debugPrint("image : C ${decodedBytes.length}");
    print("image >");
    Image_KYC = await Image.memory(decodedBytes);
    print("image < ${Image_KYC!.image.toString()}");
    }

  void initState() {
    pageEntr = DbTools.pageEntr;

    mapController = MapController();
    EmptyFocusNode = FocusNode();

    Edt_Lat.text = DbTools.gActivite_ins.partnerLatitude.toString();
    Edt_Long.text = DbTools.gActivite_ins.partnerLongitude.toString();
    Edt_Acc.text = DbTools.gActivite_ins.gpsPrecision.toString();

    print("DbTools.gActivite_ins.partnerLatitude ");
    print("DbTools.gActivite_ins.partnerLatitude ${DbTools.gActivite_ins.partnerLatitude!}");

    dLat = double.parse(DbTools.gActivite_ins.partnerLatitude!);
    dLng = double.parse(DbTools.gActivite_ins.partnerLongitude!);
    dAcc = double.parse(DbTools.gActivite_ins.gpsPrecision!);

    initLib();

    super.initState();





  }

  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print("Image_KYC != null ${Image_KYC != null}");

    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "GPS", pageEntr, DbTools.pagesEntr, "B3"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("Back");
              DbTools.pageEntr--;
              PushPop.PushPop_PopBack(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("I_Liste_ActivitesIns"));
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              ContribuableWidget(),
              Row(
                children: [
                  Container(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 150,
                      child: (Image_KYC == null)
                          ? Container()
                          : Image.memory(
                              base64Decode(DbTools.gImageBase64_PHOTO_ACT),
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                return Container();
                              },
                            ),
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          enabled: false,
                          controller: Edt_Lat,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              labelText: 'LATITUDE :',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        TextField(
                          maxLines: 1,
                          enabled: false,
                          controller: Edt_Long,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              labelText: 'LONGITUDE :',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        TextField(
                          maxLines: 1,
                          enabled: false,
                          controller: Edt_Acc,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              labelText: 'PRECISION :',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      height: 15,
                    ),
                    Center(
                        child: Stack(
                      children: <Widget>[
                        mapbuild(context),
                        Container(
                            height: 221,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/mark.png'),
                            ))
                      ],
                    )),
                  ])),
            ]),

        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
            child: ElevatedButton(
              onPressed: () async {
                DbTools.gActivite_ins.partnerLatitude = Edt_Lat.text;
                DbTools.gActivite_ins.partnerLongitude = Edt_Long.text;
                DbTools.gActivite_ins.gpsPrecision = Edt_Acc.text;
                DbTools.pageEntr++;
                PushPop.PushPop_Push(false);

                if (DbTools.isFORMEL)
                  Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins5_Name()));
                else
                  Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins4_Carte()));


//                Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins4_ODP()));
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                backgroundColor: gColors.primary,
                elevation: 4,
              ),
              child: Text(
                "Suivant",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        AutoSizeText(
          "Entreprenant : ${DbTools.gEntreprenant.nomPrenomDirigeant!.toUpperCase()}",
          maxLines: 1,
          style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
/*
            AutoSizeText(
              "Activité : ${DbTools.gActivite.activite_name}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            AutoSizeText(
              "${DbTools.gContribuable.contribuable_phone} / ${DbTools.gActivite.activite_tel}",
              style: TextStyle(
                  color: gColors.secondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
*/
        Container(height: 10),
        Container(height: 1, color: Colors.black)
      ]),
    );
  }

  Widget mapbuild(BuildContext context) {
    debugPrint("mapbuild nE lat: ${dLat}");
    debugPrint("mapbuild nE long: ${dLng}");

    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(dLat!, dLng!),


        child:  Container(
          key: Key('blue'),
          child: Image.asset('assets/images/mark.png'),
        ),



      ),
    ];

/*
    var wmsurl = 'http://carteprojets.bnetd.ci/geoserver/TEST_SP/wms',
        wmsAttrib = '&copy; <a href="http://bnetd.ci">BNETD/CIGN</a> datas',
        wms = L.tileLayer.wms(wmsurl, {layers: 'TEST_SP:SP',
          format: 'image/png',
          transparent: true,
          opacity: 1,
          tiled: true,
          attribution: wmsAttrib
        });
*/

    return new Container(
        height: 300,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: LatLng(dLat!, dLng!),
            zoom: 19.0,
            interactiveFlags: InteractiveFlag.pinchZoom,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),

/*
            TileLayerOptions(
              wmsOptions: WMSTileLayerOptions(
                baseUrl: 'http://carteprojets.bnetd.ci/geoserver/TEST_SP/wms/?',
                layers: ['TEST_SP:SP'],
              ),
              maxZoom: 50,
              backgroundColor: Colors.transparent,
            )
*/
            /*

            TileLayerOptions(
              urlTemplate:
              "https://snowmap.fast-sfc.com/base_snow_map/{z}/{x}/{y}.png",
              //change base_snow_map to pistes
              subdomains: ['a', 'b', 'c'],
            ),
            TileLayerOptions(
                urlTemplate:
                "https://snowmap.fast-sfc.com/pistes/{z}/{x}/{y}.png",
                //change base_snow_map to pistes
                subdomains: ['a', 'b', 'c'],
                backgroundColor: Colors.transparent),
                */

/*

            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),

            TileLayerOptions(
              wmsOptions: WMSTileLayerOptions(
                baseUrl: 'http://carteprojets.bnetd.ci/geoserver/TEST_SP/wms',
                layers: ['TEST_SP:SP'],
              ),
              maxZoom: 50,
              backgroundColor: Colors.transparent,
            )
*/

/*
  WMSTileLayerOptions({
    required this.baseUrl,
    this.layers = const [],
    this.styles = const [],
    this.format = 'image/png',
    this.version = '1.1.1',
    this.transparent = true,
    this.crs = const Epsg3857(),
    this.otherParameters = const {},
  })


http://carteprojets.bnetd.ci/geoserver/TEST_SP/wms
// &service=WMS
// &request=GetMap
// &layers=
// &styles=
// &format=image%2Fpng
// &srs=EPSG%3A3857
// &version=1.1.1
// &transparent=true
// &width=256
// &height=256
// &bbox=633510.0904275409,6166327.945821741,634121.5866538222,6166939.44204802


http://carteprojets.bnetd.ci/geoserver/TEST_SP/wms&service=WMS&request=GetMap&layers=&styles=&format=image%2Fpng&srs=EPSG%3A3857&version=1.1.1&transparent=true&width=256&height=256&bbox=633510.0904275409,6166327.945821741,634121.5866538222,6166939.44204802
*/

//        MarkerLayerOptions(markers: markers)
          ],
        ));
  }
}
