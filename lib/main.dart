import 'package:dokan/view/home.view.dart';
import 'package:dokan/view/login.view.dart';
import 'package:dokan/view/signup.view.dart';
import 'package:dokan/view/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'utils/appearance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return GetMaterialApp(
      title: 'Dokan Demo',
      theme: theme,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Splash.routeName,
      debugShowCheckedModeBanner: false,
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    Widget _nextPage;

    switch (settings.name) {
      case Login.routeName:
        _nextPage = Login();
        break;
      case Registration.routeName:
        _nextPage = Registration();
        break;
      case Home.routeName:
        _nextPage = const Home();
        break;
      default:
        _nextPage = const Splash();
    }

    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => _nextPage,
        transitionsBuilder: (_, anim1, __, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInSine;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: anim1.drive(tween),
            child: child,
          );
        });
  }
}
