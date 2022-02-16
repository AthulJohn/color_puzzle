import 'package:flutter/material.dart';

import 'dimensionchecker.dart';
import 'dmnsn_enum.dart';
import 'screenViews/desktopview.dart';
import 'screenViews/phoneview.dart';

class Responsiver extends StatefulWidget {
  const Responsiver({Key? key}) : super(key: key);

  @override
  _ResponsiverState createState() => _ResponsiverState();
}

class _ResponsiverState extends State<Responsiver> {
  @override
  Widget build(BuildContext context) {
    if (checkDimensions(context) == Dmnsn.phone) {
      return const PhoneView();
    } else if (checkDimensions(context) == Dmnsn.tablet) {
      return const PhoneView(); //TODO: Tablet view
    } else if (checkDimensions(context) == Dmnsn.desktop) {
      return DeskView();
    } else {
      return Container();
    }
  }
}
