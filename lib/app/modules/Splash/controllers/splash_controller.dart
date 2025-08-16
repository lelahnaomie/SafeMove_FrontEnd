import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Appeler la navigation après que la vue soit prête
    _navigateToWelcomer();
  }

  Future<void> _navigateToWelcomer() async {
    // Attendre 3 secondes
    await Future.delayed(const Duration(seconds: 3));
    
    // Navigation vers welcomer
    Get.offNamed('/welcomer');
  }
}
