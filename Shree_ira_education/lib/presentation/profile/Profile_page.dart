import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/textfield.dart'; // Import your custom text field widget here
import 'profile_controller.dart'; // Import ProfileController

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic>?responseData;

  ProfilePage({Key? key, this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    controller.initializeProfileData(responseData!);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Obx(() => CircleAvatar(
                    radius: 50.0,
                    backgroundImage: controller.profileImage.value,
                  )),
                ),
                Positioned(
                  top: 50.0,
                  right: 100.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                      border: Border.all(
                        color: Colors.white,
                        width: .0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        color: Colors.white,
                        onPressed: () => controller.pickImage(ImageSource.gallery),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'First Name*', controller: controller.fnameController),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'Last Name*', controller: controller.lnameController),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'Mobile Number*', controller: controller.mobileController),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'Email*', controller: controller.emailController),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'Address*', controller: controller.addressController),
            SizedBox(height: 20.0),
            CustomTextFormField(lbText: 'Detail*', controller: controller.detailController),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Add your update logic here
                },
                child: Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
