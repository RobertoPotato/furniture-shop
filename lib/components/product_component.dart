import 'package:flutter/material.dart';
import 'package:woody/constants.dart';

class ProductComponent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  final int stock;

  const ProductComponent(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.stock})
      : super(key: key);

  Widget stockMessage({int stockRem}) {
    Widget msg;

    if (stockRem < 6) {
      msg = Text(
        "$stockRem Item(s) left",
        style: kRedText,
      );
    } else if (stockRem < 15) {
      msg = Text(
        "Low in stock",
        style: kRedText.copyWith(
          color: Colors.orange,
        ),
      );
    } else {
      msg = Text(
        "In stock",
        style: kRedText.copyWith(
          color: Colors.green,
        ),
      );
    }

    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: kColBackGround,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
            ),
            Text(
              title,
              style: kHeadingStyle,
            ),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kGreyText,
            ),
            Text(
              "Ksh $price",
              style: kHeadingStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                stockMessage(stockRem: stock),
                Icon(
                  Icons.add_box_rounded,
                  size: 30,
                  color: kColDarkBrown,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
