import 'package:SafeMove/app/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleRegistrationController extends GetxController {
  // Text controllers
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final plateController = TextEditingController();
  
  // Observable variables
  final selectedBrand = ''.obs;
  final selectedColor = ''.obs;
  final isLoading = false.obs;
  final formErrors = <String, String?>{}.obs;
  
  // Vehicle brands list
  final List<String> vehicleBrands = [
    'Abarth',
    'AMC',
    'Aston Martin',
    'Audi',
    'Austin',
    'Bentley',
    'BMW',
    'Bugatti',
    'Chevrolet',
    'Citroen',
    'Ferrari',
    'Ford',
    'Honda',
    'Hyundai',
    'Jaguar',
    'Jeep',
    'Kia',
    'Lamborghini',
    'Land Rover',
    'Lexus',
    'Maserati',
    'Mazda',
    'Mercedes-Benz',
    'MINI',
    'Mitsubishi',
    'Nissan',
    'Peugeot',
    'Porsche',
    'Renault',
    'Rolls-Royce',
    'Subaru',
    'Tesla',
    'Toyota',
    'Volkswagen',
    'Volvo',
  ];
  
  // Vehicle colors list
  final List<Map<String, dynamic>> vehicleColors = [
    {'name': 'Black', 'color': Colors.black},
    {'name': 'Gray', 'color': Colors.grey},
    {'name': 'Silver', 'color': Colors.grey[300]},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Brown', 'color': Colors.brown},
    {'name': 'Gold', 'color': Colors.amber},
    {'name': 'White', 'color': Colors.white},
    {'name': 'Other', 'color': Colors.transparent, 'isGradient': true},
  ];
  
  @override
  void onInit() {
    super.onInit();
    // Clear any previous errors when user types
    modelController.addListener(() => clearFieldError('model'));
    yearController.addListener(() => clearFieldError('year'));
    plateController.addListener(() => clearFieldError('plate'));
  }
  
  @override
  void onReady() {
    super.onReady();
  }
  
  @override
  void onClose() {
    modelController.dispose();
    yearController.dispose();
    plateController.dispose();
    super.onClose();
  }
  
  void goBack() {
    Get.back();
  }
  
  void selectBrand(String brand) {
    selectedBrand.value = brand;
    clearFieldError('brand');
    Get.back(); // Close the brand selector
  }
  
  void selectColor(String color) {
    selectedColor.value = color;
    clearFieldError('color');
    Get.back(); // Close the color selector
  }
  
  void clearFieldError(String field) {
    if (formErrors.containsKey(field)) {
      formErrors.remove(field);
    }
  }
  
  bool _validateForm() {
    bool isValid = true;
    formErrors.clear();
    
    // Validate brand
    if (selectedBrand.value.isEmpty) {
      formErrors['brand'] = 'Please select a vehicle brand';
      isValid = false;
    }
    
    // Validate model
    if (modelController.text.trim().isEmpty) {
      formErrors['model'] = 'Please enter vehicle model';
      isValid = false;
    }
    
    // Validate year
    if (yearController.text.trim().isEmpty) {
      formErrors['year'] = 'Please enter vehicle year';
      isValid = false;
    } else {
      final year = int.tryParse(yearController.text.trim());
      if (year == null || year < 2005 || year > DateTime.now().year + 1) {
        formErrors['year'] = 'Vehicle must be 2005 or newer';
        isValid = false;
      }
    }
    
    // Validate color
    if (selectedColor.value.isEmpty) {
      formErrors['color'] = 'Please select vehicle color';
      isValid = false;
    }
    
    // Validate plate
    if (plateController.text.trim().isEmpty) {
      formErrors['plate'] = 'Please enter license plate number';
      isValid = false;
    } else if (plateController.text.trim().length < 3) {
      formErrors['plate'] = 'License plate must be at least 3 characters';
      isValid = false;
    }
    
    return isValid;
  }
  
  Future<void> continueToDocuments() async {
    if (!_validateForm()) {
      return;
    }
    
    try {
      isLoading.value = true;
      
      // Save vehicle information
      final vehicleData = {
        'brand': selectedBrand.value,
        'model': modelController.text.trim(),
        'year': yearController.text.trim(),
        'color': selectedColor.value,
        'licensePlate': plateController.text.trim().toUpperCase(),
      };
      
      // Store in local storage or send to API
      // For now, we'll just store it locally
      Get.find<GlobalController>().vehicleData.value = vehicleData;
      
      // Navigate to document upload page
      Get.toNamed('/document-upload');
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save vehicle information. Please try again.',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  // Method to filter brands based on search
  List<String> getFilteredBrands(String query) {
    if (query.isEmpty) {
      return vehicleBrands;
    }
    return vehicleBrands
        .where((brand) => brand.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}


