import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/user_model/user_model.dart';

class SignupController extends GetxController {
  var isNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  RxBool obsecure = true.obs;

  void validateName(String value) {
    isNameValid.value = value.isNotEmpty;
  }

  void validateEmail(String value) {
    isEmailValid.value = value.endsWith('@gmail.com');
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
    if (value.length < 7) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();

  // Firebase
  final auth = FirebaseAuth.instance;

  // Editing controllers
  final userNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Post user details to Firestore
        await postDetailToFirestore(userCredential.user);

        Fluttertoast.showToast(msg: "Sign Up Successful");
        Get.toNamed(AppRoutes.Bottomnav);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  Future<void> postDetailToFirestore(User? user) async {
    // Check if user is null (just to be safe)
    if (user == null) {
      return;
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();

    // Writing all the values
    userModel.emailAddress = user.email;
    userModel.uid = user.uid;
    userModel.userName = userNameController.text;
    userModel.password = passwordController.text;

    // Creating a new collection in Firestore
    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
  }
}
