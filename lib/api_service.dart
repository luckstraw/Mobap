import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> login(String email, String password) async {
    var url = Uri.parse("http://mobap.infinityfreeapp.com/server/login.php");
    try {
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["success"]) {
          return "Login Successful!";
        } else {
          return "Login Failed: ${data["message"]}";
        }
      } else {
        return "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}