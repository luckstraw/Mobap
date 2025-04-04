import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = "http://192.168.x.x/backend/server";

  static Future<Map<String, dynamic>> login(String email, String password) async {
    var response = await http.post(Uri.parse("$baseUrl/login.php"), body: {
      "email": email,
      "password": password,
    });
    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> signup(String username, String email, String password) async {
    var response = await http.post(Uri.parse("$baseUrl/signup.php"), body: {
      "username": username,
      "email": email,
      "password": password,
    });
    return json.decode(response.body);
  }
}
