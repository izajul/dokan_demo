import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({Key? key, required this.list}) : super(key: key);
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    list.insert(0, "Sort by");
    var dropdownValue = list.first;
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
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
