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
    child: GetBuilder<AccountController>(
      builder: (_) {
        return CustomScrollView(
          slivers: [
            MySpacer(height: 25.0),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
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
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: kColDarkBrownAccent,
                        backgroundImage: AssetImage("images/sit.png"),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(24.0),
                        color: kColDarkBrown,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.settings,
                            size: 28,
                            color: kColBackGround,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "@Kraft",
                    style: kGreyText.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: kColDarkBrown),
                  ),
                  Text(
                    "Nairobi, Kenya",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            MySpacer(height: 10.0),
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
                      quantity: accountController.productsDelivered + 1,
                      color: Colors.blueAccent),
                ],
              ),
            ),
            MySpacer(height: 20.0),
            SliverToBoxAdapter(
              child: Text(
                "Account",
                style: kSectionTitles,
              ),
            ),
            MySpacer(height: 10.0),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ExtraActions(
                    leadingIcon: Icons.subscriptions_rounded,
                    title: "Manage Subscriptions",
                    leadingIconColor: Colors.teal,
                  ),
                  ExtraActions(
                    leadingIcon: Icons.filter_alt_rounded,
                    title: "Manage Filters",
                    leadingIconColor: Colors.blue,
                  ),
                  ExtraActions(
                    leadingIcon: Icons.pending_rounded,
                    title: "Terms of Service",
                    leadingIconColor: Colors.purple,
                  ),
                ],
              ),
            ),
            MySpacer(height: 20.0),
            SliverToBoxAdapter(
              child: Text(
                "Payments",
                style: kSectionTitles,
              ),
            ),
            MySpacer(height: 20.0),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ExtraActions(
                    leadingIcon: Icons.account_balance_rounded,
                    title: "Account Balance",
                    leadingIconColor: Colors.teal,
                  ),
                  ExtraActions(
                    leadingIcon: Icons.money_rounded,
                    title: "Budget Management",
                    leadingIconColor: Colors.blue,
                  ),
                  ExtraActions(
                    leadingIcon: Icons.account_balance_wallet_rounded,
                    title: "Savings",
                    leadingIconColor: Colors.purple,
                  ),
                  ExtraActions(
                    leadingIcon: Icons.credit_card_rounded,
                    title: "Manage Cards",
                    leadingIconColor: Colors.deepOrange,
                  ),
                ],
              ),
            ),
            MySpacer(height: 20.0),
            SliverToBoxAdapter(
              child: ElevatedButton(
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Get.snackbar(
                    "Done",
                    "You'll be logged out shortly",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: kColBackGround,
                    duration: Duration(seconds: 1),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

class ExtraActions extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Color leadingIconColor;
  const ExtraActions(
      {Key key,
      @required this.leadingIcon,
      @required this.title,
      @required this.leadingIconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Material(
        borderRadius: BorderRadius.circular(24.0),
        color: leadingIconColor,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Icon(
            leadingIcon,
            size: 28,
            color: kColBackGround,
          ),
        ),
      ),
      title: Text(title),
      trailing: Material(
        borderRadius: BorderRadius.circular(10),
        child: Icon(
          Icons.arrow_right_rounded,
          size: 40.0,
        ),
      ),
    );
  }
}
