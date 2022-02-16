import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final double siz, height;
  const Heading({Key? key, required this.height, required this.siz})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Colorfull puzzle",
            style: TextStyle(
                fontSize: siz,
                fontWeight: FontWeight.bold,
                fontFamily: "Swanky"),
          ),
          SizedBox(
              height: height,
              child: Image.asset(
                "assets/underline.png",
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}
