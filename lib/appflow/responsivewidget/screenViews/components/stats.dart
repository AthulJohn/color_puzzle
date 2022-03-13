import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/buttons.dart';

import '../../../../model/providermodel.dart';

class StatsShower extends StatefulWidget {
  const StatsShower({Key? key}) : super(key: key);

  @override
  State<StatsShower> createState() => _StatsShowerState();
}

class _StatsShowerState extends State<StatsShower> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Thats it...",
            style: TextStyle(
                fontFamily: "Swanky", color: Color(0xff4855B2), fontSize: 60)),
        Text(
          'Time Taken:  ${(Provider.of<ProviderModel>(context).time / 60).floor().toString().padLeft(2, '0')} : ${(Provider.of<ProviderModel>(context).time % 60).toString().padLeft(2, '0')}',
          style: const TextStyle(
              fontFamily: "Swanky", color: Color(0xff4855B2), fontSize: 30),
        ),
        Text(
          'Moves Taken:  ${Provider.of<ProviderModel>(context).moves}',
          style: const TextStyle(
              fontFamily: "Swanky", color: Color(0xff4855B2), fontSize: 30),
        ),
        const SizedBox(
          height: 40,
        ),
        const NewGameButton()
      ],
    );
  }
}
