import 'package:dokan/services/filter.service.dart';
import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({Key? key, this.onSelect}) : super(key: key);
  final onSelect;

  @override
  Widget build(BuildContext context) {
    var dropdownValue = "Sort by";
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 30,
          color: MyColors.textHint,
        ),
        style: const TextStyle(
            color: MyColors.textHint,
            fontSize: 17,
            fontWeight: FontWeight.w400),
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          if (newValue == "Sort by") {
            onSelect(SortBy.NONE);
          }
          if (newValue == "Price Low>Hight") {
            onSelect(SortBy.LOWTOHIGHPRICE);
          }
          if (newValue == "Price High>Low") {
            onSelect(SortBy.HIGHTOLOWPRICE);
          }
          if (newValue == "Top Rated") {
            onSelect(SortBy.TOPRATED);
          }
          if (newValue == "Best Selling") {
            onSelect(SortBy.BESTSEALS);
          }
        },
        items: const [
          "Sort by",
          "Price Low>Hight",
          "Price High>Low",
          "Top Rated",
          "Best Selling",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
