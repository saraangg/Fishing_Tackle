import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../assignment/assignment_page.dart';
import '../home_screen/home_page.dart';
import '../homework/homewrk_page.dart';
import '../pay fee/pay fee_page.dart';
import 'bottomnav_controller.dart';

class Bottomnavigation extends GetView<BottomnavController> {
  const Bottomnavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      HomePage(),
      Assignment(),
      HomeWrk(),
      FeePage(),
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
          selectedItemColor: Colors.greenAccent,
          selectedIconTheme: IconThemeData(color: Colors.greenAccent),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/hm.png',
                'assets/hm.png',
                controller.selectedIndex.value == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/as.png',
                'assets/as.png',
                controller.selectedIndex.value == 1,
              ),
              label: 'Assignment',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/hw.png',
                'assets/hw.png',
                controller.selectedIndex.value == 2,
              ),
              label: 'Homework',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/ch.png',
                'assets/ch.png',
                controller.selectedIndex.value == 3,
              ),
              label: 'Pay Fee',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String normalImage, String selectedImage, bool isSelected) {
    return isSelected
        ? ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.srcIn),
      child: Image.asset(
        selectedImage,
        width: 24,
        height: 24,
      ),
    )
        : Image.asset(
      normalImage,
      width: 26,
      height: 26,
    );
  }
}
