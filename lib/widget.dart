import 'package:flutter/material.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.cut, color: Color(0x774855B2), size: 48.0);
  }
}

class MixWidget extends StatelessWidget {
  const MixWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.add_circle_rounded,
        color: Colors.black54, size: 50.0);
  }
}
