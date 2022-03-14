import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../tile.dart';
import '../widget.dart';

class ProviderModel extends ChangeNotifier {
  int time = 0;
  int moves = 0;
  List<int?> starttiles = [], endtiles = [], resettiles = [];
  List<List<TileData>> tiles = [];
  ScrollController sc = ScrollController();
  bool wonGame = false;
  void reset() {
    time = 0;
    moves = 0;
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tiles[i][j].isempty = false;
        tiles[i][j].number = resettiles[i * 4 + j] ?? 0;
        tiles[i][j].fillicon = null;
      }
    }
    starttiles = [];
    starttiles.addAll(resettiles);
    notifyListeners();
  }

  void newGame() {
    time = 0;
    moves = 0;
    generate();
    notifyListeners();
  }

  void setTime() {
    if (!wonGame) {
      time++;
    }
    notifyListeners();
  }

  void addMove() {
    moves++;
    notifyListeners();
  }

  bool compareList(List<int?> l1, List<int?> l2) {
    if (l1.length != l2.length) return false;
    for (int i = 0; i < l1.length; i++) {
      if (l1[i] == null && l2[i] == null) {
        continue;
      } else if (l1[i] == null || l2[i] == null) {
        return false;
      }
      if (l1[i] == l2[i]!) {
        continue;
      }
      return false;
    }
    return true;
  }

  void showOptions(int i, int j) {
    if (tiles[i][j].isempty) {
      return;
    }
    for (List l in tiles) {
      for (TileData t in l) {
        t.fillicon = null;
      }
    }
    if (i != 0) {
      tiles[i - 1][j].infdir = 2;
      if (tiles[i - 1][j].isempty) {
        tiles[i - 1][j].fillicon = const ArrowWidget();
      } else {
        tiles[i - 1][j].fillicon = const MixWidget();
      }
    }
    if (i != tiles.length - 1) {
      tiles[i + 1][j].infdir = 0;
      if (tiles[i + 1][j].isempty) {
        tiles[i + 1][j].fillicon = const ArrowWidget();
      } else {
        tiles[i + 1][j].fillicon = const MixWidget();
      }
    }
    if (j != 0) {
      tiles[i][j - 1].infdir = 1;
      if (tiles[i][j - 1].isempty) {
        tiles[i][j - 1].fillicon = const ArrowWidget();
      } else {
        tiles[i][j - 1].fillicon = const MixWidget();
      }
    }
    if (j != tiles[i].length - 1) {
      tiles[i][j + 1].infdir = 3;
      if (tiles[i][j + 1].isempty) {
        tiles[i][j + 1].fillicon = const ArrowWidget();
      } else {
        tiles[i][j + 1].fillicon = const MixWidget();
      }
    }
  }

  void removeAllOptions() {
    for (List l in tiles) {
      for (TileData t in l) {
        t.fillicon = null;
        t.selected = false;
      }
    }
  }

  void splitCell(int i, int j) {
    tiles[i][j].isempty = false;
    if (tiles[i][j].infdir == 0) {
      int temp = tiles[i - 1][j].number;
      tiles[i - 1][j].number = (temp / 2.0).ceil();
      tiles[i][j].number = (temp / 2.0).floor();
      // tiles[i][j].number = tiles[i - 1][j].number;
      // tiles[i - 1][j].isempty = true;
      starttiles[(i - 1) * 4 + j] = tiles[i - 1][j].number;
    } else if (tiles[i][j].infdir == 1) {
      int temp = tiles[i][j + 1].number;
      tiles[i][j + 1].number = (temp / 2.0).ceil();
      tiles[i][j].number = (temp / 2.0).floor();
      // tiles[i][j].number = tiles[i][j + 1].number;
      // tiles[i][j + 1].isempty = true;
      starttiles[(i) * 4 + j + 1] = tiles[i][j + 1].number;
    } else if (tiles[i][j].infdir == 2) {
      int temp = tiles[i + 1][j].number;
      tiles[i + 1][j].number = (temp / 2.0).ceil();
      tiles[i][j].number = (temp / 2.0).floor();
      // tiles[i][j].number = tiles[i + 1][j].number;
      // tiles[i + 1][j].isempty = true;
      starttiles[(i + 1) * 4 + j] = tiles[i + 1][j].number;
    } else if (tiles[i][j].infdir == 3) {
      int temp = tiles[i][j - 1].number;
      tiles[i][j - 1].number = (temp / 2.0).ceil();
      tiles[i][j].number = (temp / 2.0).floor();
      // tiles[i][j - 1].isempty = true;
      starttiles[(i) * 4 + j - 1] = tiles[i][j - 1].number;
    }
  }

  void mergeCells(int i, int j) {
    if (tiles[i][j].infdir == 0) {
      tiles[i][j].number = tiles[i - 1][j].number + tiles[i][j].number;

      tiles[i - 1][j].isempty = true;
      starttiles[(i - 1) * 4 + j] = null;
    } else if (tiles[i][j].infdir == 1) {
      tiles[i][j].number = tiles[i][j].number + tiles[i][j + 1].number;

      tiles[i][j + 1].isempty = true;
      starttiles[(i) * 4 + j + 1] = null;
    } else if (tiles[i][j].infdir == 2) {
      tiles[i][j].number = tiles[i][j].number + tiles[i + 1][j].number;

      tiles[i + 1][j].isempty = true;
      starttiles[(i + 1) * 4 + j] = null;
    } else if (tiles[i][j].infdir == 3) {
      tiles[i][j].number = tiles[i][j].number + tiles[i][j - 1].number;
      tiles[i][j - 1].isempty = true;
      starttiles[(i) * 4 + j - 1] = null;
    }
  }

  void processClick(int i, int j) {
    if (tiles[i][j].selected) {
      removeAllOptions();
    } else if (tiles[i][j].fillicon == null) {
      showOptions(i, j);
      tiles[i][j].selected = true;
    } else {
      addMove();
      removeAllOptions();
      if (tiles[i][j].isempty) {
        splitCell(i, j);
      } else {
        mergeCells(i, j);
      }
      starttiles[i * 4 + j] = tiles[i][j].number;

      if (compareList(starttiles, endtiles)) {
        wonGame = true;

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text("You Win!"),
        //         actions: <Widget>[
        //           TextButton(
        //             child: Text("OK"),
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //           )
        //         ],
        //       );
        //     });
      }
    }
    notifyListeners();
  }

  void findsolution() {
    for (int i = 0; i < 40; i++) {
      int ii = Random().nextInt(4);
      int j = Random().nextInt(4);
      if (endtiles[ii * 4 + j] == null) continue;
      int dir = Random().nextInt(4);
      int addr = 0;
      if (dir == 0 && ii == 0) dir = 2;
      if (dir == 2 && ii == 3) dir = 0;
      if (dir == 1 && j == 3) dir = 3;
      if (dir == 3 && j == 0) dir = 1;
      switch (dir) {
        case 0:
          addr = -4;
          break;
        case 1:
          addr = 1;
          break;
        case 2:
          addr = 4;
          break;
        case 3:
          addr = -1;
          break;
      }
      if (endtiles[ii * 4 + j + addr] == null) {
        int temp = endtiles[ii * 4 + j] ?? 0;
        endtiles[ii * 4 + j] = (temp / 2.0).ceil();
        endtiles[ii * 4 + j + addr] = (temp / 2.0).floor();
        // endtiles[ii * 4 + j + addr] = endtiles[ii * 4 + j];
      } else {
        endtiles[ii * 4 + j + addr] =
            (endtiles[ii * 4 + j + addr] ?? 0) + (endtiles[ii * 4 + j] ?? 0);
        endtiles[ii * 4 + j] = null;
      }
      // endtiles[ii * 4 + j] = null;
    }
  }

  void generate() {
    tiles.clear();
    starttiles.clear();
    endtiles.clear();
    resettiles.clear();
    wonGame = false;
    for (int i = 0; i < 4; i++) {
      tiles.add([]);
      for (int j = 0; j < 4; j++) {
        {
          tiles[i].add(TileData(
            isempty: false,
            number: Random().nextInt(10),
            fillicon: null,
          ));
        }
        starttiles.add(tiles[i][j].number);
      }
    }
    endtiles.addAll(starttiles);
    resettiles.addAll(starttiles);

    findsolution();
  }

  void scrollToHowTo(double off) {
    sc.animateTo(off,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
