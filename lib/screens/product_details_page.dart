import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/components/review_component.dart';
import 'package:woody/controllers/cart_controller.dart';
import 'package:woody/controllers/product_controller.dart';
import 'package:woody/data/review_data.dart';
import 'package:woody/models/product_model.dart';

import '../constants.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final productController = new ProductController();
    final cartController = Get.find<CartController>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// Product Image Section
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                child: Image.asset(
                  product.imageUrl,
                  height: _height / 2,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          MySpacer(height: 20.0),

          /// Product Details Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: kSectionTitles,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                RatingBar(
                                  maxRating: 5.0,
                                  initialRating: product.rating,
                                  allowHalfRating: true,
                                  itemSize: 25.0,
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.orange,
                                    ),
                                    half: Icon(
                                      Icons.star_half_rounded,
                                      color: Colors.orange,
                                    ),
                                    empty: Icon(
                                      Icons.star_outline_rounded,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  onRatingUpdate: null,
                                ),
                                Text(
                                  "(${product.rating})",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            productController.stockMessage(
                                stockRem: product.stock),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              product.price.toString(),
                              style: kHeadingStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    product.description,
                    style: kGreyText.copyWith(
                      fontSize: 18,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MySpacer(height: 20.0),

          /// Reviews Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews",
                    style: kSectionTitles,
                  ),
                  Text(
                    "See All",
                    style: kSeeAll,
                  ),
                ],
              ),
            ),
          ),
          MySpacer(height: 5.0),
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
                        "${reviews.length} reviews",
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
      ),
      bottomSheet: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    cartController.addProductToCart(product: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Text("Add to cart"),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kColDarkBrownAccent,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    cartController.buyNow(product: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Text("Buy Now"),
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
  }
}
