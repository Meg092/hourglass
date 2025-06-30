import 'package:get/get.dart';

import 'clock_inner_logic.dart';

class ClockInnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ClockInnerLogic(),
      permanent: true,
    );
  }
}
