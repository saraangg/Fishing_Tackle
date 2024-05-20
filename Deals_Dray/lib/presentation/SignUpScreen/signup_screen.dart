import 'package:deals_dray/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.SplashScreen);
          },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: _signUpController.formKey,
            child: Column(
              children: [
                Image(image:AssetImage("assets/dray3.png"),width: 180,height: 180,),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right:190),
                  child: Text('Lets Begin!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 85),
                  child: Text("Please enter your credentials to proceed"),
                ),
                SizedBox(height: 40,),
                Obx(() => TextFormField(
                  controller: _signUpController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    errorText: _signUpController.isEmailValid.value
                        ? null
                    :_signUpController.emailController.text.isEmpty
                    ?null
                        : 'Please enter a valid Gmail address',
                  ),
                  onChanged: (value) {
                    _signUpController.validateEmail(value);
                  },
                )),


                Obx(() => TextFormField(
                  controller: _signUpController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    errorText: _signUpController.passwordController.text.isEmpty
                        ? null
                        : _signUpController.isPasswordValid.value
                        ? null
                        : 'Password must contain at least 8 characters with uppercase, lowercase, and a number.',
                    suffixIcon: IconButton(
                      icon: Icon(_signUpController.obscurePassword.value ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        _signUpController.togglePasswordVisibility();
                      },
                    ),
                  ),
                  obscureText: _signUpController.obscurePassword.value,
                  onChanged: (value) {
                    _signUpController.validatePassword(value);
                  },
                )),


                TextFormField(
                  controller: _signUpController.referralCodeController,
                  decoration: InputDecoration(labelText: 'Referral Code (Optional)'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Get.toNamed(AppRoutes.PhoneNumber);
        },
        child: Icon(Icons.arrow_forward,color: Colors.white,),
      ),
    );
  }
}
