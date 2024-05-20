// phone_number_controller.dart

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PhoneNumberController extends GetxController {
  RxString selectedCountryCode = '+1'.obs;
  TextEditingController phoneNumberController = TextEditingController();
  RxString validationResult = ''.obs;

  void validatePhoneNumber() async {
    final String phoneNumber = phoneNumberController.text;
    final String apiUrl = 'https://your-api-endpoint.com/validate';
    final Map<String, String> requestBody = {
      'phone_number': '${selectedCountryCode.value}$phoneNumber'
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        validationResult.value = data['message'];
      } else {
        throw Exception('Failed to validate phone number');
      }
    } catch (e) {
      validationResult.value = 'Failed to validate. Please try again.';
    }
  }
}
