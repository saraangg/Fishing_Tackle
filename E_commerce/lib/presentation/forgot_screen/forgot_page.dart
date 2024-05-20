import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/core/utils/heading.dart';
import 'package:e_commerce/presentation/forgot_screen/controller/forgot_controller.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:e_commerce/widgets/app_bar/appbar.dart';
import 'package:e_commerce/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/button.dart';

class ForgotPage extends StatelessWidget {
  final ForgotController forgotController = Get.put(ForgotController());

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
            child: Text("Please, enter your email address. You will receive a link to create a new password via email."),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
                  () => Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(5),
                child: Textfield(
                  controller: forgotController.emailController,
                  valid: AutovalidateMode.onUserInteraction,
                  validator: (value) => forgotController. Validateemail(value!),

                  suffix:forgotController.isEmailValid.isTrue ?
                  GestureDetector(
                    onTap: () {
                      forgotController.emailController.clear();
                      forgotController.clearEmail();
                    },
                    child: Icon(Icons.close, color: Colors.green),
                  )
                      : null,
                  lbtxt: 'Email',
                  fcsclr: Colors.black,
                  bdrds: 10,
                  isValid: forgotController.isEmailValid.value, obsecuretext: false,
                  onchange: (value) {
                    forgotController.validateEmail(value);
                  },

                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Button(text:Text('SEND'), ontap: () {Get.toNamed(AppRoutes.Otp);},),
        ]
      ),
    );
  }
}
