import 'package:e_commerce/routes/App_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'otpfield.dart';

class OtpController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool otpVisibility = false.obs;
  Rxn<User> user = Rxn<User>();
  late String verificationID;
  RxBool obsecure = true.obs;


  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber:  "+91${phoneController.text}",

      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility.value = true;
        verificationID = verificationId;
        Get.to(Otpfield(verificationid: verificationID,));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    print("+++++++++++++++++++++++++++++++++");
    print(phoneController.text);
  }

}
