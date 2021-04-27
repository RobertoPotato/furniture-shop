import 'package:woody/models/cart_product_model.dart';

class PurchasedProduct {
  final List<CartProduct> products;
  final date;

  PurchasedProduct(this.products, this.date);
}
