import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;

  const CustomAppBar({Key? key, this.leading, required this.title,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(title),
    );
  }
}


