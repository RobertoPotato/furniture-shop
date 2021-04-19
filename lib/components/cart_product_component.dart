import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/cart_controller.dart';
import 'package:woody/controllers/product_controller.dart';
import 'package:woody/models/product_model.dart';
import 'package:woody/screens/product_details_page.dart';

class CartProduct extends StatelessWidget {
  final Product product;
  final productCount;

  const CartProduct(
      {Key key, @required this.product, @required this.productCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //FIXME Don't initialize this object for each item
    var productController = new ProductController();
    final cartController = Get.find<CartController>();
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: kHeadingStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        product.description,
                        style: kGreyText.copyWith(fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Ksh ${product.price}",
                        style: kHeadingStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          productController.stockMessage(
                              stockRem: product.stock),
                          Container(
                            decoration: BoxDecoration(
                              color: kColGrey.withOpacity(
                                0.3,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  5.0,
                                ),
                              ),
                            ),
                            width: 80.0,
                            height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    cartController.updateItemCount(
                                      productId: product.id,
                                      stock: product.stock,
                                      type: UpdateCount.REMOVE,
                                    );
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                Text(productCount.toString()),
                                InkWell(
                                  onTap: () {
                                    cartController.updateItemCount(
                                      productId: product.id,
                                      type: UpdateCount.ADD,
                                      stock: product.stock,
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          secondaryActions: [
            IconSlideAction(
              caption: "Delete",
              color: kColDarkBrown,
              icon: Icons.delete_rounded,
              onTap: () {
                cartController.removeProductFromCart(productId: product.id);
              },
            ),
          ],
          actions: [
            IconSlideAction(
              caption: "Details",
              color: kColDarkBrown,
              icon: Icons.details_rounded,
              onTap: () {
                Get.to(
                  () => ProductDetails(
                    product: product,
                  ),
                );
                print("Show details");
              },
            ),
          ],
        ),
      ),
    );
  }
}
