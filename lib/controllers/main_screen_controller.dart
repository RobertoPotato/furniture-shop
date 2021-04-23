import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int currentIndex = 3;

  void onSwitchTab(int index) {
    currentIndex = index;
    update();
  }
}
