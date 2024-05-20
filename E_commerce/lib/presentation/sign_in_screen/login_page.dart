import 'package:e_commerce/core/constants/image_constants.dart';
import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/core/utils/heading.dart';
import 'package:e_commerce/presentation/sign_in_screen/controller/login_controller.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:e_commerce/widgets/app_bar/appbar.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:e_commerce/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
          child: Column(
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
                      txt: 'Login',
                      clr: Colors.black,
                      fntwei: FontWeight.bold,
                      size: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                      () => Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    child: Textfield(
                      controller: loginController.emailController,
                      suffix:loginController.isEmailValid.isTrue ?
                      Icon(Icons.check,color: Colors.green,):null,
                      lbtxt: 'Email',
                      fcsclr: Colors.black,
                      bdrds: 10,
                      isValid: loginController.isEmailValid.value, obsecuretext: false,
                      onchange: (value) {
                        loginController.validateEmail(value);
                      }, validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      //reg exression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@gmail.com").hasMatch(value)) {
                        return ("Please Enter valid Email");
                      }
                      return null;
                    },
                      on_saveds: (value) {
                        loginController.emailController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Obx(
                      () =>  Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    child: Textfield(
                      controller: loginController.passwordController,
                      valid: AutovalidateMode.onUserInteraction,
                      validator: (value) => loginController.ValidatePassword(value!),

                      onchange: (value) {
                        loginController.validatePassword(value);
                      },
                      lbtxt: 'Password',
                      suffix: GestureDetector(
                        onTap: () {
                          loginController.obsecure.value =
                          ! loginController.obsecure.value;
                        },
                        child: Icon(
                          loginController.obsecure.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                          color: Colors.green,
                        ),
                      ),
                      fcsclr: Colors.blue,
                      bdrds: 10,
                      obsecuretext: loginController.obsecure.value,
                      isValid: loginController.isPasswordValid.value,
                      on_saveds: (value) {
                        loginController.passwordController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(onTap: () {
                      Get.toNamed(AppRoutes.Otp);
                    },
                        child: Text('Forgot Your Password? ')),
                    Image(image:AssetImage(ImageConstants.arrow))
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Button(text:Text('LOGIN'), ontap: () {
                loginController.signIn(loginController.emailController.text,loginController.passwordController.text);
              },),
              SizedBox(height: 20.h,),
              Text("Or sign up with social account"),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius: 2,spreadRadius: 2)],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image(image: AssetImage(ImageConstants.google)),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Container(
                    height: 60.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius: 2,spreadRadius: 2,)],
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image(image: AssetImage(ImageConstants.facebook)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}