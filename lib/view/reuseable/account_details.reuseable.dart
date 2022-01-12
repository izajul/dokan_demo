import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/widget/buttons.widget.dart';
import 'package:dokan/view/widget/input_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        /// Email Field
        FormFieldWithBorder(
          hintText: "youremail@xmail.com",
          label: 'Email',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 10,
        ),

        /// Full Name Field
        FormFieldWithBorder(
          hintText: "Wiliam Smith",
          label: 'Full Name',
        ),

        SizedBox(
          height: 10,
        ),

        /// street  Address Field
        FormFieldWithBorder(
          hintText: "115/15 Mohakhali Suth Para, Dhaka",
          label: 'Street Address',
        ),
        SizedBox(
          height: 10,
        ),

        /// Blog Filed
        FormFieldWithBorder(
          hintText: "Unit 512",
          label: 'Apt, Suite, Bldg (Optional)',
        ),

        SizedBox(
          height: 10,
        ),

        /// Zip Code Filed
        FormFieldWithBorder(
          hintText: "1213",
          label: 'Zip Code',
          inputType: TextInputType.number,
          widht: 100,
        ),

        SizedBox(
          height: 20,
        ),

        /// Action Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Flexible(
                  child: ButtonOutLine(
                borderRadious: 10.0,
                borderColor: MyColors.borderDark,
                onPress: () {
                  ///todo  need to implement throw global to handle action to unexpended
                },
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
                  ///todo
                },
                text: Text(
                  "Save",
                  style: textTheme.button?.apply(color: Colors.white),
                ),
              )),
            ],
          ),
        ),

        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
