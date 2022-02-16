import 'package:flutter/cupertino.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/dmnsn_enum.dart';

Dmnsn checkDimensions(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  if (width < height * 0.6)
    return Dmnsn.phone;
  else if (width >= height * 0.6 && width < height)
    return Dmnsn.tablet;
  else
    return Dmnsn.desktop;
}
