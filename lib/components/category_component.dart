import 'package:flutter/material.dart';
import 'package:woody/constants.dart';
import 'package:get/get.dart';
import 'package:woody/controllers/category_controllers.dart';
import 'package:woody/controllers/main_screen_controller.dart';
import 'package:woody/models/category_model.dart';

class CategoryItems extends StatelessWidget {
  final Category category;

  const CategoryItems({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainScreenController = Get.find<MainScreenController>();
    final categoryController = Get.find<CategoryController>();
    return Card(
      elevation: 3.0,
      shadowColor: kColBackGround,
      child: GestureDetector(
        onTap: () {
          mainScreenController.onSwitchTab(1);
          categoryController.updateSelectedCategory(id: category.id);
          print(
            "TAP - HOME - CATEGORY_ITEM",
          );
        },
        child: Container(
          height: 80.0,
          width: 90.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  height: 60,
                ),
                Text(category.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
