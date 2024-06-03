import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled3/presentation/verification_screen/page/otp_page.dart';
import 'package:untitled3/routes/App_routes.dart';

import '../../../widgets/custom_button/button.dart';
import '../../../widgets/custom_divider/divider.dart';
import '../../../widgets/google&facebook/gg_fb.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Sign in Your Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage('assets/login.jpg'),fit: BoxFit.cover,),
            Button(text:Text('Sign in',style: TextStyle(color: Colors.white),), ontap: () {
              print('Button Pressed');
              Get.to(OtpPage());
             // Get.toNamed(AppRoutes.Login);
            },),

            SizedBox(height: 20,),
            CustomDivider(),
            SizedBox(height: 20,),

            GG_FB()
          ],
        ),
      ),
    );
  }
}
