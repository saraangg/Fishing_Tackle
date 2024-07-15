import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class TranslationController extends GetxController {
  var selectedLanguage = 'English'.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
    update();
  }

  String get welcomeText => selectedLanguage.value == 'English' ? 'WELCOME' : 'आपका स्वागत है';
  String get selectLanguageText => selectedLanguage.value == 'English' ? 'Select Language' : 'भाषा का चयन करें।';
  String get startedText => selectedLanguage.value == 'English' ? 'Get Started' : 'शुरू करें';
  String get welcometoText => selectedLanguage.value == 'English' ? 'Welcome To Liveasy' : 'आपका लिवइज़ी में स्वागत है';
  String get sendotpText => selectedLanguage.value == 'English' ? 'Send OTP' : 'कृप्या बटन दबाकर OTP पाए';
  String get enternumberText => selectedLanguage.value == 'English' ? 'Enter Phone Number' : 'अपना फोन नंबर डालें';
  String get numberText => selectedLanguage.value == 'English' ? 'A 6-digit OTP will be sent via SMS to verify your number' : '6-अंको का, OTP SMS द्वारा आपके फोन पर भेजा गया है';

  String get englishText => 'English';
  String get hindiText => 'हिन्दी';
}
class Translation extends StatelessWidget {
  final TranslationController controller;

  Translation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => controller.selectLanguage('English'),
          child: Text('English'),
        ),
        TextButton(
          onPressed: () => controller.selectLanguage('Hindi'),
          child: Text('हिन्दी'),
        ),
      ],
    );
  }
}