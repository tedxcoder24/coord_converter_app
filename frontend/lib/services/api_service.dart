import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final String? _baseUrl = dotenv.env['API_BASE_URL'];

  static Future<bool> saveCoordinates(double lat, double lng) async {
    final url = Uri.parse('$_baseUrl/coords');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'lat': lat,
          'lng': lng,
          'notes': 'Saved from Flutter app',
        }),
      );

      return response.statusCode == 201;
    } catch (e) {
      print('Error saving coordinates: $e');
      return false;
    }
  }
}
