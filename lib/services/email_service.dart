import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String _serviceId = 'service_wg1l4kc';
  static const String _templateId = 'template_0y6p7k9';
  static const String _userId = 'uQ_5JziBcOJSD8dXs';

  Future<bool> sendEmailNotification({
    required String name,
    required String email,
    required String date,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _userId,
          'template_params': {
            'to_name': name,
            'to_email': email,
            'appointment_date': date,
          }
        }),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
} 