import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woody/MainScreen.dart';
import 'package:woody/controllers/account_controller.dart';
import 'package:woody/controllers/cart_controller.dart';

import 'controllers/category_controllers.dart';
import 'controllers/main_screen_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woody',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      initialBinding: BindingsBuilder(() => {
            Get.put(AccountController()),
            Get.put(CategoryController()),
            Get.put(CartController()),
            Get.put(MainScreenController()),
          }),
    );
  }
}
