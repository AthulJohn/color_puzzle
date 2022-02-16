class Colour {
  double green = 0, d = 1, red = 0, blue = 0;
  Colour(this.red, this.green, this.blue, this.d);
  @override
  String toString() {
    return '$red/$d:$green/$d:$blue/$d';
  }

  bool isEqual(Colour c) {
    return (c.blue / c.d).floor() == (blue / d).floor() &&
        (c.green / c.d).floor() == (green / d).floor() &&
        (c.red / c.d).floor() == (red / d).floor();
  }
}
