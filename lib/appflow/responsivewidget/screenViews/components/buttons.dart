import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/dimensionchecker.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/dmnsn_enum.dart';

import '../../../../model/providermodel.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff4855B2)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        padding: MaterialStateProperty.all(
            checkDimensions(context) != Dmnsn.desktop
                ? const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                : const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0)),
      ),
      onPressed: () {
        Provider.of<ProviderModel>(context, listen: false).newGame();
      },
      child: const Text('New Game'),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff4855B2)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        padding: MaterialStateProperty.all(
            checkDimensions(context) != Dmnsn.desktop
                ? const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                : const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0)),
      ),
      onPressed: () {
        Provider.of<ProviderModel>(context, listen: false).reset();
      },
      child: const Text('Reset'),
    );
  }
}
