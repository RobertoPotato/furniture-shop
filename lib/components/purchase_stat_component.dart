import 'package:flutter/material.dart';

import '../constants.dart';

class PurchaseStatComponent extends StatelessWidget {
  final String title;
  final int quantity;
  final Color color;

  const PurchaseStatComponent(
      {Key key,
      @required this.title,
      @required this.quantity,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColDarkBrownAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            Text(
              this.quantity.toString(),
              style: kHeadingStyle.copyWith(color: kColDarkBrown),
            ),
            Text(this.title)
          ],
        ),
      ),
    );
  }
}
