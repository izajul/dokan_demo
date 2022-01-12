import 'package:dokan/view/reuseable/filter_bar.reuseable.dart';
import 'package:dokan/view/reuseable/product_card.reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.only(top: 80, bottom: 50),
            childAspectRatio: 16 / 29,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(10, (index) => ProductCard()),
          ),
          FilterBar(),
        ],
      ),
    );
  }
}
