import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled3/presentation/splash_screen/page/splash_page.dart';
import '../../../widgets/custom_button/button.dart';
import '../../../widgets/custom_divider/divider.dart';
import '../../../widgets/google&facebook/gg_fb.dart';
import '../../sign_in_screen/page/login_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          'Verification',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:50,top: 40,left: 60,right: 60),
              child: Image(image: AssetImage('assets/OTP.png'),),
            ),
            Text('Enter Your Verification Code',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.grey),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Pinput(mainAxisAlignment: MainAxisAlignment.spaceBetween,),
            ),
            Text("if you don't receive a code.",style: TextStyle(color: Colors.grey),),
            Text('Resend?',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Button(text:Text('Send',style: TextStyle(color: Colors.white),), ontap: () {
              print('Button Pressed');
              Get.to(SplashPage());
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
