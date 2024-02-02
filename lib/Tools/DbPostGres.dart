import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/widgetTools/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class DbPostGres {



//  static var connection = PostgreSQLConnection("51.255.70.124", 5432, "innoving_id30_national_db_v3", username: "id30", password: "azertyuiopP#554");
  static var connection = PostgreSQLConnection("51.255.70.124", 8076, "id30_v2", username: "id30", password: "azertyuiopP#554");

  static List<List<dynamic>> results_mail_messages = [];
  static List<List<dynamic>> results_mail_contacts = [];



}
