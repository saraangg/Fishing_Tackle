import 'package:flutter/cupertino.dart';

class GG_FB extends StatelessWidget {
  const GG_FB({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('First image tapped');
            // Add your onTap code here
          },
          child: Image(
            image: AssetImage('assets/5.png'),
            width: 55,
            height: 55,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Second image tapped');
            // Add your onTap code here
          },
          child: Image(
            image: AssetImage('assets/fb4.png'),
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
