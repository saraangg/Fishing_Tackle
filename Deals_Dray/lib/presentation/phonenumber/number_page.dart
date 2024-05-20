// phone_number_view.dart

import 'package:deals_dray/presentation/phonenumber/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberView extends StatelessWidget {
  final PhoneNumberController controller = Get.put(PhoneNumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(image:AssetImage("assets/dray3.png"),width: 180,height: 180,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right:130),
                child: Text('Glad to see you!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 85),
                child: Text("Please provide your phone number"),
              ),
              SizedBox(height: 40,),
              Obx(() => Row(
                children: [
                  DropdownButton<String>(
                    value: controller.selectedCountryCode.value,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.selectedCountryCode.value = newValue;
                      }
                    },
                    items: <String>['+1', '+91', '+44', '+81']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize:Size(350, 50),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),

                ),
                onPressed: () {
                  controller.validatePhoneNumber();
                },
                child: Text('SEND CODE',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                controller.validationResult.value,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
