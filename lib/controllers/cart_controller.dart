import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:woody/models/cart_product_model.dart';
import 'package:woody/models/product_model.dart';

class CartController extends GetxController {
  /*
  TODO Create a new CartProduct class which extends the Product class
    and adds the count to track the number of a given item in the cart
  */
  List<CartProduct> cart = [];
  int deliveryAmountConsant = 1000;

  void addProductToCart({@required Product product}) {
    /// Check if item is in cart, if true, don't add it to cart else, add it to cart
    if (cart.contains(product.id)) {
      print("PRODUCT ALREADY IN CART");
    } else {
      CartProduct cartProduct = new CartProduct(product: product, count: 1);
      cart.add(cartProduct);
      update();
    }
  }

  void removeProductFromCart({@required int productId}) {
    cart.removeWhere((product) => product.product.id == productId);
    update();
  }

  void increaseItemCount({int productId}) {
    // Find the product that needs tochange
    var productToUpdate =
        cart.firstWhere((product) => product.product.id == productId);

    // Create the new updated product
    var newProduct = new CartProduct(
        product: productToUpdate.product, count: productToUpdate.count + 1);

    // Find the index of productToUpdate and replace it with the newProduct
    cart[cart.indexOf(productToUpdate)] = newProduct;
    update();
  }

  void decreaseItemCount({int productId}) {
    // Find the product that needs tochange
    var productToUpdate =
        cart.firstWhere((product) => product.product.id == productId);

    // Create the new updated product
    var newProduct = new CartProduct(
        product: productToUpdate.product, count: productToUpdate.count - 1);

    // Find the index of productToUpdate and replace it with the newProduct
    cart[cart.indexOf(productToUpdate)] = newProduct;
    update();
  }

  int getTotalPrice() {
    // For each cartProduct, multiply the count with the product price to get the total
    int totalPrice = cart.fold(
        0,
        (previousValue, cartProduct) =>
            previousValue + cartProduct.count * cartProduct.product.price);

    return totalPrice;
  }

  int calculateDelivery() {
    int deliveryPrice;
    if (cart.length < 2) {
      deliveryPrice = deliveryAmountConsant;
    } else {
      deliveryPrice = deliveryAmountConsant + 150 * cart.length;
    }

    return deliveryPrice;
  }

  double calculateTax({int totalPrice}) {
    double tax = 0.16 * totalPrice;
    return tax;
  }
}
