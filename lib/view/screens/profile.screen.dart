import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/reuseable/account_details.reuseable.dart';
import 'package:dokan/view/widget/expandable_list.widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 35,
              ),
              child: Center(
                child: Text(
                  "My Account",
                  style: textTheme.headline5?.apply(fontSizeFactor: 1.2),
                ),
              ),
            ),

            /// Choose Profile Image , Image Picker
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: Stack(
                  children: [
                    DottedBorder(
                        borderType: BorderType.Circle,
                        padding: EdgeInsets.all(5),
                        color: MyColors.primary,
                        dashPattern: const [4, 5],
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: Image.asset("assets/imgs/user_ic.png"),
                          ),
                        )),
                    /*Positioned(
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
                            backgroundColor: MyColors.primaryAccent.shade800,
                          ),
                        ),
                      ),*/
                  ],
                ),
              ),
            ),

            /// Name Field
            Center(
              child: Text(
                "User Name",
                style: textTheme.headline5?.apply(fontSizeFactor: 1.2),
              ),
            ),

            /// User mail
            Center(
              child: Text(
                "usermail@johnsmith.com",
                style: textTheme.bodyText1,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            /// Expandable List
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: MyColors.shadow.shade100,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(1, 2))
                  ]),
              child: ExpandableList(
                items: [
                  ExpandListViewItem(
                      item: AccountDetails(),
                      tabTitle: "Account",
                      leadingIcon: "assets/imgs/user_ic.png"),
                  ExpandListViewItem(
                      item: SizedBox(),
                      tabTitle: "Password",
                      leadingIcon: "assets/imgs/lock_ic.png"),
                  ExpandListViewItem(
                      item: SizedBox(),
                      tabTitle: "Notification",
                      leadingIcon: "assets/imgs/notification_ic.png"),
                  ExpandListViewItem(
                      item: SizedBox(),
                      tabTitle: "Wishlist (00)",
                      leadingIcon: "assets/imgs/favorite_ic.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
