import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const routeName = "/";
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Center(
        child: Image.asset(
          "assets/imgs/logo_ic.png",
          width: 165,
          height: 50,
        ),
      )),
    );
  }
}
