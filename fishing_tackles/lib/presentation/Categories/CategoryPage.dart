import 'package:fishing_tackles/data/models/category_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/models/popular_models.dart';
import '../Favourite/FavouriteController.dart';
import 'CategoryController.dart';

class Categorypage extends StatelessWidget {
   Categorypage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Center(
        child: Text(
              'Categories',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
      ),

          SizedBox(height: 16.h),
          SizedBox(
            height: 250.h,
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 90,
                childAspectRatio: 0.8,
              ),
              itemCount: controller.categoryModel.items.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.categoryModel.items[index];
                return Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white,
                       image: DecorationImage(image: NetworkImage(item['image'].toString()),fit: BoxFit.fill)
                      ),
                    ),
                    Text(item['name'].toString())
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
