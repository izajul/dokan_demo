import 'package:dokan/controller/product.controller.dart';
import 'package:dokan/model/product.model.dart';
import 'package:dokan/utils/appearance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({Key? key, required this.category}) : super(key: key);
  final Category category;
  final ProductController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final catList = _controller.filterWith;
    bool isChecked = catList.contains(category);
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
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
                      if (v == true) {
                        _controller.addFilter(category);
                      } else {
                        _controller.removeFilter(category);
                      }
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
            "${category.name}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
    ;
  }
}
