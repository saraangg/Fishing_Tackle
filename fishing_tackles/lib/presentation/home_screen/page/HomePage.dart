import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fishing_tackles/presentation/Brands/Brand.dart';
import 'package:fishing_tackles/presentation/Cart/Cart.dart';
import 'package:fishing_tackles/widgets/app_bar/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/CarouselSlider.dart';
import '../../Categories/CategoryPage.dart';
import '../../NewArrival/NewArrival.dart';
import '../../Popular/PopularPage.dart';
import '../../bottom_nav_bar/BottomNavigationBar.dart';
import '../controller/HomeController.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Home',
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(Icons.filter_alt, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Carousel(),
          SizedBox(height: 10.h),
          Brandpage(),
          SizedBox(height: 10.h),
          Categorypage(),
          SizedBox(height: 10.h),
          Popularpage(),
          SizedBox(height: 10.h),
          Newarrivalpage(),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
