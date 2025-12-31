import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khata_app/models/user.dart';

class UserController {

  // Signup
  Future<http.Response> Signup(UserAccount user) async {
    String baseurl = "https://192.168.18.56/api/";

    final response = await http.post(
      Uri.parse("${baseurl}user/Signup"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(user.toJson()), 
    );

    return response;
  }
}
