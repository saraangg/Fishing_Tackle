import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void setUsername(String value) => username.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
        body: {
          'username': username.value,
          'password': password.value,
        },
      );

      print('Response Body: ${response.body}'); // Print response body

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = json.decode(response.body);
        final String? accessToken = data?['access_token'];
        if (accessToken != null) {
          // Store the token in shared preferences
          await storeToken(accessToken);
          print('Token stored: $accessToken');

          // Navigate to the next screen passing the accessToken
          Get.off(HomeScreen(accessToken));
        } else {
          throw Exception('Access token is null');
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error logging in: $e');
    }
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
  }

  Future<String?> retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: loginController.setUsername,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: loginController.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginController.login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String accessToken;

  HomeScreen(this.accessToken);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Access Token: $accessToken'),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginScreen(),
  ));
}
