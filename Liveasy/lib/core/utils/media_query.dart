import 'package:flutter/widgets.dart';

class Mediaquery {
  final BuildContext context;

  Mediaquery(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidthPercent => MediaQuery.of(context).size.width / 100;
  double get screenHeightPercent => MediaQuery.of(context).size.height / 100;

  double scaledWidth(double percent) => screenWidthPercent * percent;
  double scaledHeight(double percent) => screenHeightPercent * percent;
  double scaledFont(double factor) => screenWidthPercent * factor;
}
