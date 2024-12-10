import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'home_screen/models/model.dart';


class MediaController extends GetxController {
  var mediaList = <Media>[].obs;
  var isLoading = true.obs;
  final String apiUrl = 'https://rubidya.com/api/users/get-media';
  final String bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I';

  @override
  void onInit() {
    fetchMedia();
    super.onInit();
  }

  void fetchMedia() async {
    try {
      isLoading(true);
      final headers = {
        'Authorization': 'Bearer $bearerToken',
      };

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['media'];
        mediaList.value = jsonResponse.map((media) => Media.fromJson(media)).toList();
      } else {
        print('Failed to load media. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load media');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load media');
    } finally {
      isLoading(false);
    }
  }
}