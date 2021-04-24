import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int currentIndex = 0;

  void onSwitchTab(int index) {
    currentIndex = index;
    update();
  }
}
