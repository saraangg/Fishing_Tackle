import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_List_builder/Listview_builder.dart';
import '../custom_carousel_slider/Custom_carousel_slider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 40.0,
          floating: true,
          pinned: false,
          snap: true,
          backgroundColor: Colors.black,
          title: Container(
            height: 45,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                border: Border.all(color: Colors.grey.shade600, width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('searching tapped');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      'Search Product...',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                height: 45,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    border: Border.all(color: Colors.grey.shade600, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('notification tapped');
                  },
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSliderWidget(),
          )
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomListview(),
          )
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top Brands',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.blueAccent, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: for rounded corners
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1113dbbf-2d4f-412e-b4d7-6a7a86c36cda/jumpman-mvp-shoes-JV1HCs.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Product $index',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\$${(index + 1) * 10}',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        )
      ],
    );
  }
}
