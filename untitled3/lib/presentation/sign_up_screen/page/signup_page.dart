import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/presentation/sign_in_screen/page/login_page.dart';
import 'package:untitled3/widgets/custom_button/button.dart';
import '../../../widgets/custom_divider/divider.dart';
import '../../../widgets/google&facebook/gg_fb.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Sign Up Your Account',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
            Image(image: AssetImage('assets/login.jpg'),fit: BoxFit.cover,),
           Button(text:Text('Sign Up',style: TextStyle(color: Colors.white),), ontap: () {
             print('Button Pressed');
             Get.to(LoginPage());
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
