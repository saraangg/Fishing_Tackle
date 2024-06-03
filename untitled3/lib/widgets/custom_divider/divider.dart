import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24.0, right: 10.0),
            child: Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          'OR',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 24.0),
            child: Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
