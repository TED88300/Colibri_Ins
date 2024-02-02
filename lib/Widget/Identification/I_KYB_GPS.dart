import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/intent_result.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class I_KYB_GPS extends StatefulWidget {
  @override
  I_KYB_GPSState createState() => I_KYB_GPSState();
}

class I_KYB_GPSState extends State<I_KYB_GPS> {
  TextEditingController Edt_Lat = new TextEditingController();
  TextEditingController Edt_Long = new TextEditingController();

  double dLat = 48.858948913622804;
  double dLng = 2.2945242153417604;

  MapController mapController = MapController();
  bool circularProgressIndicator = false;
  FocusNode? EmptyFocusNode;

  int pageEntr = 0;



  Future ReloadLocation() async {
    await IntentChannel.getLocation();

    debugPrint("getLocation lat: ${dLat}");
    debugPrint("getLocation long: ${dLng}");

    print("mapController move >");

//    await mapController.move(LatLng(dLat, dLng), 16);
    print("mapController move <");

    setState(() {});
  }

  void initLib() async {
    await ReloadLocation();


  }

  void initState() {
    pageEntr = DbTools.pageEntr;
    mapController = MapController();
    EmptyFocusNode = FocusNode();
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


    return  WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Activité / GPS"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("leading");
              PushPop.PushPop_PopBack(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  PushPop.PushPop_Pop(context);
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

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
                                    child:
                                        Image.asset('assets/images/mark.png'),
                                  ))
                            ],
                          )),
                        ])),
              ]),
        ),


      ),
    ));
  }



  Widget mapbuild(BuildContext context) {
    debugPrint("mapbuild GPS lat: ${dLat}");
    debugPrint("mapbuild GPS long: ${dLng}");

    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(dLat, dLng),
        builder: (ctx) => Container(
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
            center: LatLng(dLat, dLng),
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
