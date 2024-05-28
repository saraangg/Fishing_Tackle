import 'package:flutter/material.dart';
import 'package:gemini/app_pages.dart';
import 'package:gemini/app_routes.dart';
import 'package:gemini/presentation/home/Text_with_image.dart';
import 'package:gemini/presentation/login/login_page.dart';
import 'package:gemini/presentation/sign%20up/signup_page.dart';
import 'package:gemini/presentation/welcome/welcome_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:firebase_core/firebase_core.dart';

import 'chat.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GeminiApp());
}

class GeminiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     getPages: AppPages.Lists,
      title: 'Gemini App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
