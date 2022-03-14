import 'package:flutter/material.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/dimensionchecker.dart';
import 'package:slide_puzzle_prototype/appflow/responsivewidget/dmnsn_enum.dart';

class HowTo extends StatelessWidget {
  const HowTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            checkDimensions(context) == Dmnsn.desktop
                ? "assets/bg.png"
                : "assets/bgphone.png",
          ),
          repeat: ImageRepeat.repeatY,
          fit: BoxFit.contain,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Aim",
            style: TextStyle(
                fontFamily: "Swanky",
                color: Color(0xff4855B2),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          Text(
            "\nThe Number grid on the left side is your game board and the smaller grid on the right is the target board. Your aim is to make the game board look identical to the target board.",
            style: TextStyle(
              fontFamily: "Swanky",
              color: Color(0xff4855B2),
              fontSize: 30,
            ),
          ),
          Text(
            "\nGameplay",
            style: TextStyle(
                fontFamily: "Swanky",
                color: Color(0xff4855B2),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          Text(
            '''\nThe numbers in the game board can be added or splited. When you click on a number, icons will appear in the adjacent numbers. A + icon is shown if the adjacent space has a number, and clicking it will add the current number with that number.
    An adjacent vacant cell will be having a split icon. Clicking it will split the numbers between the current position and that position.''',
            style: TextStyle(
              fontFamily: "Swanky",
              color: Color(0xff4855B2),
              fontSize: 30,
            ),
          ),
          Text(
            "\nHow To",
            style: TextStyle(
                fontFamily: "Swanky",
                color: Color(0xff4855B2),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          Text(
            '''\nAdd:  Click on a number and then click on one of its adjacent numbers (The number which you want to add)
Split:  Click on a number and then click on one of its adjacent vacant space. The number will be divided into 2 halves, and both the cells will be occupied with one half each. If the number was odd, then it will be divided into 2 unequal parts(that differ by 1) and the upper part will stay in the previous position and the lower part will occupy in the adjacent cell.
Move:   There is no move option. So inorder to move a number, first you have to Split and then add it into the new cell.''',
            style: TextStyle(
              fontFamily: "Swanky",
              color: Color(0xff4855B2),
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
