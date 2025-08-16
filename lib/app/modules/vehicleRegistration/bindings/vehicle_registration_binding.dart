import 'package:SafeMove/app/controllers/global_controller.dart';
import 'package:get/get.dart';
import '../controllers/vehicle_registration_controller.dart';

class VehicleRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleRegistrationController>(
      () => VehicleRegistrationController(),
    );
    
    // Also initialize the global controller if not already initialized
    if (!Get.isRegistered<GlobalController>()) {
      Get.put<GlobalController>(GlobalController(), permanent: true);
    }
  }
}
