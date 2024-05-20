import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ui/routes/app_routes.dart';

import '../presentation/bottomnav/bottom_nav.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Sidebar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
               Get.to(Bottomnavigation());
              },

            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Assignments'),
              onTap: () {
              },

            ),
            ListTile(
              leading: Icon(Icons.home_work),
              title: Text('Homeworks'),
              onTap: () {

              },

            ),
            ListTile(
              leading: Icon(Icons.payments),
              title: Text('Payments'),
              onTap: () {
              },

            ),
          ],
        ),
      );
  }
}