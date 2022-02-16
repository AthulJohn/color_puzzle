import 'package:flutter/material.dart';
import 'package:slide_puzzle_prototype/appflow/puzzlebody/puzzlebody.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/heading.dart';

import 'components/moves.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/bgphone.png",
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Heading(height: 15, siz: 25),
              const Expanded(
                flex: 5,
                child: PuzzleBody(), //PuzzleBoard(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset("assets/tapphone.png",
                          fit: BoxFit.contain),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset("assets/mixphone.png",
                          fit: BoxFit.contain),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [Text("Time:34"), MovesShower()],
                      ),
                    ),
                    const Expanded(child: Solution())
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
