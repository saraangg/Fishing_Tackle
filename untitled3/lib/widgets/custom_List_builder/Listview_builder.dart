import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/presentation/adidas/adidas_page.dart';

import '../../data/models/image_models.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key});

  @override
  Widget build(BuildContext context) {
    List<ImageModel> images = ImageModel.getImages();

    return SizedBox(
      height: 80, // Height of the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(AdidasPage());
              // Handle tap event here
              print("Image tapped: ${images[index].imageUrl}");
              // You can navigate to another screen or show a dialog, etc.
            },
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 8), // Adding some spacing between items
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  images[index].imageUrl,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
