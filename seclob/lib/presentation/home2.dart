import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seclob/presentation/bottom_nav/page/bottom_nav.dart';

import '../widgets/button.dart';
import '../widgets/row.dart';
import 'controller.dart';
import 'mediaitem.dart';

class Home2 extends StatelessWidget {
  Home2({super.key});
  final MediaController mediaController = Get.put(MediaController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness: Brightness.dark, // Set status bar icon color
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomNav(),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (mediaController.isLoading.value) {
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.grey.shade500, color: Colors.white, strokeWidth: 1));
          } else {
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverPadding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade200,
                              ),
                              child: Center(
                                child: ImageIcon(
                                  AssetImage('assets/sec1.png'),
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade200,
                              ),
                              child: Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(28.0),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: AssetImage('assets/sec.jpg'),
                                    ),
                                    CustomRow(),
                                  ],
                                ),
                                Text(
                                  'Rayan Moon',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Text(
                                  'Photographer',
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    ),
                                    Text(
                                      'You are beautiful and\nI\'m here to capture it!',
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Button(
                                      text: Text(
                                        'Edit profile',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      ontap: () {},
                                      color: Colors.indigoAccent.shade400,
                                      size: Size(130, 40),
                                    ),
                                    SizedBox(width: 5),
                                    Button(
                                      text: Text(
                                        'Wallet',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      ontap: () {},
                                      color: Colors.indigo.shade800,
                                      size: Size(130, 40),
                                    ),
                                    SizedBox(width: 5),
                                    Button(
                                      icon: Icons.call_outlined,
                                      iconcolor: Colors.white,
                                      color: Colors.indigoAccent.shade100,
                                      size: Size(40, 40),
                                      ontap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 50),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          height: 40,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: TabBar(
                            tabs: [
                              Tab(text: 'Photos'),
                              Tab(text: 'Videos'),
                            ],
                            labelColor: Colors.black,
                            indicatorColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    // Photos tab
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: mediaController.mediaList.length,
                      itemBuilder: (context, index) {
                        return MediaItem(media: mediaController.mediaList[index]);
                      },
                    ),
                    // Videos tab
                    Center(
                      child: Text('Videos'),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
