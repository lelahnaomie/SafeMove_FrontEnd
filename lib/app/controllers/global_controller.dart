import 'package:get/get.dart';

// Global controller to store registration data across the flow
class GlobalController extends GetxController {
  // Driver registration data
  final vehicleData = <String, dynamic>{}.obs;
  final documentData = <String, dynamic>{}.obs;
  final profileData = <String, dynamic>{}.obs;
  final registrationStep = 0.obs;
  
  // Application status data
  final applicationStatus = 'pending'.obs;
  final submissionDate = DateTime.now().obs;
  
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
  
  // Reset all registration data
  void resetRegistrationData() {
    vehicleData.clear();
    documentData.clear();
    profileData.clear();
    registrationStep.value = 0;
  }
  
  // Get complete registration data
  Map<String, dynamic> getCompleteRegistrationData() {
    return {
      'vehicle': vehicleData.value,
      'documents': documentData.value,
      'profile': profileData.value,
      'submissionDate': submissionDate.value.toIso8601String(),
    };
  }
  
  // Check if vehicle data is complete
  bool isVehicleDataComplete() {
    return vehicleData.isNotEmpty &&
           vehicleData['brand'] != null &&
           vehicleData['model'] != null &&
           vehicleData['year'] != null &&
           vehicleData['color'] != null &&
           vehicleData['licensePlate'] != null;
  }
  
  // Check if document data is complete
  bool isDocumentDataComplete() {
    return documentData.isNotEmpty &&
           documentData['driverLicense'] != null &&
           documentData['vehicleRegistration'] != null &&
           documentData['vehicleInsurance'] != null &&
           documentData['profilePhoto'] != null;
  }
  
  // Update registration step
  void updateRegistrationStep(int step) {
    registrationStep.value = step;
  }
}
