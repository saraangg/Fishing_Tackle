import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController _splashcontroller=Get.put(SplashController());
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage('assets/live.png'),fit:BoxFit.fill),
       ),
      ),
    );
  }
}
