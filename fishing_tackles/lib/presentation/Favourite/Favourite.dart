import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favoritepage extends StatelessWidget {
   Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      "wishlist",
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
            child:  IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 24.0,
              ),
              onPressed: () {
              },
            ),
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=3'), // Replace with your asset or URL
            radius: 16.r,
          ),
        ],
      ),
    ),
  ],
),
    );
  }
}
