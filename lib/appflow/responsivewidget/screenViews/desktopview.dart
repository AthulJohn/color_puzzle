import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_prototype/appflow/puzzlebody/puzzlebody.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/moves.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/stats.dart';
import 'package:slide_puzzle_prototype/model/colour.dart';
import 'package:slide_puzzle_prototype/model/providermodel.dart';
import 'package:slide_puzzle_prototype/timer/stopwatch.dart';

import 'components/buttons.dart';
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
          child: ChangeNotifierProvider<ProviderModel>(
              create: (context) => ProviderModel(),
              builder: (context, child) {
                return Row(
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
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const StopWatchWidget(),
                                  const Expanded(child: MovesShower()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      ResetButton(),
                                      NewGameButton(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Provider.of<ProviderModel>(context).wonGame
                                ? const StatsShower()
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Image.asset("assets/mixdesk.png",
                                            fit: BoxFit.contain),
                                      ),
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                );
              }),
        ),
      ],
    );
  }
}
