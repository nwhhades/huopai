import 'package:get/get.dart';

import '../controllers/furn_controller.dart';

class FurnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FurnController>(
      () => FurnController(),
    );
  }
}
