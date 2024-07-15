import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy/presentation/phone_number_screen/page/number_page.dart';
import 'package:liveasy/presentation/profile/page/profile_page.dart';
import 'package:liveasy/presentation/welcome_screen/controller/welcome_controller.dart';
import 'package:liveasy/widgets/button.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 550,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 1,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Column(
            children: [
              Image(image: AssetImage('assets/live1.jpg'), width: 280,),
              Obx(() => Text(controller.welcomeText, style: GoogleFonts.roboto(fontSize: 30),)),
              SizedBox(height: 20,),
              Obx(() => Text(controller.selectLanguageText, style: GoogleFonts.roboto(color: Colors.grey, fontSize: 26),)),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('English');
                      controller.selectLanguage('English');
                    },
                    child: Obx(() => Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: controller.selectedLanguage.value == 'English'
                              ? Colors.indigo.shade900
                              : Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.englishText,
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: controller.selectedLanguage.value == 'English'
                                    ? Colors.indigo.shade900
                                    : Colors.grey,
                              ),
                            ),
                            if (controller.selectedLanguage.value == 'English')
                              Icon(Icons.check_circle, color: Colors.indigo.shade900, size: 24,),
                          ],
                        ),
                      ),
                    )),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      print('Hindi');
                      controller.selectLanguage('हिन्दी');
                    },
                    child: Obx(() => Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: controller.selectedLanguage.value == 'हिन्दी'
                              ? Colors.indigo.shade900
                              : Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.hindiText,
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: controller.selectedLanguage.value == 'हिन्दी'
                                    ? Colors.indigo.shade900
                                    : Colors.grey,
                              ),
                            ),
                            if (controller.selectedLanguage.value == 'हिन्दी')
                              Icon(Icons.check_circle, color: Colors.indigo.shade900, size: 24,),
                          ],
                        ),
                      ),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Button(
                color: Colors.indigo.shade900,
                text: Obx(() => Text(
                  controller.startedText,
                  style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                )),
                ontap: () {
                  Get.to(() => NumberPage());
                  print('start');
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}