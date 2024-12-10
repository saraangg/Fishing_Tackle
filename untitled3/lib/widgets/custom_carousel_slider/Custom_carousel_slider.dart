import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatelessWidget {
  final RxInt _currentIndex = 0.obs;
  final CarouselController _controller = CarouselController();
  CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/bnr.jpg",
      "assets/bnr1.png",
      "assets/bnr2.png",
    ];

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: images.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
              ),
            ),
            Positioned(
              bottom: 10, // Adjust the position as needed
              child: Obx(() => AnimatedSmoothIndicator(
                activeIndex: _currentIndex.value,
                count: images.length,
                effect: WormEffect(
                  dotHeight: 4,
                  dotWidth: 22,
                  activeDotColor: Colors.red,
                  dotColor: Colors.grey,
                ),
                onDotClicked: (index) {
                  _controller.animateToPage(index);
                },
              )),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
