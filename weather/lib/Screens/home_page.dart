import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/Data/image_path.dart';
import 'package:weather/utils/apptext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/cloudy.jpeg')),
        ),
        child: Stack(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              data: "Dubai",
                              color: Colors.black,
                              fw: FontWeight.w700,
                              size: 18,
                            ),
                            AppText(
                              data: "Good Morning",
                              color: Colors.black,
                              fw: FontWeight.w400,
                              size: 14,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon:Icon(Icons.search,size: 32,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
