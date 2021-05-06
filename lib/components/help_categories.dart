import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/constants.dart';
import 'package:woody/controllers/category_controllers.dart';
import 'package:woody/controllers/main_screen_controller.dart';
import 'package:woody/models/category_model.dart';

class HelpCategoryItems extends StatelessWidget {
  final Category category;

  const HelpCategoryItems({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainScreenController = Get.find<MainScreenController>();
    final categoryController = Get.find<CategoryController>();
    return Card(
      elevation: 3.0,
      shadowColor: kColBackGround,
      child: Container(
        color: kColDarkBrownAccent,
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
                height: 40,
              ),
              Text(
                category.title,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
