import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slide_puzzle_prototype/constants/consts.dart';
import 'package:slide_puzzle_prototype/model/colour.dart';

import '../../tile.dart';
import '../../widget.dart';

// import '../../tile.dart';
List<Colour?> starttiles = [], endtiles = [], resettiles = [];

class PuzzleBody extends StatefulWidget {
  const PuzzleBody({Key? key}) : super(key: key);

  @override
  State<PuzzleBody> createState() => _PuzzleBodyState();
}

class _PuzzleBodyState extends State<PuzzleBody> {
  List<List<TileData>> tiles = [
    [
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false)
    ],
    [
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false)
    ],
    [
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false)
    ],
    [
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false),
      TileData(color: clrs[Random().nextInt(clrs.length)], isempty: false)
    ],
  ];

  void reset() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tiles[i][j].isempty = false;
        tiles[i][j].color = resettiles[i * 4 + j] ?? Colour(0, 0, 0, 1);
        tiles[i][j].fillicon = null;
      }
    }
    starttiles = [];
    starttiles.addAll(resettiles);
  }

  Colour combine(Colour c1, Colour c2) {
    Colour c3 = Colour(
      (c1.red + c2.red),
      (c1.green + c2.green),
      (c1.blue + c2.blue),
      c1.d + c2.d,
    );
    return c3;
  }

  void findsolution() {
    for (int i = 0; i < 20; i++) {
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
        endtiles[ii * 4 + j + addr] = endtiles[ii * 4 + j];
      } else {
        endtiles[ii * 4 + j + addr] = combine(
            endtiles[ii * 4 + j + addr] ?? Colour(0, 0, 0, 1),
            endtiles[ii * 4 + j] ?? Colour(0, 0, 0, 1));
      }
      endtiles[ii * 4 + j] = null;
    }
  }

  void generate() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tiles[i][j].color = clrs[Random().nextInt(clrs.length)];
        starttiles.add(tiles[i][j].color);
      }
    }
    endtiles.addAll(starttiles);
    resettiles.addAll(starttiles);
    findsolution();
  }

  Color? toColor(Colour? col) {
    if (col == null) return null;
    return Color.fromRGBO((col.red / col.d).round(),
        (col.green / col.d).round(), (col.blue / col.d).round(), 1);
  }

  bool compareList(List<Colour?> l1, List<Colour?> l2) {
    if (l1.length != l2.length) return false;
    for (int i = 0; i < l1.length; i++) {
      if (l1[i] == null && l2[i] == null) {
        continue;
      } else if (l1[i] == null || l2[i] == null) {
        return false;
      }
      if (l1[i]!.isEqual(l2[i]!)) {
        continue;
      }
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    generate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < tiles.length; i++)
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int j = 0; j < tiles[i].length; j++)
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: InkWell(
                      onTap: () {
                        if (tiles[i][j].fillicon == null) {
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
                              tiles[i - 1][j].fillicon = const ArrowWidget(0);
                            } else {
                              tiles[i - 1][j].fillicon = const MixWidget();
                            }
                          }
                          if (i != tiles.length - 1) {
                            tiles[i + 1][j].infdir = 0;
                            if (tiles[i + 1][j].isempty) {
                              tiles[i + 1][j].fillicon = const ArrowWidget(2);
                            } else {
                              tiles[i + 1][j].fillicon = const MixWidget();
                            }
                          }
                          if (j != 0) {
                            tiles[i][j - 1].infdir = 1;
                            if (tiles[i][j - 1].isempty) {
                              tiles[i][j - 1].fillicon = const ArrowWidget(3);
                            } else {
                              tiles[i][j - 1].fillicon = const MixWidget();
                            }
                          }
                          if (j != tiles[i].length - 1) {
                            tiles[i][j + 1].infdir = 3;
                            if (tiles[i][j + 1].isempty) {
                              tiles[i][j + 1].fillicon = const ArrowWidget(1);
                            } else {
                              tiles[i][j + 1].fillicon = const MixWidget();
                            }
                          }
                        } else {
                          for (List l in tiles) {
                            for (TileData t in l) {
                              t.fillicon = null;
                            }
                          }
                          if (tiles[i][j].isempty) {
                            tiles[i][j].isempty = false;
                            if (tiles[i][j].infdir == 0) {
                              tiles[i][j].color = tiles[i - 1][j].color;
                              tiles[i - 1][j].isempty = true;
                              starttiles[(i - 1) * 4 + j] = null;
                            } else if (tiles[i][j].infdir == 1) {
                              tiles[i][j].color = tiles[i][j + 1].color;
                              tiles[i][j + 1].isempty = true;
                              starttiles[(i) * 4 + j + 1] = null;
                            } else if (tiles[i][j].infdir == 2) {
                              tiles[i][j].color = tiles[i + 1][j].color;
                              tiles[i + 1][j].isempty = true;
                              starttiles[(i + 1) * 4 + j] = null;
                            } else if (tiles[i][j].infdir == 3) {
                              tiles[i][j].color = tiles[i][j - 1].color;
                              tiles[i][j - 1].isempty = true;
                              starttiles[(i) * 4 + j - 1] = null;
                            }
                          } else {
                            if (tiles[i][j].infdir == 0) {
                              tiles[i][j].color = combine(
                                tiles[i - 1][j].color,
                                tiles[i][j].color,
                              );

                              tiles[i - 1][j].isempty = true;
                              starttiles[(i - 1) * 4 + j] = null;
                            } else if (tiles[i][j].infdir == 1) {
                              tiles[i][j].color = combine(
                                  tiles[i][j].color, tiles[i][j + 1].color);

                              tiles[i][j + 1].isempty = true;
                              starttiles[(i) * 4 + j + 1] = null;
                            } else if (tiles[i][j].infdir == 2) {
                              tiles[i][j].color = combine(
                                  tiles[i][j].color, tiles[i + 1][j].color);

                              tiles[i + 1][j].isempty = true;
                              starttiles[(i + 1) * 4 + j] = null;
                            } else if (tiles[i][j].infdir == 3) {
                              tiles[i][j].color = combine(
                                  tiles[i][j].color, tiles[i][j - 1].color);
                              tiles[i][j - 1].isempty = true;
                              starttiles[(i) * 4 + j - 1] = null;
                            }
                          }
                          starttiles[i * 4 + j] = tiles[i][j].color;
                        }
                        if (compareList(starttiles, endtiles)) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("You Win!"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                        setState(() {});
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          if (!tiles[i][j].isempty)
                            RotatedBox(
                              quarterTurns: Random().nextInt(3),
                              child: Image.asset(
                                "assets/${Random().nextInt(2) + 1}.png",
                                color: toColor(tiles[i][j].color) ??
                                    Colors.transparent,
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                          tiles[i][j].fillicon ?? Container(),
                        ],
                      ),
                    ),
                  ),
                ),
            ]),
          )
      ],
    );
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int j = 0; j < 4; j++)
                Container(
                    height: 40,
                    width: 40,
                    color: toColor(endtiles[i * 4 + j]) ?? Colors.transparent)
            ],
          ),
      ],
    );
  }
}
