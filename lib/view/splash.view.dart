import 'package:dokan/services/local.service.dart';
import 'package:dokan/view/home.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.view.dart';

class Splash extends StatelessWidget {
  static const routeName = "/";

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkSession(context);
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

  void checkSession(BuildContext context) async {
    final session = await LocalService.hasSession();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context,
            session ? Home.routeName : Login.routeName, (route) => false));
  }
}
