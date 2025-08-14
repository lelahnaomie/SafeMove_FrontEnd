import 'package:get/get.dart';

import '../controllers/welcomer_controller.dart';

class WelcomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomerController>(
      () => WelcomerController(),
    );
  }
}
