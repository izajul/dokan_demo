import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerDialog extends StatelessWidget {
  const SpinnerDialog({Key? key}) : super(key: key);

  SpinnerDialog.show(BuildContext context, {Key? key}) : super(key: key) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (_, __, ___) {
        return const SpinnerDialog();
      },
      transitionBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
            child: SpinKitPouringHourGlassRefined(
      color: MyColors.primaryAccent,
      size: 80.0,
    )));
  }
}
