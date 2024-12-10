import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/brand_models.dart';
import '../../data/models/category_models.dart';

class Brandpage extends StatelessWidget {
  Brandpage({super.key});

  final BrandModel brandModel = BrandModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: brandModel.imageUrls.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  // borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.network(
                      brandModel.imageUrls[index],
                      width: 138.w, // Fixed width
                      height: 80.h, // Fixed height
                      fit: BoxFit.fill,

                    ),
                    //SizedBox(width: 8.w),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //   child: Expanded(
                    //     child: Text(
                    //       categoryModel.text1[index],
                    //       style: TextStyle(
                    //         fontSize: 14.sp,
                    //         fontWeight: FontWeight.w600,
                    //         color: Colors.black,
                    //       ),
                    //       overflow: TextOverflow.ellipsis,
                    //       maxLines: 2,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
