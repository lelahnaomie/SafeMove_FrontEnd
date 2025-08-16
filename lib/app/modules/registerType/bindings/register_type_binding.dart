import 'package:get/get.dart';
import '../controllers/register_type_controller.dart';

class RegisterTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterTypeController>(
      () => RegisterTypeController(),
    );
  }
}
