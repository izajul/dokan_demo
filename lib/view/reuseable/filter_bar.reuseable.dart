import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/widget/dropdown.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: MyColors.shadow.shade100,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(1, 1))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: const EdgeInsets.all(10)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/imgs/filter_ic.png",
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Filter",
                      style: TextStyle(
                          color: MyColors.textHint,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                CustomDropdown(
                  list: [],
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/imgs/option_ic.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
