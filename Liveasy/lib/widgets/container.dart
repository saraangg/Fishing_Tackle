import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liveasy/presentation/profile/controller/profile_controller.dart';

import '../presentation/welcome_screen/controller/welcome_controller.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());
    final ProfileController profileController = Get.put(ProfileController());
    return Column(
      children: [
        Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: profileController.selectedValue.value,
                  onChanged: (int? value) {
                    profileController.selectedValue.value = value!;
                  },
                ),
                ImageIcon(
                  AssetImage('assets/live4.png'),
                  size: 40.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       controller.shipperText,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      Text(
                        controller.subText,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
    Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Radio<int>(
                  value: 2,
                  groupValue:profileController.selectedValue.value,
                  onChanged: (int? value) {
                    setState(() {
                      profileController.selectedValue.value= value!;
                    });
                  },
                ),
                ImageIcon(
                  AssetImage('assets/live5.png'),
                  size: 42.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:  Obx(() =>Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.transporterText,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      Text(
                        controller.subText,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
    ),
      ],
    );
  }
}
