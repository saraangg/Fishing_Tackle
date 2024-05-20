import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/heading.dart';
import '../../routes/App_routes.dart';
import '../../widgets/app_bar/appbar.dart';
import '../../widgets/button.dart';
import 'otpfield_controller.dart';

class Otpfield extends StatelessWidget {
   final String verificationid;
  final OtpfieldController otpfieldController = Get.put(OtpfieldController());

  Otpfield({super.key,required this.verificationid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              title: '',
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image(image: AssetImage("assets/2.png"))),
              action: null,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
              child: Row(
                children: [
                  HeadWidget(
                    txt: 'Enter OTP',
                    clr: Colors.black,
                    fntwei: FontWeight.bold,
                    size: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Pinput(
                keyboardType: TextInputType.number,
                controller:otpfieldController.otpController ,length: 6,
              )
            ),
            SizedBox(height: 30,),
            Button(
              ontap: () async {

                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                      verificationId: verificationid,
                      smsCode:
                      otpfieldController.otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Get.toNamed(AppRoutes.Bottomnav);
                  });
                } catch (ex) {
                  log(ex.toString());
                } // Call loginWithPhone from otpController

              },
              text: Text(
                "VERIFY" , // Use value property for RxBool
              ),
            ),
          ],
        ),
      ),
    );
  }
}
