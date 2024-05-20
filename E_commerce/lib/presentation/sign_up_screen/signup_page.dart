import 'package:e_commerce/core/constants/image_constants.dart';
import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/core/utils/heading.dart';
import 'package:e_commerce/presentation/sign_in_screen/login_page.dart';
import 'package:e_commerce/presentation/sign_up_screen/controller/signup_controller.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:e_commerce/widgets/app_bar/appbar.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:e_commerce/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupController.formKey,
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
                      txt: 'Sign up',
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
                      controller: signupController.userNameController,
                      suffix:signupController.isNameValid.isTrue ?
                      Icon(Icons.check,color: Colors.green,):null,
                      lbtxt: 'Name',
                      fcsclr: Colors.black,
                      bdrds: 10,
                      isValid: signupController.isNameValid.value, obsecuretext: false,
                      onchange: (value) {
                        signupController.validateName(value);
                      },  validator: (value) {
                      RegExp regex = new RegExp(r'^.{3,}$'); //entering minimum value 3
                      if (value!.isEmpty) {
                        return ("User Name Is Required");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid User Name (Min. 3 Characters)");
                      }
                      return null;
                    },
                      on_saveds: (value) {
                        signupController.userNameController.text = value!;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                      () => Material(
                        elevation: 0,
                        borderRadius: BorderRadius.circular(5),
                        child: Textfield(
                          controller: signupController.emailAddressController,
                          suffix:signupController.isEmailValid.isTrue ?
                          Icon(Icons.check,color: Colors.green,):null,
                    lbtxt: 'Email',
                    fcsclr: Colors.black,
                    bdrds: 10,
                    isValid: signupController.isEmailValid.value, obsecuretext: false,
                    onchange: (value) {
                        signupController.validateEmail(value);
                    },  validator: (value) {
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
                            signupController.emailAddressController.text = value!;
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
                          controller: signupController.passwordController,
                          valid: AutovalidateMode.onUserInteraction,


                          onchange: (value) {
                            signupController.validatePassword(value);
                          },
                          lbtxt: 'Password',
                          suffix: GestureDetector(
                            onTap: () {
                              signupController.obsecure.value =
                              ! signupController.obsecure.value;
                            },
                            child: Icon(
                              signupController.obsecure.value
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                              color: Colors.green,
                            ),
                          ),
                          fcsclr: Colors.blue,
                          bdrds: 10,
                          obsecuretext: signupController.obsecure.value,
                          isValid: signupController.isPasswordValid.value,
                           // validator: (value) {
                           //   if (signupController.confirmPasswordController.text != signupController.passwordController.text) {
                           //    return "Password Don't Match";
                           //  }
                           //   return null;},
                          on_saveds: (value) {
                            signupController.confirmPasswordController.text = value!;
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
                      Get.toNamed(AppRoutes.Login);
                    },
                        child: Text('Already have an account? ')),
                    Image(image:AssetImage(ImageConstants.arrow))
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Button(text:Text('SIGN UP'), ontap: () {
                signupController.signUp(signupController.emailAddressController.text, signupController.passwordController.text);
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
                        boxShadow: [BoxShadow(color: Colors.grey.shade200,blurRadius: 2,spreadRadius: 2)],
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