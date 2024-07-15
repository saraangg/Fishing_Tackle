import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:liveasy/presentation/phone_number_screen/controller/number_controller.dart';
import 'package:liveasy/presentation/otp_field_screen/controller/otpfield_controller.dart';

import '../../welcome_screen/controller/welcome_controller.dart';

class OtpfieldPage extends StatelessWidget {
  const OtpfieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());
    final NumberController numberController = Get.find<NumberController>();
    final OtpfieldController otpfieldcontroller = Get.put(OtpfieldController());
    final String verificationId = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/live3.png'), width: 80),
                  Text('Liveasy', style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(() =>  Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Text(controller.verificationText, style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 25)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.otpsentText, style: GoogleFonts.roboto(color: Colors.black)),
                        Text('${numberController.phoneNumber.value}', style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold)),
                        SizedBox(width: 2,),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(controller.changeText, style: GoogleFonts.roboto(color: Colors.blue,decoration: TextDecoration.underline,)),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Pinput(
                      length: 6,
                      onCompleted: (pin) {
                        otpfieldcontroller.verifyOtp(verificationId, pin);
                      },
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Obx(() => otpfieldcontroller.start.value > 0
                        ? Text('Resend OTP in ${otpfieldcontroller.start.value} seconds', style: GoogleFonts.roboto(color: Colors.grey))
                        : GestureDetector(
                      onTap: () {
                        otpfieldcontroller.resendOtp(numberController.phoneNumber.value);
                      },
                      child: Text('Resend OTP', style: GoogleFonts.roboto(color: Colors.blue)),
                    )),
                    SizedBox(height: 20),
                    Obx(() => otpfieldcontroller.isLoading.value
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Verifying OTP...', style: GoogleFonts.roboto(color: Colors.black)),
                        SizedBox(height: 10),
                        CircularProgressIndicator(),
                      ],
                    )
                        : Container()),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
