import 'package:flutter/material.dart';
import 'package:woody/constants.dart';
import 'package:woody/models/product_model.dart';
import 'package:get/get.dart';
import 'package:woody/screens/product_details_page.dart';
import 'package:woody/controllers/product_controller.dart';

class ProductComponent extends StatelessWidget {
  final Product product;

  const ProductComponent({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Avoid recreating controller object for each instance of product component
    final productController = new ProductController();
    return Card(
      elevation: 3,
      shadowColor: kColBackGround,
      child: InkWell(
        onTap: () {
          Get.to(
            () => ProductDetails(
              product: product,
            ),
          );
          print("TAP - PRODUCT_ITEM");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                product.imageUrl,
                height: 120,
                width: double.infinity,
              ),
              Text(
                product.title,
                style: kHeadingStyle,
              ),
              Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kGreyText,
              ),
              Text(
                "Ksh ${product.price}",
                style: kHeadingStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  productController.stockMessage(stockRem: product.stock),
                  Icon(
                    Icons.add_box_rounded,
                    size: 30,
                    color: kColDarkBrown,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
