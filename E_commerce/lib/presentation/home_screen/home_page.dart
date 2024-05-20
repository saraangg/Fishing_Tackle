import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/data/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../../data/user_model/user_model.dart';
import '../../widgets/listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: AssetImage(ImageConstants.banner),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Fashion\nSale',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: Dimensions.PADDING_SIZE_LARGE,
                                bottom: Dimensions.PADDING_SIZE_LARGE),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Check'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 40),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You’ve never seen it before!',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Text('View all')
                ],
              ),
            ),
            SizedBox(height: 280,
              child: Listviews(
              ),
            ),


            SizedBox(height: 20,),
            Container(width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: AssetImage(ImageConstants.banner2),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                              Text(
                                'Street clothes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                      )
                  )],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sale',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Super summer sale',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Text('View all')
                ],
              ),
            ),

            SizedBox(height: 280,
              child: Listviews1(
              ),
            ),
         ]
        )
      )
    );
  }}