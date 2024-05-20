import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Get package if you're using Get for navigation

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController phoneController = TextEditingController();

  Future<void> verifyPhoneNumber() async {
    String phoneNumber = "+91${phoneController.text.trim()}";
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // This callback will be invoked if verification is completed automatically (e.g., on Android devices)
          signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException ex) {
          // Handle verification failure
          print(ex.message);
          print(
              "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to OTP screen when code is sent
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId: verificationId),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
        },
      );
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigate to next screen upon successful sign-in
      // Get.toNamed(AppRoutes.BottomNav); // Replace AppRoutes.BottomNav with your route
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyPhoneNumber,
                child: Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpScreen extends StatelessWidget {
  final String verificationId;

  OtpScreen({required this.verificationId});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Verify OTP and sign in
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text.trim(),
                  );
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  // Navigate to next screen upon successful sign-in
                  // Replace AppRoutes.BottomNav with your route
                },
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}