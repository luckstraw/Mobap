import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.1.19/backend3/server'; // Update with your backend URL

  // Login user
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'status': 'error', 'message': 'Server error'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Connection error'};
    }
  }

  // Register user
  Future<Map<String, dynamic>> registerUser(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'status': 'error', 'message': 'Server error'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Connection error'};
    }
  }

  // Get all users
  Future<List<dynamic>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/get_users.php'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // Update user
  Future<Map<String, dynamic>> updateUser(int userId, Map<String, dynamic> userData) async {
    try {
      final response = await http.post( // Changed from put to post since PHP doesn't handle PUT well
        Uri.parse('$baseUrl/update_user.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': userId,
          'username': userData['username'],
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'status': 'error', 'message': 'Server error'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Connection error'};
    }
  }

  // Delete user
  Future<Map<String, dynamic>> deleteUser(int userId) async {
    try {
      final response = await http.post( // Changed from delete to post since PHP doesn't handle DELETE well
        Uri.parse('$baseUrl/delete_user.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': userId}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'status': 'error', 'message': 'Server error'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Connection error'};
    }
  }
}
