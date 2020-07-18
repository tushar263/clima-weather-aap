import 'dart:convert';
import 'package:http/http.dart';

class Networkhelper {

  Networkhelper(this.url);

  final String url;

  Future getdata() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
