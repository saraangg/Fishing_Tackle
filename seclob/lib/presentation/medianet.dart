import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_screen/models/model.dart';

class MediaService {
  static var client = http.Client();

  static Future<List<Media>?> fetchMedia() async {
    var response = await client.get(
      Uri.parse('https://rubidya.com/api/users/get-media'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I',
      },
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return mediaFromJson(jsonString); // Call the utility function here
    } else {
      // Handle error or return empty list
      return [];
    }
  }
}

List<Media> mediaFromJson(String str) =>
    List<Media>.from(json.decode(str).map((x) => Media.fromJson(x)));