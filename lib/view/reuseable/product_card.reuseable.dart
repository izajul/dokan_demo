import 'package:dokan/model/product.model.dart' as Product;
import 'package:dokan/utils/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.item, {Key? key}) : super(key: key);
  final Product.ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: MyColors.shadow.shade100,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 1))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 160 / 177,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: item.images?.isEmpty == true
                  ? Image.asset(
                      "assets/imgs/person_demo.png",
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(item.images?.first.src ?? ""),
            ),
          ),
          SizedBox(
              height: 68,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${item.name}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$${item.regularPrice}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: MyColors.textHint,
                        decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "\$${item.price}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )),
          /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "120 Sold",
                  style: textTheme.subtitle2,
                ),
              )),*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RatingBarIndicator(
                      rating: double.parse(item.averageRating ?? "0.0"),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                  )),
              Text(
                "(${item.ratingCount})",
                style: const TextStyle(color: Colors.amber, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
