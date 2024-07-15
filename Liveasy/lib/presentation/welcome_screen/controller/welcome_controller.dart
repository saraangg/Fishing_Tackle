import 'package:get/get.dart';

class WelcomeController extends GetxController {
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
  String get otpsentText => selectedLanguage.value == 'English' ? 'OTP sent to' : 'OTP भेजा गया है';
  String get changeText => selectedLanguage.value == 'English' ? 'change' : 'नम्बर बदले';
  String get verificationText => selectedLanguage.value == 'English' ? 'OTP Verification' : 'OTP की जाँच';
  String get continueText => selectedLanguage.value == 'English' ? 'CONTINUE' : 'जारी रख';
  String get profileText => selectedLanguage.value == 'English' ? 'Please select your profile' : 'कृपया अपना प्रोफ़ाइल चुनें';
  String get shipperText => selectedLanguage.value == 'English' ? 'Shipper' : 'भेजनेवाला';
  String get transporterText => selectedLanguage.value == 'English' ? 'Transporter' : 'ट्रांसपोर्टर';
  String get subText => selectedLanguage.value == 'English' ? 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing' : 'लोरेम इप्सम डोलर सिट अमेट,\nकंसेक्टेटूर एडिपिसिंग';


  String get englishText => 'English';
  String get hindiText => 'हिन्दी';
}
