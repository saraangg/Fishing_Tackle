import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiClient {
  final String apiKey;
  final String baseUrl;

  GeminiClient({required this.apiKey, this.baseUrl = 'https://api.gemini.example.com'});

  Future<String> predict(String input) async {
    final url = Uri.parse('$baseUrl/predict');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({'input': input}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'] ?? 'No response';
    } else {
      throw Exception('Failed to get prediction');
    }
  }
}
