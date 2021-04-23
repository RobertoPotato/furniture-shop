import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/components/purchase_stat_component.dart';
import 'package:woody/components/review_component.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/account_controller.dart';
import 'package:woody/controllers/cart_controller.dart';
import 'package:woody/data/review_data.dart';

Widget buildAccountPage() {
  final accountController = Get.find<AccountController>();
  final cartController = Get.find<CartController>();
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
    ),
    child: GetBuilder<AccountController>(builder: (_) {
      return CustomScrollView(
        slivers: [
          MySpacer(height: 25.0),

          /// Header title and search area
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Account",
                    style: kAppTitleStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          MySpacer(height: 20.0),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Card(
                    child: Image.asset(
                      "images/sit.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Jane Doe",
                    style: kGreyText.copyWith(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MySpacer(height: 20.0),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PurchaseStatComponent(
                    title: "In Cart",
                    quantity: accountController.productsInCart,
                    color: Colors.orangeAccent),
                PurchaseStatComponent(
                    title: "In Transit",
                    quantity: accountController.productsInTransit,
                    color: Colors.tealAccent),
                PurchaseStatComponent(
                    title: "Delivered",
                    quantity: accountController.productsDelivered,
                    color: Colors.blueAccent),
              ],
            ),
          ),
          MySpacer(height: 20.0),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Container(
                child: reviews == null
                    ? Text(
                        "No reviews",
                        style: kGreyText,
                      )
                    : Text(
                        "You have ${reviews.length} reviews",
                        style: kGreyText,
                      ),
              ),
            ),
          ),
          MySpacer(height: 10.0),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ReviewComponent(
                review: reviews[index],
              ),
              childCount: reviews == null ? 0 : reviews.length,
            ),
          ),
        ],
      );
    }),
  );
}
