import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Column(
            children: [
              Text('50',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Post',style: TextStyle(color: Colors.grey),)
            ],
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text('564',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Followers',style: TextStyle(color: Colors.grey),)
            ],
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text('564',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Following',style: TextStyle(color: Colors.grey),)
            ],
          ),
        ],
      ),
    );
  }
}
