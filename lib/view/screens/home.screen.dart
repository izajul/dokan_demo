import 'package:dokan/controller/product.controller.dart';
import 'package:dokan/view/reuseable/filter_bar.reuseable.dart';
import 'package:dokan/view/reuseable/product_card.reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Stack(
        children: [
          Obx(() {
            final list = _controller.filteredList.value;
            if (_controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.count(
              padding: const EdgeInsets.only(top: 80, bottom: 50),
              childAspectRatio: 16 / 29,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                  list.length, (index) => ProductCard(list[index])),
            );
          }),
          FilterBar(),
        ],
      ),
    );
  }
}
