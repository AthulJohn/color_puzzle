import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/responsivewidget.dart';
import 'package:slide_puzzle_prototype/tile.dart';
import 'package:slide_puzzle_prototype/widget.dart';

import '../constants/consts.dart';
import '../model/colour.dart';
import '../timer/stopwatch.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Row(), const Expanded(child: Responsiver())],
      ),
    );
  }
}
