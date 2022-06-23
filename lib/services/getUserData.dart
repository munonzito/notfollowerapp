import 'package:http/http.dart' as http;
import 'dart:convert';

Future getUserData(String username, String pw) async {
  final response = await http.post(
      Uri.parse("https://unfollowapi.herokuapp.com/getUserData/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'username': username, 'pw': pw}));

  return jsonDecode(response.body);
}
