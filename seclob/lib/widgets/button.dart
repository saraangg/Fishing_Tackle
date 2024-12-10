import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget? text;
  final Color? color;
  final Color? iconcolor;
  final Size? size;
  final IconData? icon;
  final void Function()? ontap;

  const Button({
    super.key,
    this.text,
    required this.ontap,
    this.color,
    this.size,
    this.icon, this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon,color: iconcolor,size: 16,),
          if (icon != null && text != null) SizedBox(width: 8), // Spacing between icon and text if both are present
          if (text != null) text!,
        ],
      ),
    );
  }
}
