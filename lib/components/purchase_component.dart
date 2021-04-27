import 'package:flutter/material.dart';
import 'package:woody/constants.dart';
import 'package:woody/models/purchased_product.dart';

class PurchaseComponent extends StatelessWidget {
  final PurchasedProduct purchase;

  const PurchaseComponent({Key key, @required this.purchase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            purchase.products[0].product.imageUrl,
          ),
          Text("${purchase.products.length} items"),
          Text(
            purchase.date,
            style: kGreyText,
          ),
        ],
      ),
    );
  }
}
