import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Profile'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor:
                      Colors.transparent,
                      radius: 60.r,
                      child:ClipOval(
                        child: Image.network(
                          'https://i.pravatar.cc/150?img=3',
                          height: 70.h,
                          width: 80.w,
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name'),
                      Text('Name@gmail.com'),
                      Text('ID NO: EXMPL 4566'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
