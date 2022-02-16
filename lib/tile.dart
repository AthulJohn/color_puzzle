import 'package:flutter/widgets.dart';

import 'model/colour.dart';

class TileData {
  bool isempty = true;
  Colour color = Colour(
    0,
    0,
    0,
    1,
  );
  int infdir = 0;
  Widget? fillicon;
  TileData({required this.isempty, required this.color, this.fillicon});
}
