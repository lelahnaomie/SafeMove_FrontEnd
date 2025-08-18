import 'package:get/get.dart';

class WelcomerController extends GetxController {
  // Observable for page indicator if you want to add swipe functionality later
  final currentPage = 0.obs;
  
  // Navigation methods
  void goToLogin() {
    Get.toNamed('/login');
  }
  
  void goToRegister() {
    Get.toNamed('/register-type');
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
