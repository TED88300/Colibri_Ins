
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/intent_result.dart';
import 'package:intl/intl.dart';

class Tools_Print {

  static Future Print_Identif() async {

    List<String> wTxt =[];
    List<String> Size =[];
    List<String> Align =[];
    List<String> Density =[];


    wTxt.add('\n\n\n');
    Size.add('L');
    Align.add('C');
    Density.add('N');


    wTxt.add("REPUBLIQUE DE COTE D'IVOIRE\n--------\nMINISTERE DU COMMERCE,\nDE L'INDUSTRIE\nET DE LA PROMOTION DES PME\n-------\nENROLEMENT DES ENTREPRENANTS\nDE SAN PEDRO\n-------\n");
    Size.add('M');
    Align.add('C');
    Density.add('B');

    wTxt.add('DATE ENROLEMENT: 05/10/2022\n'
        'HEURE ENROLEMENT: 10:22\n'
        'ID ENTREPRENANT: 23443322\n'
        'NOM:\nOUOLOGUEM AHMADOU\n'
        'TELEPHONE: 07 22 34 555\n'
        'ID ACTIVITE: 4423\n'
        'ACTIVITE:\nVdi Agence Immobilière\n'
        'ZONE: AXE BABA\n\n');
    Size.add('M');
    Align.add('L');
    Density.add('N');

    wTxt.add('**Le ministère du commerce\nvous remercie**\n\n\n');
    Size.add('M');
    Align.add('C');
    Density.add('N');

    wTxt.add('\n\n\n');
    Size.add('L');
    Align.add('C');
    Density.add('N');


//    await IntentChannel.PrinterON();

    for( int i = 0; i < wTxt.length; i++) {
      await IntentChannel.Print(wTxt[i],Size[i],Align[i],Density[i]);


    };

//    await IntentChannel.PrinterOFF();


  }

  static Future Print_Identif_Real() async {

    List<String> wTxt =[];
    List<String> Size =[];
    List<String> Align =[];
    List<String> Density =[];


    wTxt.add('\n\n');
    Size.add('L');
    Align.add('C');
    Density.add('B');

    wTxt.add("Vous avez ete enrole\navec succes!\n\n".toUpperCase());
    Size.add('M');
    Align.add('C');
    Density.add('B');



    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);

    var formatterTime = new DateFormat('hh:mm');
    String formattedTime = formatterTime.format(now);


    wTxt.add('Date Enrolement: ${formattedDate}\n'
        'Heure Enrolement: ${formattedTime}\n'
        'Nom et Prenom:\n${DbTools.gEntreprenant.nomPrenomDirigeant}\n'
        'Telephone: ${DbTools.gEntreprenant.telephoneDirigeant}\n'
        'Ville Habitation:\n${DbTools.gEntreprenant.adresseDirigeant}\n\n'
        'Activite:\n${DbTools.gActivite_ins.name}\n'
        'Telephone Activite:\n${DbTools.gActivite_ins.telephoneFixe1Entreprise}\n'
        'Ville Activite:\n${DbTools.gActivite_ins.city}\n\n');
    Size.add('M');
    Align.add('L');
    Density.add('N');
    wTxt.add(
        "Le ministere du commerce,\n"
            "de l'industrie\n"
            "vous remercie!\n\n\n");

    Size.add('M');
    Align.add('C');
    Density.add('B');

    Size.add('M');
    Align.add('C');
    Density.add('N');

    wTxt.add('\n\n\n');
    Size.add('L');
    Align.add('C');
    Density.add('N');

//    await IntentChannel.PrinterON();

    for( int i = 0; i < wTxt.length; i++) {
      await IntentChannel.Print(wTxt[i],Size[i],Align[i],Density[i]);


    };

//    await IntentChannel.PrinterOFF();


  }

}