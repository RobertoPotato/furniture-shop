import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/account_controller.dart';
import 'package:woody/models/cart_product_model.dart';
import 'package:woody/models/product_model.dart';
import 'package:woody/models/purchase_costs_model.dart';

enum UpdateCount { ADD, REMOVE }

class CartController extends GetxController {
  /*
  TODO Create a new CartProduct class which extends the Product class
    and adds the count to track the number of a given item in the cart
  */
  List<CartProduct> cart = [];
  int deliveryAmountConsant = 1000;
  PurchaseCosts costs;
  var accountController = Get.find<AccountController>();

  void addProductToCart({@required Product product}) {
    /// Check if item is in cart, if true, don't add it to cart else, add it to cart

    if ((cart.firstWhere((prod) => prod.product.id == product.id,
            orElse: () => null)) !=
        null) {
      Get.defaultDialog(
          title: "${product.title}",
          middleText: "This product is already in your cart");
    } else {
      CartProduct cartProduct = new CartProduct(product: product, count: 1);
      cart.add(cartProduct);
      update();
      accountController.updateProductsInCart(quantity: cart.length);

      Get.snackbar(
        "${product.title}",
        "Successfully added to your cart",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kColBackGround,
        duration: Duration(seconds: 1),
      );
    }
  }

  // Simulate an order completion
  void buyNow({Product product, List<CartProduct> products}) {
    // If cart is empty, add this product to cart
    if (cart.isEmpty || cart.length == 0) {
      addProductToCart(product: product);
      accountController.updateProductsInTransit(quantity: cart.length);
      accountController.updateProductsInCart(quantity: 0);
      Get.snackbar(
        "Working",
        "Adding ${product.title} to your cart",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kColBackGround,
        duration: Duration(seconds: 1),
      );

      // After 1100ms (random time) show order completion prompt
      Future.delayed(Duration(milliseconds: 1100), () {
        Get.snackbar("Working",
            "Completing your order. (This doesn't actually do anything)",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kColBackGround,
            duration: Duration(milliseconds: 1500),
            showProgressIndicator: true);
      });
    } else {
      // Only Show order completion if cart isn't empty
      accountController.updateProductsInTransit(quantity: cart.length);
      accountController.updateProductsInCart(quantity: 0);
      Get.snackbar("Working",
          "Completing your order. (This doesn't actually do anything)",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kColBackGround,
          duration: Duration(seconds: 1),
          showProgressIndicator: true);
    }

    cart.clear();
    update();
  }

  void removeProductFromCart({@required int productId}) {
    cart.removeWhere((product) => product.product.id == productId);
    accountController.updateProductsInCart(quantity: cart.length);
    update();
  }

  void updateItemCount({
    @required int productId,
    @required int stock,
    @required UpdateCount type,
  }) {
    // Find the product that needs to change
    var productToUpdate =
        cart.firstWhere((product) => product.product.id == productId);

    // Create the new updated product
    // Find the index of productToUpdate
    // replace it with the newProduct if the count is between 1
    // and the maximum available stock

    print(
        "PRODUCT COUNT: ${productToUpdate.count}, \nSTOCK: ${productToUpdate.product.stock}");

    if (type == UpdateCount.ADD) {
      if (productToUpdate.count < productToUpdate.product.stock) {
        var newProduct = new CartProduct(
            product: productToUpdate.product, count: productToUpdate.count + 1);

        cart[cart.indexOf(productToUpdate)] = newProduct;
        update();
      }
    } else {
      if (productToUpdate.count > 1) {
        var newProduct = new CartProduct(
            product: productToUpdate.product, count: productToUpdate.count - 1);

        cart[cart.indexOf(productToUpdate)] = newProduct;
        update();
      }
    }
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
      // TODO Use product counts instead of just cart length
      deliveryPrice = deliveryAmountConsant + 150 * cart.length;
    }

    return deliveryPrice;
  }

  double calculateTax({int totalPrice}) {
    double tax = 0.16 * totalPrice;
    return tax;
  }

  void buildPricing() {
    int subTotal = getTotalPrice();
    int delivery = calculateDelivery();
    double tax = calculateTax(totalPrice: subTotal);
    double total = subTotal + delivery + tax;

    print(" ST: $subTotal \n D: $delivery \n T: $tax \n TTL: $total");

    costs = new PurchaseCosts(subTotal, tax, delivery, total);
    update();
  }
}
