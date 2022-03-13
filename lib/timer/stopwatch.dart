import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providermodel.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  int time = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (tm) {
      Provider.of<ProviderModel>(context, listen: false).setTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time:   ${(Provider.of<ProviderModel>(context).time / 60).floor().toString().padLeft(2, '0')} : ${(Provider.of<ProviderModel>(context).time % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(
          fontFamily: "Swanky", color: Color(0xff4855B2), fontSize: 30),
    );
  }
}
