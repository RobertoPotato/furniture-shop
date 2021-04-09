import 'package:flutter/material.dart';

import '../constants.dart';

class CartDetailRow extends StatelessWidget {
  final String item;
  final String description;

  const CartDetailRow(
      {Key key, @required this.item, @required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: kGreyText.copyWith(fontSize: 22),
          ),
          Text(
            description,
            style: kHeadingStyle,
          ),
        ],
      ),
    );
  }
}
