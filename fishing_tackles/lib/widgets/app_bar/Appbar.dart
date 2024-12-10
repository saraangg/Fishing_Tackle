import 'package:fishing_tackles/presentation/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotifiTap;
  final String? avatarUrl;

  CustomAppBar({
    required this.title,
    this.onMenuTap,
    this.onNotifiTap,
     this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            onPressed: onMenuTap,
          ),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
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
                    Icons.notifications,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  onPressed: onNotifiTap,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  Get.to(Profile());
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                  radius: 16.r,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
