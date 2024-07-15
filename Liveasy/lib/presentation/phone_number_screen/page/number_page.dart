import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:liveasy/core/utils/media_query.dart';
import 'package:liveasy/presentation/phone_number_screen/controller/number_controller.dart';
import 'package:liveasy/presentation/welcome_screen/controller/welcome_controller.dart';
import 'package:liveasy/widgets/button.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());
    final NumberController numbercontroller = Get.put(NumberController());
    final responsive = Mediaquery(context);

    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: responsive.scaledHeight(40)),
               Row(
                children: [
                  Image(image: AssetImage('assets/live3.png'), width: 80),
                  Text('Liveasy', style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),

            SizedBox(height: responsive.scaledHeight(2)),
            Obx(() => Container(
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
                    SizedBox(height: responsive.scaledHeight(2.5)),
                    Text(controller.welcometoText, style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 25)),
                    SizedBox(height: responsive.scaledHeight(2)),
                    Text(controller.numberText, style: GoogleFonts.roboto(color: Colors.grey)),
                    SizedBox(height: responsive.scaledHeight(4)),
                    Obx(() => IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: controller.enternumberText,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        numbercontroller.updatePhoneNumber(phone.completeNumber);
                      },
                    )),
                    SizedBox(height: responsive.scaledHeight(3)),
                    Obx(() => Button(
                      color: numbercontroller.phoneNumber.value.isEmpty ? Colors.grey : Colors.indigo.shade900,
                      text: Text(
                        controller.sendotpText,
                        style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey.shade200),
                      ),
                      ontap: () {
                        if (numbercontroller.phoneNumber.value.isNotEmpty) {
                          numbercontroller.verifyPhoneNumber();
                        }
                      },
                    )),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
