import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pay fee/pay fee_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  List<String>ttl=[
    "Privacy",
    "Purchase History",
    "Help & Support",
    "Settings",
    "Invite a Friend",
  ];
  List<IconData>icn=[
    (Icons.lock_person),
    (Icons.history),
    (Icons.help_outline_rounded),
    (Icons.settings),
    (Icons.person_add),
  ];
  List<Widget>pages=[
    FeePage(),
    FeePage(),
    FeePage(),
    FeePage(),
    FeePage(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      backgroundImage: AssetImage('assets/mn.jpg'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Maqsud!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade200),
                      child: ListTile(
                        title: Text(ttl[index],style: TextStyle(color: Colors.black),),
                        leading: Icon(icn[index],color: Colors.black,),
                        selected: true,
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index],));
                        },
                      ),
                    )
                );
              },
            )
          ],
        ),
      ),
    );

  }
}
