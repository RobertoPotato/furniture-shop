import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:woody/models/product_model.dart';

class CartController extends GetxController {
  /*
  TODO Create a new CartProduct class which extends the Product class
    and adds the count to track the number of a given item in the cart
  */
  List<Product> cart = [];

  void addProductToCart({@required Product product}) {
    cart.add(product);
    update();
  }

  void removeProductFromCart({@required int productId}) {
    cart.removeWhere((product) => product.id == productId);
    update();
  }

  void updateNumberInCart({@required String type, @required int itemId}) {
    // if cartItem.count < productItem.count and also greater than 0
    // if type ==  add, raise the count else, lower the count
  }
}
