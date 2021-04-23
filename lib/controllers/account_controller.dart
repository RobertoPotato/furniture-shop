import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  int productsInCart = 0;
  int productsInTransit = 0;
  int productsDelivered = 0;

  void updateProductsInTransit({@required int quantity}) {
    productsInTransit += quantity;
    update();
  }

  void updateProductsInCart({@required int quantity}) {
    productsInCart = quantity;
    update();
  }

  void updateProductsDelivered({@required int quantity}) {
    productsDelivered += quantity;
    update();
  }
}
