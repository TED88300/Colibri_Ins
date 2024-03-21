
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:flutter/material.dart';


class I_Identificateur extends StatefulWidget {

  @override
  I_IdentificateurState createState() => I_IdentificateurState();
}

class I_IdentificateurState extends State<I_Identificateur> {


  void initState() {
    super.initState();

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
            appBar: AppBar(
              title: Text("Identificateur"),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(height: 20,),
                  Image.asset('assets/images/avatar.png'
                    ,width: 100,
                    height: 100,),
                Text("${DbOdoo.res_UserName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),

                    Container(height: 10,),

                    Text("Cluster ${DbOdoo.Ilots[0].clusterName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("Région ${DbOdoo.Ilots[0].regionName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("Département ${DbOdoo.Ilots[0].departementName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("Sous-Préfecture ${DbOdoo.Ilots[0].sousPrefectureName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Container(height: 20,),
                    Text("Commune ${DbOdoo.Ilots[0].communeName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("Localité ${DbOdoo.Ilots[0].localiteName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Container(height: 20,),
                    Text("ZD ${DbOdoo.res_Userzonerecensement_id}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("ZD ${DbOdoo.Ilots[0].zoneRecensementName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Text("Quartier ${DbOdoo.Ilots[0].quartierName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Container(height: 20,),
                    Text("Ilot ${DbOdoo.Ilots[0].ilotName}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                    Container(height: 20,),
                    Text("Ilot id ${DbOdoo.res_Userilot_id}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                  ]),
            )));
  }



}