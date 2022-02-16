import 'package:flutter/material.dart';

class MovesShower extends StatelessWidget {
  const MovesShower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Moves: ",
          style: TextStyle(fontFamily: "Swanky", fontSize: 30),
        ),
        Expanded(child: NumberofMoves()),
      ],
    );
  }
}

class NumberofMoves extends StatefulWidget {
  const NumberofMoves({Key? key}) : super(key: key);

  @override
  _NumberofMovesState createState() => _NumberofMovesState();
}

class _NumberofMovesState extends State<NumberofMoves> {
  int count = 98;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < (count / 5).floor(); i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Image.asset(
              "assets/tally_5.png",
              height: 30,
              width: 30,
            ),
          ),
        count % 5 != 0
            ? Image.asset(
                "assets/tally_${count % 5}.png",
                height: 30,
                width: 30,
              )
            : Container(),
        Text('$count'),
      ],
    );
  }
}
