import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seclob/presentation/bottom_nav/page/bottom_nav.dart';
import 'package:seclob/widgets/button.dart';
import 'package:seclob/widgets/row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Make status bar transparent
          statusBarIconBrightness: Brightness.dark, // Set status bar icon color
        )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
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
                      height: 40,width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200
                      ),
                      child: Icon(Icons.more_horiz)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
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
                          CustomRow()
                        ],
                      ),
                      Text(
                        'Rayan Moon',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text('Photoghrapher',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10)),
                      Text('You are beautiful and\nim here to capture it!',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12)),
                      Row(
                        children: [
                          Button(
                            text: Text(
                              'Edit profile',
                              style: TextStyle(color: Colors.white),
                            ),
                            ontap: () {},
                            color: Colors.indigoAccent.shade400,
                            size:Size(130, 40),
                          ),
                          SizedBox(width: 5,),
                          Button(
                            text: Text(
                              'Wallet',
                              style: TextStyle(color: Colors.white),
                            ),
                            ontap: () {},
                            color: Colors.indigo.shade800,
                            size:Size(130, 40),
                          ),
                          SizedBox(width: 5,),
                          Button(
                            icon: Icons.call_outlined,iconcolor: Colors.white,
                            color: Colors.indigoAccent.shade100,
                            size: Size(40, 40),
                            ontap: () {},)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
