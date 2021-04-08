import 'package:flutter/material.dart';
import '../constants.dart';

class ProductController{
  Widget stockMessage({@required int stockRem}) {
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
}