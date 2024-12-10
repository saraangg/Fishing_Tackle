import 'package:fishing_tackles/presentation/CheckOut/CheckOut.dart';
import 'package:fishing_tackles/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/models/cart_models.dart';
import 'CartController.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final CartModel cartModel = CartModel();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
            "Cart",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              radius: 16.r,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: cartModel.items.length,
              itemBuilder: (context, index) {
                final item = cartModel.items[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          item['image'].toString(), // Replace with network image if needed
                          width: 60.w,
                          height: 60.h,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['name'].toString(),
                                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis, // This will handle overflow with an ellipsis
                                    ),
                                  ),
                                  SizedBox(width: 40,),
                                  Icon(Icons.cancel_outlined)
                                ],
                              ),
                              SizedBox(height: 8.h),
                              // Text(
                              //   item['brand'].toString(),
                              //   style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                              // ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\₹${item['price']}',
                                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  ),
                                  Obx(() {
                                    return Container(
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
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
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                    crossAxisAlignment: CrossAxisAlignment.center, // Ensure alignment is centered vertically
                    children: [
                      Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 30.w), // Add space between Text and colon
                      Text(':'),
                      SizedBox(width: 10.w), // Add space between colon and value
                      Text('\₹4000.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Divider(color: Colors.black,),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Shipping', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 30.w),
                      Text(':'),
                      SizedBox(width: 10.w),
                      Text('\₹100.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Tax', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 60.w),
                      Text(':'),
                      SizedBox(width: 10.w),
                      Text('\₹40.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Divider(color: Colors.black,),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 12.w),
                      Text(':'),
                      SizedBox(width: 10.w),
                      Text('\₹4140.00', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                      SizedBox(width: 10.w,),
                     Button(
                       color: Colors.black,
                         text: Row(
                           children: [
                             Image.asset(
                               'assets/check.png',  // Path to your local image
                               width: 22.w,  // Adjust the size of the image
                               height: 22.h,
                             ),
                             SizedBox(width: 4.w,),
                             Text('Check out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14.sp),),
                           ],
                         ),
                         ontap: (){
                         Get.to(Checkout());
                         }
                     ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
