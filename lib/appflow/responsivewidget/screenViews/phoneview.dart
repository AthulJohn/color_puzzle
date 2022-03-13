import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_prototype/appflow/puzzlebody/puzzlebody.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/components/heading.dart';

import '../../../model/providermodel.dart';
import '../../../timer/stopwatch.dart';
import 'components/buttons.dart';
import 'components/moves.dart';
import 'components/stats.dart';

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
          child: ChangeNotifierProvider<ProviderModel>(
            create: (context) => ProviderModel(),
            builder: (context, child) {
              return Column(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const StopWatchWidget(),
                              const MovesShower(showPics: false),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  ResetButton(),
                                  NewGameButton()
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Provider.of<ProviderModel>(context).wonGame
                                ? const StatsShower()
                                : const Solution())
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
