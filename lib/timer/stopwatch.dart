import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch.start();
    Timer.periodic(const Duration(seconds: 1), (tm) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        '${stopwatch.elapsed.inMinutes} : ${stopwatch.elapsed.inSeconds % 60}');
  }
}
