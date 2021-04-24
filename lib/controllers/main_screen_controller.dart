import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int currentIndex = 4;

  void onSwitchTab(int index) {
    currentIndex = index;
    update();
  }
}
