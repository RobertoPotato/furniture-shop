import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/components/category_underlined_component.dart';
import 'package:woody/components/my_spacer.dart';
import 'package:woody/components/product_component.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/category_controllers.dart';
import 'package:woody/data/category_data.dart';
import 'package:woody/data/product_data.dart';
import 'package:woody/models/product_model.dart';

Widget buildCategoriesPage() {
  final categoryController = Get.put(CategoryController());

  return GetBuilder<CategoryController>(builder: (_) {
    List<Product> categoryProducts = products
        .where((product) =>
            product.categoryId == categoryController.selectedCategory)
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: CustomScrollView(
        slivers: [
          MySpacer(height: 25.0),

          /// Header and Search
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: kAppTitleStyle,
                ),
                Icon(
                  Icons.search_rounded,
                  size: 30,
                )
              ],
            ),
          ),
          MySpacer(height: 20.0),

          /// Categories list
          SliverToBoxAdapter(
            child: Container(
              height: 30.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories == null ? 0 : categories.length,
                itemBuilder: (BuildContext context, int index) =>
                    CategoryUnderLined(
                  title: categories[index].title,
                  id: categories[index].id,
                  selectedCategoryId: categoryController.selectedCategory,
                ),
              ),
            ),
          ),
          MySpacer(height: 20.0),

          /// List Details
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "100 Products",
                  style: kHeadingStyle,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Popular",
                        style: kHeadingStyle,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          MySpacer(height: 15.0),

          /// Product Items
          categoryController.selectedCategory == 0
              ? SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => ProductComponent(
                      product: products[index],
                    ),
                    childCount: products == null ? 0 : products.length,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250.0,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      mainAxisExtent: 290),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => ProductComponent(
                      product: categoryProducts[index],
                    ),
                    childCount:
                        categoryProducts == null ? 0 : categoryProducts.length,
                  ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250.0,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      mainAxisExtent: 290),
                ),
        ],
      ),
    );
  });
}
