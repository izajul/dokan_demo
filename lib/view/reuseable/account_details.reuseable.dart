import 'package:dokan/controller/profile.controller.dart';
import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/widget/buttons.widget.dart';
import 'package:dokan/view/widget/input_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key);
  final ProfileController _controller = Get.find();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Obx(() {
          final info = _controller.profileInfo.value;
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              /// Email Field
              FormFieldWithBorder(
                hintText: "Ex. youremail@xmail.com",
                label: 'Email',
                inputType: TextInputType.emailAddress,
                initValue: info.email,
                onChange: (data) {
                  _controller.setData("email", data);
                },
              ),
              SizedBox(
                height: 10,
              ),

              /// F Name Field
              FormFieldWithBorder(
                hintText: "Ex. Wiliam",
                label: 'First Name',
                initValue: info.firstName,
                onChange: (data) {
                  _controller.setData("first_name", data);
                },
              ),

              SizedBox(
                height: 10,
              ),

              /// L Name Field
              FormFieldWithBorder(
                hintText: "Ex. Smith",
                label: 'Last Name',
                initValue: info.firstName,
                onChange: (data) {
                  _controller.setData("last_name", data);
                },
              ),

              SizedBox(
                height: 10,
              ),

              /// street  Address Field
              FormFieldWithBorder(
                hintText: "115/15 Mohakhali Suth Para, Dhaka",
                label: 'Street Address',
                initValue: info.description,
                onChange: (data) {
                  _controller.setData("description", data);
                },
              ),
              SizedBox(
                height: 10,
              ),

              /// Blog Filed
              FormFieldWithBorder(
                hintText: "Ex. https://yourdomain.com",
                label: 'Link',
                initValue: info.url,
                onChange: (data) {
                  _controller.setData("url", data);
                },
              ),

              /*SizedBox(
                height: 10,
              ),

              /// Zip Code Filed
              FormFieldWithBorder(
                hintText: "1213",
                label: 'Zip Code',
                inputType: TextInputType.number,
                widht: 100,
              ),*/

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
                        child: _controller.isUpdating.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonWithRipple(
                                background: MyColors.successColor,
                                onPress: () {
                                  _controller.updateProfile();
                                },
                                text: Text(
                                  "Save",
                                  style: textTheme.button
                                      ?.apply(color: Colors.white),
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
        }));
  }
}
