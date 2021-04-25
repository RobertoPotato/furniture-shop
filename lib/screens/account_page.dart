import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/components/purchase_stat_component.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/account_controller.dart';

Widget buildAccountPage() {
  final accountController = Get.find<AccountController>();
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Account",
                    style: kAppTitleStyle,
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
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: kColDarkBrownAccent,
                        backgroundImage: AssetImage("images/sit.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        child: Material(
                          borderRadius: BorderRadius.circular(24.0),
                          color: kColDarkBrown,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 28,
                              color: kColBackGround,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "@super_user ",
                    style: kGreyText.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: kColDarkBrown),
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
        ],
      );
    }),
  );
}
