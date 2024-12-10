import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/models/popular_models.dart';
import '../../data/models/popularproductsview_model.dart';
import '../Cart/Cart.dart';
import '../Favourite/FavouriteController.dart';
import '../ProductView/ProductView.dart'; // Import the Productview page

class Newarrivalview extends StatelessWidget {
  Newarrivalview({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final PopularviewModel popularModel = PopularviewModel();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: IconButton(
              icon: Icon(
                Icons.grid_view_rounded,
                color: Colors.black,
                size: 24.0,
              ),
              onPressed: () {
              },
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Shop",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Get.to(Cart());
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3'),
                  radius: 16.r,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
          child:
          Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: popularModel.items.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = popularModel.items[index];
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
                              RatingBar.builder(
                                initialRating: (item['rating'] as double?) ?? 0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 10.sp,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                glowColor: Colors.yellow,
                                onRatingUpdate: (rating) {},
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
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
                                  Text(
                                    '\₹${item['price']}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Obx(() {
                                    return Container(
                                      width: 30.w,
                                      height: 27.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(30.r),
                                      ),
                                      child: Icon(
                                        favoriteController.isFavorite(item['image'].toString())
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: favoriteController.isFavorite(item['image'].toString())
                                            ? Color(0xFFEB1C23)
                                            : Colors.grey,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
