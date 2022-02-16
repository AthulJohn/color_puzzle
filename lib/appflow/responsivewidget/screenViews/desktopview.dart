import 'package:flutter/material.dart';
import 'package:slide_puzzle_prototype/appflow/puzzlebody/puzzlebody.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/moves.dart';
import 'package:slide_puzzle_prototype/model/colour.dart';

import 'components/heading.dart';

class DeskView extends StatelessWidget {
  const DeskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.centerLeft,
      children: [
        Image.asset("assets/bg.png", fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Heading(height: 20, siz: 35),
                    const Expanded(
                      flex: 3,
                      // child: AspectRatio(
                      // aspectRatio: 1,
                      child: PuzzleBody(),
                      // ),
                    ),
                    Expanded(
                        child: Image.asset("assets/tapdesk.png",
                            fit: BoxFit.contain)),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [Text("Time: 80"), MovesShower()],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset("assets/mixdesk.png",
                                fit: BoxFit.contain),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Spacer(flex: 2),
                              Solution(),
                              Spacer()
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ), //PuzzleBoard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
