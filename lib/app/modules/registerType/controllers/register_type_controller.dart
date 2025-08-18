import 'package:get/get.dart';

class RegisterTypeController extends GetxController {
  final selectedType = ''.obs;
  final currentPage = 0.obs;
  
  void selectVehicleType(String type) {
    selectedType.value = type;
    
    // Navigation vers la prochaine étape selon le type
    if (type == 'have_car') {
      // TODO: Navigate to car registration flow
      Get.toNamed('/vehicle-registration');
    } else if (type == 'need_car') {
      // TODO: Navigate to partner selection flow
      Get.toNamed('/partner-selection');
    }
  }
  
  void goBack() {
    Get.back();
  }
  
  @override
  void onInit() {
    super.onInit();
  }
  
  @override
  void onReady() {
    super.onReady();
  }
  
  @override
  void onClose() {
    super.onClose();
  }
}
