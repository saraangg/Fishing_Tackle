import 'package:fishing_tackles/presentation/bottom_nav_bar/BottomNavigationBar.dart';
import 'package:fishing_tackles/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'CheckOutController.dart';



class Checkout extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  Checkout({super.key});

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(
                Icons.grid_view_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Check Out",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  'https://i.pravatar.cc/150?img=3'), // Replace with your image
              radius: 16.r,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Billing Information Section
            Text(
              "Billing Information",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "SUHA JANNAT",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "care@example.com",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "+880 000 111 222",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Shipping Address",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "28/C Green Road, BD",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Shipping Method Section
            Text(
              "Shipping Method Choose",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Obx(
                  () => Column(
                children: [
                  RadioListTile<int>(
                    value: 0,
                    groupValue: controller.selectedShippingMethod.value,
                    activeColor: Colors.red,
                    onChanged: (int? value) {
                      if (value != null) {
                        controller.selectShippingMethod(value);
                      }
                    },
                    title: Text(
                      "Fast Shipping 1 day delivery for \$1.0",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  RadioListTile<int>(
                    value: 1,
                    groupValue: controller.selectedShippingMethod.value,
                    activeColor: Colors.red,
                    onChanged: (int? value) {
                      if (value != null) {
                        controller.selectShippingMethod(value);
                      }
                    },
                    title: Text(
                      "Regular 3-7 days delivery for \$0.4",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  RadioListTile<int>(
                    value: 2,
                    groupValue: controller.selectedShippingMethod.value,
                    activeColor: Colors.red,
                    onChanged: (int? value) {
                      if (value != null) {
                        controller.selectShippingMethod(value);
                      }
                    },
                    title: Text(
                      "Courier 5-8 days delivery for \$0.3",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),

            // Total Price and Confirm Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$39.84",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               Button(
                 color: Colors.black,
                 text: Text(
                 "Confirm & Pay",
                 style: TextStyle(fontSize: 14.sp, color: Colors.white),
               ),
                   ontap: () {
Get.offAll(CustomBottomNavBar());
                   },
               )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
