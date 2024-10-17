import 'package:http/http.dart' as http;
import 'dart:convert';

class API_Data {

  static final Url = "https://cloud.id30.ci/api/v1/user_p32/file";


  static Future Colibri_Send(String category, int id, String type, String file_type, String content) async {

    return;

    var headers = {
      'Signature': 'dXNlcl9wMzI6Y2tyM2I5cmkwbWNjMTI5cjFjc2c6ZmEwY2E1ODFmZGM3NDg5NWI4OTM4YjA0ZWM3ZmM1MmE=',
      'ApiKey': 'fa0ca581fdc74895b8938b04ec7fc52a',
      'CloudSecret': 'ckr3b9ri0mcc129r1csg',
    };

    var request = http.MultipartRequest('POST', Uri.parse(Url));

    request.headers.addAll(headers);

    request.fields.addAll({
      'category': '$category',
      'id': '$id',
      'type': '$type',
      'file_type': '$file_type',
      'content': '$content',
    });

    print("Colibri_Send headers ${category} ${id} ${type} ${file_type} ");
    http.StreamedResponse response = await request.send();
    print("Colibri_Send response ${response.statusCode}");
    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      print("Colibri_Send parsedJson ${parsedJson.toString()}");

    } else {
      print(response.reasonPhrase);
    }
//    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MywidXNlcm5hbWUiOiJBUFBfSVRDIiwicGFzc3dvcmRfaGFzaCI6IiQyYiQxMiQyYWgwcUJFZVBCQkhDNmxZSjVELzhlTi5meDIvOEpiSlUvTnRIZ2hkTllQYXUyL00wbTNGUyJ9.e9WMmCBDuwNjpI4gtby6ls3ri3FttgeXf4Obo7oFCx8
  }


}
