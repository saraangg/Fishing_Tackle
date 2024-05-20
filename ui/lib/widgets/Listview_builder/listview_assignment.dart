import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/assignment/assignment_model.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Models().txt.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 200.w,
            height: 110.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:24,left: 10),
                      child: Container(
                        height: 70.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Models().color[index],
                            borderRadius: BorderRadius.circular(20)),
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(Models().Imageurl2[index],color:Models().color2[index]),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(Models().txt[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(Models().txt2[index],style: TextStyle(fontSize: 14),),
                      ),
                      Row(
                        children: [
                         Image.asset(Models().Imageurl[index],width: 20,height: 16,color:Models().color2[index]),
                          Text(Models().txt3[index],style: TextStyle(color: Models().color2[index]),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
