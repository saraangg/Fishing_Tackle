import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ui/presentation/home_screen/home_page.dart';
import 'package:ui/routes/app_routes.dart';

import '../bottomnav/bottom_nav.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/lgui3.png"),
              ),
            ),
          ),
             Padding(
               padding: const EdgeInsets.only(top: 380),
               child: DraggableScrollableSheet(
                initialChildSize:0.7,
                minChildSize: 0.3,
                maxChildSize: 1,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(top:40),
                      child: Column(
                        children: [
                          Text("Educating for complexity",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                          SizedBox(height: 30,),
                          Text("Instant Accurate Communication between school \n "
                              "management staff,parents and students with the \n "
                              "                   Student-Alert portal and app",style: TextStyle(color: Colors.grey,),),
                          SizedBox(height: 40,),
                          Container(
                            height: 50, // Set your desired height
                            width: 200, // Set your desired width
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.Bottomnav);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Get started",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
            ),
             ),

        ],
      ),
    );
  }
}
