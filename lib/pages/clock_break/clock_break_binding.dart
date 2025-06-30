import 'package:get/get.dart';

import 'clock_break_logic.dart';

class ClockBreakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockBreakLogic());
  }
}
