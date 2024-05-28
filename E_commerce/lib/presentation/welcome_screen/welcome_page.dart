import 'package:e_commerce/core/constants/image_constants.dart';
import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/presentation/post.dart';
import 'package:e_commerce/presentation/sign_in_screen/login_page.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants/txt.dart';
import '../api.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageConstants.ImgSplash),fit: BoxFit.fitWidth,opacity:100)
        ) ,
        child: Padding(
          padding: const EdgeInsets.only(top:400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(text:Text('LOGIN'), ontap: () {Get.to(LoginPage ());},),
              SizedBox(height: 20,),
              Button(text:Text('SIGN UP'), ontap: () {Get.toNamed(AppRoutes.Signup);},),
            ],
          ),
        ),
      ),
    );
  }
}
