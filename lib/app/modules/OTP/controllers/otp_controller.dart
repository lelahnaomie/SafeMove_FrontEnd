import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  
  final isLoading = false.obs;
  final otpError = ''.obs;
  final resendCountdown = 30.obs;
  final canResend = false.obs;
  
  String phoneNumber = '';
  String countryCode = '';
  String countryFlag = '';
  bool isRegistration = false;
  Timer? _timer;
  
  @override
  void onInit() {
    super.onInit();
    
    // Récupérer les arguments passés
    final args = Get.arguments;
    if (args != null) {
      phoneNumber = args['phone'] ?? '';
      countryCode = args['countryCode'] ?? '+237';
      countryFlag = args['countryFlag'] ?? '🇨🇲';
      isRegistration = args['isRegistration'] ?? false;
    }
    
    startResendTimer();
  }
  
  @override
  void onClose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.onClose();
  }
  
  void startResendTimer() {
    resendCountdown.value = 30;
    canResend.value = false;
    
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }
  
  String getOtpCode() {
    return otpControllers.map((c) => c.text).join();
  }
  
  bool validateOtp() {
    final otp = getOtpCode();
    
    if (otp.length < 6) {
      otpError.value = 'Please enter the complete code';
      return false;
    }
    
    otpError.value = '';
    return true;
  }
  
  Future<void> verifyOtp() async {
    if (!validateOtp()) return;
    
    isLoading.value = true;
    
    // Simuler la vérification
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // Navigation selon le contexte (inscription ou connexion)
    if (isRegistration) {
      // Si c'est une inscription, aller vers register-type
      Get.offAllNamed('/register-type');
    } else {
      // Si c'est une connexion, aller vers home
      Get.offAllNamed('/home');
    }
  }
  
  Future<void> resendOtp() async {
    if (!canResend.value) return;
    
    // Effacer les champs
    for (var controller in otpControllers) {
      controller.clear();
    }
    
    // Simuler le renvoi
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    
    // Redémarrer le timer
    startResendTimer();
    
    Get.snackbar(
      'Code Sent',
      'A new verification code has been sent to your phone',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
