import 'package:e_commerce/core/constants/labelstyle.dart';
import 'package:e_commerce/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/utils/dimensions.dart';
import '../presentation/home_screen/controller/home_controller.dart';

class Listviews extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Listviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: Models().product.length,
      itemBuilder: (context, index) {
        final product = Models().product[index];
        return Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      child: Image.asset(
                       product.image,
                        fit: BoxFit.cover,
                        height: 215,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Rating(
                                    rating: product.star,
                                    count: 5,
                                    size: 16,
                                    color: Colors.amber,
                                    bordercolor: Colors.grey,
                                  ),
                                  Text(
                                    product.count.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                product.text,
                                style: Labelstyle.Default_txt,
                              ),
                              Text(
                                "\$${product.price}",
                                style: TextStyle(color: Colors.red.shade900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                width: 150.w,
                height: 240.h,
              ),
              Positioned(
                right: 0.0,
                bottom: MediaQuery.of(context).size.height * 0.03,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 1.5,
                        spreadRadius: 0.5,
                        offset: Offset(0, 4),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: GestureDetector(
                      onTap: () {
                        homeController.toggleFavorite(index);
                      },
                      child: Obx(
                            () => Icon(
                          homeController.isFavoriteList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: homeController.isFavoriteList[index]
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('New', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Rating extends StatelessWidget {
  final double rating;
  final int count;
  final double size;
  final Color color;
  final Color bordercolor;

  const Rating({
    Key? key,
    required this.rating,
    required this.count,
    required this.size,
    required this.color,
    required this.bordercolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        double ratingValue = index + 1.0;
        IconData starIcon = Icons.star;

        if (rating < ratingValue) {
          starIcon = Icons.star_border;
        } else if (rating > ratingValue - 1) {
          starIcon = Icons.star;
        } else {
          starIcon = Icons.star_half;
        }

        return Icon(
          starIcon,
          size: size,
          color: rating >= ratingValue ? color : bordercolor,
        );
      }),
    );
  }
}




class Listviews1 extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Listviews1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: Models().product1.length,
      itemBuilder: (context, index) {
        final product = Models().product1[index];
        return Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        height: 215,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Rating1(
                                    rating: product.star,
                                    count: 5,
                                    size: 16,
                                    color: Colors.amber,
                                    bordercolor: Colors.grey,
                                  ),
                                  Text(
                                    product.count.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                product.text,
                                style: Labelstyle.Default_txt,
                              ),
                              Text(
                                "\$${product.price}",
                                style: TextStyle(color: Colors.red.shade900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                width: 150.w,
                height: 240.h,
              ),
              Positioned(
                right: 0.0,
                bottom: MediaQuery.of(context).size.height * 0.03,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 1.5,
                        spreadRadius: 0.5,
                        offset: Offset(0, 4),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: GestureDetector(
                      onTap: () {
                        homeController.toggleFavorite(index);
                      },
                      child: Obx(
                            () => Icon(
                          homeController.isFavoriteList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: homeController.isFavoriteList[index]
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sale', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Rating1 extends StatelessWidget {
  final double rating;
  final int count;
  final double size;
  final Color color;
  final Color bordercolor;

  const Rating1({
    Key? key,
    required this.rating,
    required this.count,
    required this.size,
    required this.color,
    required this.bordercolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        double ratingValue = index + 1.0;
        IconData starIcon = Icons.star;

        if (rating < ratingValue) {
          starIcon = Icons.star_border;
        } else if (rating > ratingValue - 1) {
          starIcon = Icons.star;
        } else {
          starIcon = Icons.star_half;
        }

        return Icon(
          starIcon,
          size: size,
          color: rating >= ratingValue ? color : bordercolor,
        );
      }),
    );
  }
}
