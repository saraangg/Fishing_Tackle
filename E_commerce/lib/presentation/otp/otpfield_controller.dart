import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../routes/App_routes.dart';

class OtpfieldController extends GetxController {
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool otpVisibility = false.obs;
  Rxn<User> user = Rxn<User>();
  late String verificationID;
  RxBool obsecure = true.obs;

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: otpController.text,
    );

    await auth.signInWithCredential(credential).then((value) {
      user.value = FirebaseAuth.instance.currentUser;
    }).whenComplete(() {
      if (user.value != null) {
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.toNamed(AppRoutes.Bottomnav);
      } else {
        Fluttertoast.showToast(
          msg: "your login is failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }
}