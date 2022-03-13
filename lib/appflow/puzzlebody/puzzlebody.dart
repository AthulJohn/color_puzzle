import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/screenViews/desktopview.dart';
import 'package:slide_puzzle_prototype/model/colour.dart';

import '../../model/providermodel.dart';
import '../../tile.dart';
import '../../widget.dart';
import '../responsivewidget/dimensionchecker.dart';
import '../responsivewidget/dmnsn_enum.dart';

// import '../../tile.dart';

class PuzzleBody extends StatefulWidget {
  const PuzzleBody({Key? key}) : super(key: key);

  @override
  State<PuzzleBody> createState() => _PuzzleBodyState();
}

class _PuzzleBodyState extends State<PuzzleBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderModel>(context, listen: false).generate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, data, child) {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < data.tiles.length; i++)
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int j = 0; j < data.tiles[i].length; j++)
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        data.processClick(i, j);
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          // fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            if (!data.tiles[i][j].isempty)
                              Text(data.tiles[i][j].number.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: checkDimensions(context) ==
                                                Dmnsn.phone ||
                                            checkDimensions(context) ==
                                                Dmnsn.tablet
                                        ? MediaQuery.of(context).size.width / 8
                                        : MediaQuery.of(context).size.width /
                                            15,
                                    color: const Color(0xff4855B2),
                                    fontFamily: "Crayon",
                                  )),
                            data.tiles[i][j].fillicon ?? Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
              ]),
            )
        ],
      );
    });
  }
}

class Solution extends StatelessWidget {
  const Solution({
    Key? key,
  }) : super(key: key);
  Color? toColor(Colour? col) {
    if (col == null) return null;
    return Color.fromRGBO((col.red / col.d).round(),
        (col.green / col.d).round(), (col.blue / col.d).round(), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int j = 0; j < 4; j++)
                Expanded(
                  child: Text(
                    Provider.of<ProviderModel>(context).endtiles[i * 4 + j] !=
                            null
                        ? " ${(Provider.of<ProviderModel>(context).endtiles[i * 4 + j])} "
                        : ' - ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff4855B2),
                      fontFamily: "Crayon",
                      fontSize: checkDimensions(context) == Dmnsn.phone
                          ? MediaQuery.of(context).size.width / 15
                          : checkDimensions(context) == Dmnsn.tablet
                              ? MediaQuery.of(context).size.width / 19
                              : MediaQuery.of(context).size.width / 30,
                    ),
                  ),
                )
            ],
          ),
      ],
    );
  }
}
