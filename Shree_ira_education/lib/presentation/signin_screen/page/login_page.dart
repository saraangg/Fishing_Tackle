import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_ira_education/presentation/signin_screen/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SHREE',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'IRA',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Text(
            'EDUCATION',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              controller: loginController.emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Transparent border on focus
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Email address',
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Obx(
                  () => TextFormField(
                controller: loginController.passwordController,
                obscureText: loginController.obscureText.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  labelText: 'Password*',
                  suffixIcon: GestureDetector(
                    onTap: loginController.toggleObscureText,
                    child: Icon(
                      loginController.obscureText.value ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 50),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: loginController.login,
            child: Text('Sign In', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
