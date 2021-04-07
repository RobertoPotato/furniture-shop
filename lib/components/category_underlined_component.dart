import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/controllers/category_controllers.dart';
import '../constants.dart';

class CategoryUnderLined extends StatelessWidget {
  final int id;
  final String title;
  final int selectedCategoryId;

  const CategoryUnderLined({
    Key key,
    @required this.id,
    @required this.title,
    @required this.selectedCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.find<CategoryController>();
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5.0),
      child: GestureDetector(
        onTap: () {
          categoryController.updateSelectedCategory(id: id);
        },
        child: Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.transparent,
            decorationColor:
                id == selectedCategoryId ? kColDarkBrown : kColGrey,
            shadows: [
              Shadow(
                color: id == selectedCategoryId ? kColDarkBrown : kColGrey,
                offset: Offset(0, -7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
