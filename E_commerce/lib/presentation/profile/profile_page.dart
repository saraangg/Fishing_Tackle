import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/heading.dart';
import '../../widgets/app_bar/appbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title:'',
            action:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,color: Colors.black),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
          child: Row(
            children: [
              HeadWidget(
                txt: 'Login',
                clr: Colors.black,
                fntwei: FontWeight.bold,
                size: 40,
              ),
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(right: 250,top: 20),
            child: Container(
              height: 80,width: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.person_add),
            ),
          ),
        ],
      ),

    );
  }
}
