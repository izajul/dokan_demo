import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/widget/buttons.widget.dart';
import 'package:dokan/view/widget/input_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const routeName = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 83),
                  child: Center(
                    child: Image.asset(
                      "assets/imgs/logo_ic.png",
                      width: 165,
                      height: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: textTheme.headline5?.apply(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FormFieldRounded(
                  hintText: "Email",
                  icon: "assets/imgs/email_ic.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormFieldRounded(
                  hintText: "Password",
                  inputType: TextInputType.visiblePassword,
                  icon: "assets/imgs/lock_ic.png",
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        //todo goto reset password
                      },
                      child: Text(
                        "Forget Password?",
                        style: textTheme.subtitle1,
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                ButtonWithRipple(
                  onPress: () {},
                  text: Text(
                    "Login",
                    style: textTheme.button?.apply(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 56,
                          minHeight: 56,
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/imgs/fb_ic.png",
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 56,
                          minHeight: 56,
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/imgs/google_ic.png",
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        //todo goto reset password
                      },
                      child: Text(
                        "Create New Account?",
                        style: textTheme.subtitle1?.apply(fontSizeDelta: 2),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
