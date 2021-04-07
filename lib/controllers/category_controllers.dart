import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  int selectedCategory = 1;

  void updateSelectedCategory({@required int id}) {
    print("UPDATING CATEGORY - $selectedCategory to $id");
    selectedCategory = id;
    update();
  }
}
