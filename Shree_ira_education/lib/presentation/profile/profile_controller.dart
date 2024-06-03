import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImage = Rx<ImageProvider>(NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXCM8Hu-zzxXfoVKNoNI4bAtRaf9WfRLEKstgO9N1YeyQQUFyB'));
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final detailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void initializeProfileData(Map<String, dynamic> responseData) {
    fnameController.text = responseData['user']['fname'];
    lnameController.text = responseData['user']['lname'];
    mobileController.text = responseData['user']['mobile'];
    emailController.text = responseData['user']['email'];
    addressController.text = responseData['user']['address'];
    detailController.text = responseData['user']['detail'];
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      profileImage.value = FileImage(File(pickedImage.path));
    }
  }
}
