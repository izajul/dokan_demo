import 'package:dokan/utils/appearance.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({Key? key, this.label = "Label"}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary, width: 2),
                borderRadius: BorderRadius.circular(6)),
            child: Transform.scale(
              scale: 1.2,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    tristate: false,
                    activeColor: MyColors.primary,
                    splashRadius: 20,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: isChecked,
                    onChanged: (v) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    }),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
    ;
  }
}
