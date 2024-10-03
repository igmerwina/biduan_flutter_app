import 'dart:convert';
import 'package:doctor_booking_app/model/register_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String baseUrl;

  UserRepository({required this.baseUrl});

  Future<bool> registerUser(RegisterModel registerModel) async {
    final url = Uri.parse('$baseUrl/register'); // Change to your actual endpoint

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(registerModel.toJson()),
      );

      if (response.statusCode == 201) {
        // Assuming a 201 status code indicates success
        return true;
      } else {
        // Handle error response
        print('Failed to register user: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}