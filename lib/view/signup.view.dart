import 'package:dokan/controller/signup.controller.dart';
import 'package:dokan/utils/appearance.dart';
import 'package:dokan/utils/functions.dart';
import 'package:dokan/view/login.view.dart';
import 'package:dokan/view/widget/buttons.widget.dart';
import 'package:dokan/view/widget/input_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registration extends StatelessWidget {
  static const routeName = "/registration";

  Registration({Key? key}) : super(key: key);

  final SignupController _controller = Get.put(SignupController());

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  /// Choose Profile Image ,
                  /// Image Picker
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 35),
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(80),
                                boxShadow: [
                                  BoxShadow(
                                      color: MyColors.shadow.shade100,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2))
                                ]),
                            child: SizedBox(
                              width: 110,
                              height: 110,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                child: Image.asset("assets/imgs/user_ic.png"),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton.small(
                                onPressed: () {
                                  // _takeImage(ImageSource.camera);
                                },
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                elevation: 5,
                                backgroundColor:
                                    MyColors.primaryAccent.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Name Field
                  FormFieldRounded(
                    hintText: "Username",
                    validate: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Username can not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _controller.setData("username", value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// Email Field
                  FormFieldRounded(
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                    icon: "assets/imgs/email_ic.png",
                    validate: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Username can not be empty";
                      }
                      if (!validEmail(value)) {
                        return "Email can not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _controller.setData("email", value);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  /// Password Field
                  FormFieldRounded(
                    hintText: "Password",
                    inputType: TextInputType.visiblePassword,
                    icon: "assets/imgs/lock_ic.png",
                    validate: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Password can not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _controller.setData("password", value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// Confirm Password Field
                  Obx(() {
                    final pass = _controller.payload.value;
                    return FormFieldRounded(
                      hintText: "Confirm Password",
                      inputType: TextInputType.visiblePassword,
                      icon: "assets/imgs/lock_ic.png",
                      validate: (value) {
                        if (value == null ||
                            value.toString().isEmpty ||
                            pass["password"] != value) {
                          return "Password dose not match";
                        }
                        return null;
                      },
                    );
                  }),

                  const SizedBox(
                    height: 70,
                  ),

                  /// Action Button
                  /// observable with Login State state
                  Obx(() {
                    if (_controller.isSignupComplete.value) {
                      Future.delayed(Duration.zero).then((value) =>
                          Navigator.pushNamedAndRemoveUntil(
                              context, Login.routeName, (route) => false));
                    }
                    if (_controller.isLoading.value) {
                      return const LinearProgressIndicator();
                    }
                    return ButtonWithRipple(
                      onPress: () {
                        if (_key.currentState?.validate() == false) {
                          return;
                        } else {
                          _controller.register();
                        }
                      },
                      text: Text(
                        "Sign Up",
                        style: textTheme.button?.apply(color: Colors.white),
                      ),
                    );
                  }),

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
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: textTheme.subtitle1?.apply(fontSizeDelta: 2),
                      ),
                      TextButton(
                        onPressed: () {
                          //todo goto reset password
                        },
                        child: Text(
                          "Login In",
                          style: textTheme.subtitle1?.apply(
                              fontSizeDelta: 2, color: MyColors.textLink),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
