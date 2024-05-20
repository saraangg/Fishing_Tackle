
import 'package:e_commerce/presentation/favorite/favorite_page.dart';
import 'package:e_commerce/presentation/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen/home_page.dart';
import 'bottomnav_controller.dart';

class Bottomnavigation extends GetView<BottomnavController> {
  const Bottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      HomePage(),
      HomePage(),
      HomePage(),
      FavoritePage(),
      ProfilePage(),
    ];

    return Scaffold(
        body: Obx(() => Pages[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                controller.selectedIndex.value = value;
              },
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedItemColor: Colors.deepOrange,
              selectedIconTheme: IconThemeData(color: Colors.deepOrange),
              selectedLabelStyle: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w300,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 0
                          ? Icons.home
                          : Icons.home_outlined,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 1
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                    ),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 2
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined,
                    ),
                    label: 'Bag'),
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 3
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex.value == 4
                          ? Icons.person
                          : Icons.person_outline,
                    ),
                    label: 'Profile')
              ]),
        ));
  }
}