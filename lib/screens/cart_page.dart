import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/components/cart_detail_component.dart';
import 'package:woody/components/cart_product_component.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/cart_controller.dart';
import 'package:woody/data/product_data.dart';

final cartController = Get.put(CartController());

Widget buildCartPage() {
  return cartController.cart.length > 0
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
                                        description: "Ksh 75000"),
                                    CartDetailRow(
                                        item: "Tax", description: "Ksh 5000"),
                                    CartDetailRow(
                                        item: "Delivery",
                                        description: "Ksh 5000"),
                                    CartDetailRow(
                                        item: "Total",
                                        description: "Ksh 85000"),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {},
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
                  (context, index) => CartProduct(product: products[index]),
                  childCount: products == null ? 0 : products.length,
                ),
              ),
            ],
          ),
        );
}
