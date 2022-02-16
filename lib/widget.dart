import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArrowWidget extends StatelessWidget {
  final double ang;
  const ArrowWidget(this.ang, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: (math.pi / 2) * ang,
        child: const Icon(Icons.arrow_upward, size: 24.0));
  }
}

class MixWidget extends StatelessWidget {
  const MixWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.format_paint_sharp, size: 24.0);
  }
}
