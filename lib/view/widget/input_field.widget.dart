import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldRounded extends StatelessWidget {
  final double widht;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final String? validateText;
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
      this.validateText,
      this.labelStyle,
      this.isMultiline = false,
      this.initValue,
      this.onChange,
      this.icon = Icons.verified_user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var isViewPass = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter state) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: MyColors.shadow.shade50,
                      blurRadius: 3.0,
                      spreadRadius: 1)
                ]),
            child: TextFormField(
              initialValue: initValue,
              onChanged: onChange,
              autofocus: false,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: MyColors.textDark,
              validator: validateText == null
                  ? (value) {
                      if (value == null || value.isNotEmpty) return "sdf";
                    }
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
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      icon,
                      color: MyColors.borderDark,
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
                                  color: MyColors.borderDark,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: MyColors.borderDark,
                                ),
                        )
                      : null,
                  // isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: MyColors.textHint)),
            ),
          );
        },
      ),
    );
  }
}
