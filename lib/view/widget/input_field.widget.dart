import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Validator Typedef
typedef Validate = String? Function(dynamic value);

class FormFieldRounded extends StatelessWidget {
  final double widht;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Validate? validate;
  final String? initValue;
  final bool isMultiline;
  final onChange;
  final icon;
  TextStyle? labelStyle;

  FormFieldRounded(
      {this.widht = double.infinity,
      this.hintText = "Ex. Hint",
      Key? key,
      this.inputType = TextInputType.text,
      this.controller,
      this.validate,
      this.labelStyle,
      this.isMultiline = false,
      this.initValue,
      this.onChange,
      this.icon = "assets/imgs/user_ic.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hasError = false;
    var errMsg = "";
    var isViewPass = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter state) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 2),
                          color: MyColors.shadow.shade50,
                          blurRadius: 3.0,
                          spreadRadius: 1)
                    ]),
                child: TextFormField(
                  initialValue: initValue,
                  onChanged: onChange,
                  autofocus: false,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  controller: controller,
                  textAlign: TextAlign.start,
                  cursorColor: MyColors.textDark,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validate == null
                      ? null
                      : (value) {
                          debugPrint("validating");
                          String? valid = validate!(value);
                          if (valid == null) {
                            if (!hasError) return;
                            Future.delayed(Duration.zero, () async {
                              state(() {
                                hasError = false;
                              });
                            });
                          } else {
                            if (hasError) return;
                            Future.delayed(Duration.zero, () async {
                              state(() {
                                hasError = true;
                                errMsg = valid;
                              });
                            });
                          }
                          return null;
                        },
                  // keyboardType: inputType,
                  maxLines: isMultiline ? null : 1,
                  minLines: isMultiline ? 5 : 1,
                  keyboardType:
                      isMultiline ? TextInputType.multiline : inputType,
                  obscureText: ((inputType == TextInputType.visiblePassword) &&
                          !isViewPass)
                      ? true
                      : false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          icon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      suffixIcon: inputType == TextInputType.visiblePassword
                          ? GestureDetector(
                              onTap: () {
                                state(() {
                                  isViewPass = !isViewPass;
                                });
                              },
                              child: isViewPass
                                  ? const Icon(
                                      Icons.visibility,
                                      color: MyColors.filedIcon,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: MyColors.filedIcon,
                                    ),
                            )
                          : null,
                      // isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: hintText,
                      hintStyle: const TextStyle(color: MyColors.textHint)),
                ),
              ),
              hasError
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Text(
                          errMsg,
                          style: textTheme.subtitle2
                              ?.apply(color: Color(0xffe76969)),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }
}

class FormFieldWithBorder extends StatelessWidget {
  final double widht;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final String? validateText;
  final String? initValue;
  final bool isMultiline;
  final onChange;
  final icon;
  final TextStyle? labelStyle;
  final String? label;

  const FormFieldWithBorder(
      {this.widht = double.infinity,
      this.hintText = "Ex. Hint",
      Key? key,
      this.inputType = TextInputType.text,
      this.controller,
      this.validateText,
      this.labelStyle,
      this.isMultiline = false,
      this.initValue,
      this.onChange,
      this.icon = "assets/imgs/user_ic.png",
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isViewPass = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label == null
              ? SizedBox()
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: MyColors.textHint),
                  ),
                ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: widht,
            child: TextFormField(
              initialValue: initValue,
              onChanged: onChange,
              autofocus: false,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: MyColors.textDark,
              validator: validateText == null
                  ? null
                  : (value) {
                      if (value == null || value.isNotEmpty)
                        return validateText;
                    },
              // keyboardType: inputType,
              maxLines: isMultiline ? null : 1,
              minLines: isMultiline ? 5 : 1,
              keyboardType: isMultiline ? TextInputType.multiline : inputType,
              obscureText:
                  ((inputType == TextInputType.visiblePassword) && !isViewPass)
                      ? true
                      : false,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  // isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: MyColors.borderDark, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: MyColors.borderDark, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: MyColors.borderDark, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: MyColors.textHint)),
            ),
          )
        ],
      ),
    );
  }
}
