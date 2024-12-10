import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.indigo.shade900,
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildIcon(Icons.home, 0),
            _buildIcon(Icons.search, 1),
            _buildIcon(Icons.add_a_photo_outlined, 2),
            _buildIcon(Icons.play_arrow_outlined, 3),
            _buildIcon(Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () => controller.onItemTapped(index),
      child: Obx(() {
        bool isSelected = controller.selectedIndex.value == index;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white60,
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 14,
                color: Colors.white,
              ),
          ],
        );
      }),
    );
  }
}
