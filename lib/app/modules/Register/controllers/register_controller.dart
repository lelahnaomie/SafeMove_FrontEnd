import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../city_selector/city_selector_view.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final referralController = TextEditingController();
  
  final isLoading = false.obs;
  final acceptTerms = false.obs;
  final formErrors = <String, String>{}.obs;
  
  final selectedCountryCode = '+237'.obs;
  final selectedCountryFlag = '🇨🇲'.obs;
  final selectedCity = ''.obs;
  
  final List<String> cities = [
    'Yaoundé',
    'Douala',
    'Bafoussam',
    'Bamenda',
    'Garoua',
    'Maroua',
    'Ngaoundéré',
    'Bertoua',
    'Ebolowa',
    'Foumban',
  ];
  
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    referralController.dispose();
    super.onClose();
  }
  
  Future<void> selectCity(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CitySelectorView(),
    );
    
    if (result != null) {
      selectedCity.value = result;
      cityController.text = result;
    }
  }
  
  void setCountry(String code, String flag) {
    selectedCountryCode.value = code;
    selectedCountryFlag.value = flag;
  }
  
  void toggleTerms() {
    acceptTerms.value = !acceptTerms.value;
  }
  
  bool validateForm() {
    formErrors.clear();
    bool isValid = true;
    
    // Valider le nom
    if (nameController.text.trim().isEmpty) {
      formErrors['name'] = 'Name is required';
      isValid = false;
    }
    
    // Valider l'email
    if (emailController.text.trim().isEmpty) {
      formErrors['email'] = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      formErrors['email'] = 'Please enter a valid email';
      isValid = false;
    }
    
    // Valider le téléphone
    if (phoneController.text.trim().isEmpty) {
      formErrors['phone'] = 'Phone number is required';
      isValid = false;
    } else if (phoneController.text.trim().length < 8) {
      formErrors['phone'] = 'Phone number is too short';
      isValid = false;
    }
    
    // Valider la ville
    if (selectedCity.value.isEmpty) {
      formErrors['city'] = 'Please select a city';
      isValid = false;
    }
    
    // Valider les termes
    if (!acceptTerms.value) {
      Get.snackbar(
        'Terms Required',
        'You must accept the terms and privacy policy',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isValid = false;
    }
    
    return isValid;
  }
  
  Future<void> register() async {
    if (!validateForm()) return;
    
    isLoading.value = true;
    
    // Simuler l'inscription
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // Navigation vers OTP avec les données
    Get.toNamed('/otp', arguments: {
      'phone': selectedCountryCode.value + phoneController.text,
      'countryCode': selectedCountryCode.value,
      'countryFlag': selectedCountryFlag.value,
      'isRegistration': true,
    });
  }
}
