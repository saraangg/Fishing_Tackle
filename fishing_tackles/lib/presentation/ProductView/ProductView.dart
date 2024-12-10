import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Cart/Cart.dart';
import '../Cart/CartController.dart';

class Productview extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const Productview({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
            "Product",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h,),
          Center(
            child: Image.network(
              image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 18),
          Container(
            height: 420.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('QTY',style: TextStyle(fontSize: 22.sp),),
                          SizedBox(width: 20.w),
                          Obx(() {
                            return Container(
                              height: 32.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartController.decreaseQuantity();
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(
                                    cartController.quantity.value.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartController.increaseQuantity();
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 14.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        '\₹$price',
                        style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Cart());
                      },
                      child: Container(
                        height: 46.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,color: Colors.white,),
                            SizedBox(width: 8.w,),
                            Text('Add to Cart',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w700),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
