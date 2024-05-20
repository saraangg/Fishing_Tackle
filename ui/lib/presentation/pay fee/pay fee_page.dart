import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeePage extends StatelessWidget {
  const FeePage  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text(
            'Pay Fee',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
