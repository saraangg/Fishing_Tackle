import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../home_screen/page/home_page.dart';
import '../../otp_field_screen/page/otpfield_page.dart';

class NumberController extends GetxController {
  var phoneNumber = ''.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void updatePhoneNumber(String number) {
    phoneNumber.value = number;
  }

  void verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
         Get.offAll(() => HomePage());
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {

        Get.to(() => OtpfieldPage(), arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

  void signInWithOTP(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);

     Get.offAll(() => HomePage());
  }
}
