import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

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
            TextFormField(
              controller: _loginController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _loginController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              controller: _loginController.referralCodeController,
              decoration: InputDecoration(labelText: 'Referral Code (Optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginController.login(),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => _loginController.register(),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}