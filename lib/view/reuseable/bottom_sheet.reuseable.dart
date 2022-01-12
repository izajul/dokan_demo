import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/widget/buttons.widget.dart';
import 'package:dokan/view/widget/checkbox.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomSheet extends StatelessWidget {
  const MainBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      height: 424,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 50,
              child: Divider(
                color: MyColors.primary.shade100,
                height: 5,
                thickness: 4,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 0,
            child: Text(
              "Filter",
              style: textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Flexible(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                  CustomCheckbox(
                    label: "Label",
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Flexible(
              flex: 0,
              child: Row(
                children: [
                  Flexible(
                      child: ButtonOutLine(
                    borderRadious: 10.0,
                    borderColor: MyColors.borderDark,
                    onPress: () => Navigator.pop(context),
                    text: Text(
                      "Cancel",
                      style: textTheme.button,
                    ),
                  )),
                  SizedBox(
                    width: 23,
                  ),
                  Flexible(
                      child: ButtonWithRipple(
                    background: MyColors.successColor,
                    onPress: () {
                      ///todo need to apply the filter
                    },
                    text: Text(
                      "Apply",
                      style: textTheme.button?.apply(color: Colors.white),
                    ),
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
