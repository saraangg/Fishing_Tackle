import 'package:e_commerce/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/heading.dart';
import '../../widgets/app_bar/appbar.dart';
import '../../widgets/button.dart';
import 'otp_controller.dart';

class OtpPage extends StatelessWidget {
  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  txt: 'Forgot Password',
                  clr: Colors.black,
                  fntwei: FontWeight.bold,
                  size: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Please, enter your Phone number. You will receive an OTP for login via SMS."),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textfield(keytype: TextInputType.number,
                  controller: otpController.phoneController,
                  bdrds: 10,
                  isValid: false,
                  obsecuretext:false,
                  hint: 'Phone number',
                  pref: '+91',
                  lbtxt: 'Phone number',
                ),

                SizedBox(
                  height: 30.h,
                ),
                Button(
                  ontap: () {

                      otpController.loginWithPhone(); // Call loginWithPhone from otpController

                  },
                  text: Text(
                    otpController.otpVisibility.value ? "VERIFY" :"SEND OTP", // Use value property for RxBool
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
