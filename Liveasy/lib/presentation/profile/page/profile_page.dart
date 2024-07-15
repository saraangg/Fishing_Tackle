import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy/presentation/home_screen/page/home_page.dart';

import '../../../widgets/button.dart';
import '../../../widgets/container.dart';
import '../../welcome_screen/controller/welcome_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());
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
             Container(
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
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     SizedBox(height: 20,),
                     Text(controller.profileText,style:GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black) ,),
                     SizedBox(height: 20,),
                     CustomContainer(),
                     SizedBox(height: 20,),
                     Button(
                       color: Colors.indigo.shade900,
                       text: Obx(() => Text(
                         controller.continueText,
                         style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                       )),
                       ontap: () {
                         print('continue');
                         Get.to(() => HomePage());
                       },
                     )
                   ],
                 ),
               ),
            ),
          ],
        ),
      ),
    );
  }
}
