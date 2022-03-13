import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/providermodel.dart';

class MovesShower extends StatelessWidget {
  final bool showPics;
  const MovesShower({this.showPics = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Moves: ",
          style: TextStyle(
            fontFamily: "Swanky",
            fontSize: 30,
            color: Color(0xff4855B2),
          ),
        ),
        showPics
            ? Expanded(
                child: NumberofMoves(
                    noOfMoves: Provider.of<ProviderModel>(context).moves))
            : Text(
                ' ${Provider.of<ProviderModel>(context).moves}',
                style: const TextStyle(
                  fontFamily: "Swanky",
                  fontSize: 30,
                  color: Color(0xff4855B2),
                ),
              ),
      ],
    );
  }
}

class NumberofMoves extends StatelessWidget {
  final int noOfMoves;
  const NumberofMoves({required this.noOfMoves, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < (noOfMoves / 5).floor(); i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Image.asset(
              "assets/tally_5.png",
              height: 30,
              width: 30,
            ),
          ),
        noOfMoves % 5 != 0
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Image.asset(
                  "assets/tally_${noOfMoves % 5}.png",
                  height: 30,
                  width: 30,
                ),
              )
            : Container(),
      ],
    );
  }
}
