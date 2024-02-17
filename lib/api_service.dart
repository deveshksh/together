import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Map<String, dynamic>>> fetchDiscoveryData(int page, int limit) async {
    final response = await http.get(Uri.parse('https://api-stg.together.buzz/mocks/discovery?page=$page&limit=$limit'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonData['data']);
    } else {
      throw Exception('Failed to load discovery data');
    }
  }
}
