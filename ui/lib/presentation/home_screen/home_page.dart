import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui/presentation/profile/profile_page.dart';
import 'package:ui/widgets/School_Updates.dart';
import 'package:ui/widgets/button.dart';
import 'package:ui/widgets/drawer.dart';
import '../../widgets/Fl_chart/bar_graph.dart';
import '../../widgets/Listview_builder/listview_assignment.dart';
import '../../widgets/circular progress.dart';
import '../../widgets/dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final List<String> lists = [
      "Malappuram",
      "Kozhikode",
      "Wayanad",
      "Kannur",
    ];
    List<double> weeklySummery = [
      55.40,
      38.30,
      30.42,
      30.50,
      48.20,
      88.99,
      90.10,
    ];
    String initialselect = lists.first;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Home",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 20,
                backgroundImage: AssetImage("assets/mn.jpg"),
              ),
              onTap: () {
      Get.to(ProfilePage());
              },
            ),
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child: Text(
                  "Hello Maqsud!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Attendance",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Circular(
                            color: Colors.white,
                            text: '80%',
                            color2: Colors.greenAccent,
                            color3: Colors.white,
                            Value: 0.6,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Button(text:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                              Icon(Icons.arrow_forward,color: Colors.black,)
                            ],
                          ),
                            color: Colors.white,
                            ontap:() {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Fee",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Circular(
                            color: Colors.black,
                            text: '60%',
                            color2: Colors.yellowAccent,
                            Value: 0.5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         Button(text:Text("Pay Fee",style: TextStyle(fontWeight: FontWeight.w400),),
                           color: Colors.black,
                           ontap:() {},
                         ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  height: 220.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                      left: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Homework",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            CustomDropdown(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomBar(
                            weeklySummary: weeklySummery,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'School Updates',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:Row(
                    children: [
                      CustomContainer(image: "assets/nw.png",text:"News",Boxclr: Colors.greenAccent.shade100,),
                      SizedBox(width: 15.w,),
                      CustomContainer(image: "assets/ev.png",text:"Events",Boxclr: Colors.pink.shade100,),
                      SizedBox(width: 15.w,),
                      CustomContainer(image: "assets/mg.png",text:"Buletin",Boxclr: Colors.deepPurpleAccent.shade100,),
                    ],
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
