import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/models/newarrival_models.dart';
import '../../data/models/popular_models.dart';
import '../Favourite/FavouriteController.dart';
import '../ProductView/ProductView.dart';
import 'NewArrivalView.dart';

class Newarrivalpage extends StatelessWidget {
   Newarrivalpage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final NewarrivalModels newarrivalrModel = NewarrivalModels();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrival',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(Newarrivalview());
                },
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8, // Adjust this for card proportions
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: newarrivalrModel.items.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = newarrivalrModel.items[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => Productview(
                        name: item['name'].toString(),
                        image: item['image'].toString(),
                        price: item['price'].toString(),
                      ));
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(item['image'].toString(), height: 90.h),
                                Text(
                                  item['name'].toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: (item['rating'] as double?) ?? 0.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 10.sp,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      glowColor: Colors.yellow,
                                      onRatingUpdate: (rating) {
                                        // Handle the rating change if necessary
                                      },
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Text(
                                      '\₹${item['price']}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.green,
                                      ),
                                    ),
                                    // Obx(() {
                                    //   return Container(
                                    //     width: 30.w,
                                    //     height: 27.h,
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.grey.shade100,
                                    //         borderRadius: BorderRadius.circular(30.r)
                                    //     ),
                                    //     child: Icon(
                                    //       favoriteController.isFavorite(item['image'].toString())
                                    //           ? Icons.favorite
                                    //           : Icons.favorite_border,
                                    //       color: favoriteController.isFavorite(item['image'].toString())
                                    //           ? Color(0xFFEB1C23)
                                    //           : Colors.grey,
                                    //     ),
                                    //   );
                                    // }),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
