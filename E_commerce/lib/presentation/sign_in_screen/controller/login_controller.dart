

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  RxBool obsecure = true.obs;

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 7 &&
        value.contains(RegExp(r'[a-z]')) &&
        value.contains(RegExp(r'[A-Z]'));
  }

  void togglePasswordVisibility() {
    obsecure.value = !obsecure.value;
  }

  final password = ''.obs;

  String? ValidatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  final formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase conf
  final auth = FirebaseAuth.instance;

  void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        String uid = userCredential.user!.uid;

        // Store user data in Firebase Database
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'email': email,

          // Add more fields as needed
        });

        Fluttertoast.showToast(msg: "Login Successful");
        Get.toNamed(AppRoutes.Bottomnav);
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DocumentSnapshot userSnapshot =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userSnapshot.exists) {
      return userSnapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }


}