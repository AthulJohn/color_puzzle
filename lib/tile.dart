import 'package:flutter/widgets.dart';

import 'model/colour.dart';

class TileData {
  bool isempty = true;
  bool selected = false;
  int number = 0;
  int infdir = 0;
  Widget? fillicon;
  TileData({required this.isempty, required this.number, this.fillicon});
}
