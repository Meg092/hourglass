import 'package:get/get.dart';

import 'clock_about_logic.dart';

class ClockAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockAboutLogic());
  }
}
