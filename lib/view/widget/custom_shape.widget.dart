import 'package:flutter/cupertino.dart';

class BottomAppBarBorderShape extends ShapeBorder {
  BottomAppBarBorderShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  double holeSize = 70;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    print(rect.height);
    return Path()
      ..addPath(
          Path()
            ..moveTo(rect.width * 0.5889067, rect.height * 0.2576716)
            ..cubicTo(
                rect.width * 0.5845227,
                rect.height * 0.5068239,
                rect.width * 0.5468747,
                rect.height * 0.7014925,
                rect.width * 0.5010800,
                rect.height * 0.7014925)
            ..cubicTo(
                rect.width * 0.4566960,
                rect.height * 0.7014925,
                rect.width * 0.4199653,
                rect.height * 0.5186507,
                rect.width * 0.4137520,
                rect.height * 0.2805746)
            ..cubicTo(
                rect.width * 0.4124080,
                rect.height * 0.2531881,
                rect.width * 0.4010613,
                rect.height * 0.04719269,
                rect.width * 0.3621147,
                rect.height * 0.009333821)
            ..lineTo(rect.width * 0.02777787, rect.height * 0.009333821)
            ..cubicTo(rect.width * 0.01243653, rect.height * 0.009333821, 0,
                rect.height * 0.07894134, 0, rect.height * 0.1648060)
            ..lineTo(0, rect.height * 0.9888119)
            ..lineTo(rect.width, rect.height * 0.9888119)
            ..lineTo(rect.width, rect.height * 0.1648060)
            ..cubicTo(
                rect.width,
                rect.height * 0.07894134,
                rect.width * 0.9875627,
                rect.height * 0.009333821,
                rect.width * 0.9722213,
                rect.height * 0.009333821)
            ..lineTo(rect.width * 0.6378213, rect.height * 0.009333821)
            ..cubicTo(
                rect.width * 0.6033200,
                rect.height * 0.04376239,
                rect.width * 0.5914747,
                rect.height * 0.2127463,
                rect.width * 0.5889067,
                rect.height * 0.2576716)
            ..close(),
          rect.topLeft)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
