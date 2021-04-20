import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/components/cart_detail_component.dart';
import 'package:woody/components/cart_product_component.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/cart_controller.dart';

final cartController = Get.find<CartController>();
Widget buildCartPage() {
  return GetBuilder<CartController>(builder: (_) {
    return cartController.cart.length == 0
        ? Center(
            child: Text(
              "Nothing in cart",
              style:
                  kGreyText.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomScrollView(
              slivers: [
                MySpacer(height: 25.0),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cart",
                        style: kAppTitleStyle,
                      ),
                      GestureDetector(
                          onTap: () {
                            cartController.buildPricing();
                            Get.bottomSheet(
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: Wrap(
                                    children: [
                                      CartDetailRow(
                                        item: "Sub Total",
                                        description:
                                            "Ksh ${cartController.costs.subTotal}",
                                      ),
                                      CartDetailRow(
                                        item: "Tax",
                                        description:
                                            "Ksh ${cartController.costs.tax}",
                                      ),
                                      CartDetailRow(
                                        item: "Delivery",
                                        description:
                                            "Ksh ${cartController.costs.delivery}",
                                      ),
                                      CartDetailRow(
                                        item: "Total",
                                        description:
                                            "Ksh ${cartController.costs.total}",
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            cartController.buyNow(
                                                products: cartController.cart);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Checkout",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: kColDarkBrown,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_downward_rounded,
                          )),
                    ],
                  ),
                ),
                MySpacer(height: 20.0),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CartProduct(
                        productCount: cartController.cart[index].count,
                        product: cartController.cart[index].product),
                    childCount: cartController.cart.length == 0
                        ? 0
                        : cartController.cart.length,
                  ),
                ),
              ],
            ),
          );
  });
}
