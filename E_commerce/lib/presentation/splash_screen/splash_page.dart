import 'package:e_commerce/core/constants/image_constants.dart';
import 'package:e_commerce/presentation/splash_screen/controller/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashcontroller _splashcontroller=Get.put(splashcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: Container(
            width: 500,
            decoration:BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageConstants.ImgSplash),fit: BoxFit.fitWidth)
            ) ,
          ),
    );
  }
}
