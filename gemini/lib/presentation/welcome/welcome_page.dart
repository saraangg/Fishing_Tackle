import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini/presentation/welcome/welcome_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage ({super.key});

  @override
  State<WelcomePage > createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage > {
  final WelcomeController _welcomecontroller=Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 500,
        decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/Gemini.png',),),
        ) ,
      ),
    );
  }
}
