import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bottomnav/bottomnav_controller.dart';

class HomeWrk extends StatelessWidget {
  HomeWrk ({super.key});
  final BottomnavController bottomnavController = Get.put(BottomnavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            bottomnavController.updateSelectedIndex(0);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text(
            'Homework',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
