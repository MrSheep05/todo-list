import 'package:flutter/material.dart';

extension Percentage on BuildContext {
  double heightPer(double p) => MediaQuery.sizeOf(this).height * p;

  double widthPer(double p) => MediaQuery.sizeOf(this).width * p;

  double vmin(double p) {
    var size = MediaQuery.sizeOf(this);
    return (size.width > size.height ? size.height : size.width) * p;
  }
}
