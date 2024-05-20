import 'package:flutter/cupertino.dart';

class Resp {
  late BuildContext context;
  late double width;
  late double height;

  Resp(BuildContext context) {
    this.context = context;
    this.width = MediaQuery.of(context).size.width;
    this.height = MediaQuery.of(context).size.height;
  }
}