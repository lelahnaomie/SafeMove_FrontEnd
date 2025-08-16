import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final isLoading = false.obs;
  final phoneError = ''.obs;
  final selectedCountryCode = '+237'.obs;
  final selectedCountryFlag = '🇨🇲'.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void setCountry(String code, String flag) {
    selectedCountryCode.value = code;
    selectedCountryFlag.value = flag;
  }

  bool validatePhone() {
    final phone = phoneController.text.trim();
    
    if (phone.isEmpty) {
      phoneError.value = 'Please enter your phone number';
      return false;
    }
    
    if (phone.length < 8) {
      phoneError.value = 'Phone number entered is incorrect';
      return false;
    }
    
    phoneError.value = '';
    return true;
  }

  Future<void> sendOTP() async {
    if (!validatePhone()) return;
    
    isLoading.value = true;
    
    // Simuler l'envoi d'OTP
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // Navigation vers la page OTP avec le numéro
    Get.toNamed('/otp', arguments: {
      'phone': selectedCountryCode.value + phoneController.text,
      'countryCode': selectedCountryCode.value,
      'countryFlag': selectedCountryFlag.value,
    });
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }
}
