import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpController extends GetxController {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text editing controllers
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Obscure password toggles
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // Password validation with error message
  String? validatePasswordWithErrorMessage(String value) {
    if (value.length < 7) {
      return 'Password must be at least 7 characters long';
    }
    if (!value.contains(RegExp(r'[a-z]')) || !value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain both uppercase and lowercase letters';
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Sign up method
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddressController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Post user details to Firestore
        await postDetailToFirestore(userCredential.user);

        Fluttertoast.showToast(msg: "Sign Up Successful");
        Get.offNamed('/textwithimage'); // Navigate to TextWithImagePage
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: 'The email address is already in use by another account.');
        } else if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(msg: 'The email address is not valid.');
        } else {
          Fluttertoast.showToast(msg: e.message ?? 'An unknown error occurred.');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: 'An error occurred. Please try again.');
      }
    }
  }

  // Post user details to Firestore
  Future<void> postDetailToFirestore(User? user) async {
    if (user == null) return;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    // Create user model
    UserModel userModel = UserModel(
      emailAddress: user.email,
      uid: user.uid,
      userName: userNameController.text,
    );

    // Save to Firestore
    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

class UserModel {
  String? uid;
  String? emailAddress;
  String? userName;

  UserModel({this.uid, this.emailAddress, this.userName});

  // Convert UserModel to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'emailAddress': emailAddress,
      'userName': userName,
    };
  }
}
