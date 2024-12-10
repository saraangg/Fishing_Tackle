import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../presentation/home_screen/controller/HomeController.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.h,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              controller.currentIndex.value = index; // Update the current index
            },
          ),
          items: controller.carouselImages.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
        // Animated Dot Indicator
        Obx(() => AnimatedSmoothIndicator(
          activeIndex: controller.currentIndex.value,
          count: controller.carouselImages.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
            dotHeight: 8.h,
            dotWidth: 8.w,
            expansionFactor: 3,
          ),
        )),
      ],
    );
  }
}

