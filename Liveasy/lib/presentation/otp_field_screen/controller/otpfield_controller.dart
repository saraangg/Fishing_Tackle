import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveasy/presentation/profile/page/profile_page.dart';
import 'dart:async';


class OtpfieldController extends GetxController {
  var isResendButtonEnabled = false.obs;
  var start = 60.obs;
  var isLoading = false.obs;
  late Timer _timer;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    start.value = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        isResendButtonEnabled.value = true;
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  void resendOtp(String phoneNumber) async {
    if (isResendButtonEnabled.value) {
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            Get.offAll(() => ProfilePage());
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'quota-exceeded') {
              Get.snackbar("Error", "SMS quota exceeded. Please try again later.");
            } else {
              Get.snackbar("Error", e.message ?? "Verification failed");
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.snackbar("OTP Sent", "OTP has been sent again.");
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        startTimer();
        isResendButtonEnabled.value = false;
      } catch (e) {
        Get.snackbar("Error", "Failed to resend OTP. Please try again later.");
      }
    }
  }

  void verifyOtp(String verificationId, String smsCode) async {
    isLoading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      Get.offAll(() => ProfilePage());
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
