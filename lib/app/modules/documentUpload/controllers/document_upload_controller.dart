import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/global_controller.dart';

// Document types enum - moved outside the class to be accessible
enum DocumentType {
  driverLicense,
  vehicleRegistration,
  vehicleInsurance,
  profilePhoto,
}

class DocumentUploadController extends GetxController {
  // Observable variables
  final uploadedDocuments = <DocumentType, File?>{}.obs;
  final isLoading = false.obs;
  final currentStep = 0.obs;
  
  // Document upload steps
  final List<Map<String, dynamic>> uploadSteps = [
    {
      'type': DocumentType.driverLicense,
      'title': 'Take a photo of your\ndriver licence',
      'subtitle': 'Must sure your driver\'s licence are not expired.\nPlease click a clearer photo and avoid using flash.',
      'icon': Icons.credit_card,
    },
    {
      'type': DocumentType.vehicleRegistration,
      'title': 'Take a photo of your\nVehicle Registration\nsticker',
      'subtitle': 'Make sure your vehicle\'s mike, model, year, licence plate, VIN and expiration are clear and visible.',
      'icon': Icons.description,
    },
    {
      'type': DocumentType.vehicleInsurance,
      'title': 'Take a photo of your\nVehicle Insurance',
      'subtitle': 'Make sure your name, VIN, insurance company, and expiration date are clear and visible.',
      'icon': Icons.security,
    },
    {
      'type': DocumentType.profilePhoto,
      'title': 'Upload your profile\nphoto',
      'subtitle': 'Must sure your driver\'s licence are not expired.\nPlease click a clearer photo and avoid using flash.',
      'icon': Icons.person,
    },
  ];
  
  final ImagePicker _picker = ImagePicker();
  
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
  
  void goBack() {
    Get.back();
  }
  
  Future<void> pickImage({bool fromCamera = true}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      
      if (image != null) {
        final currentDocType = uploadSteps[currentStep.value]['type'] as DocumentType;
        uploadedDocuments[currentDocType] = File(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to capture image. Please try again.',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    }
  }
  
  void removeImage() {
    final currentDocType = uploadSteps[currentStep.value]['type'] as DocumentType;
    uploadedDocuments.remove(currentDocType);
  }
  
  void nextStep() {
    if (currentStep.value < uploadSteps.length - 1) {
      currentStep.value++;
    }
  }
  
  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
  
  void goToStep(int step) {
    if (step >= 0 && step < uploadSteps.length) {
      currentStep.value = step;
    }
  }
  
  bool canProceedToNext() {
    final currentDocType = uploadSteps[currentStep.value]['type'] as DocumentType;
    return uploadedDocuments.containsKey(currentDocType) && 
           uploadedDocuments[currentDocType] != null;
  }
  
  bool isCurrentStepCompleted() {
    final currentDocType = uploadSteps[currentStep.value]['type'] as DocumentType;
    return uploadedDocuments.containsKey(currentDocType) && 
           uploadedDocuments[currentDocType] != null;
  }
  
  bool isStepCompleted(int stepIndex) {
    final docType = uploadSteps[stepIndex]['type'] as DocumentType;
    return uploadedDocuments.containsKey(docType) && 
           uploadedDocuments[docType] != null;
  }
  
  Future<void> submitDocuments() async {
    // Check if all documents are uploaded
    bool allDocumentsUploaded = true;
    for (final step in uploadSteps) {
      final docType = step['type'] as DocumentType;
      if (!uploadedDocuments.containsKey(docType) || uploadedDocuments[docType] == null) {
        allDocumentsUploaded = false;
        break;
      }
    }
    
    if (!allDocumentsUploaded) {
      Get.snackbar(
        'Incomplete',
        'Please upload all required documents before proceeding.',
        backgroundColor: Colors.orange[100],
        colorText: Colors.orange[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    
    try {
      isLoading.value = true;
      
      // Simulate API call to upload documents
      await Future.delayed(const Duration(seconds: 2));
      
      // Store document data
      Get.find<GlobalController>().documentData.value = {
        'driverLicense': uploadedDocuments[DocumentType.driverLicense]?.path,
        'vehicleRegistration': uploadedDocuments[DocumentType.vehicleRegistration]?.path,
        'vehicleInsurance': uploadedDocuments[DocumentType.vehicleInsurance]?.path,
        'profilePhoto': uploadedDocuments[DocumentType.profilePhoto]?.path,
        'uploadedAt': DateTime.now().toIso8601String(),
      };
      
      // Navigate to application status page
      Get.toNamed('/application-status');
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to submit documents. Please try again.',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  String getStepTitle() {
    return uploadSteps[currentStep.value]['title'];
  }
  
  String getStepSubtitle() {
    return uploadSteps[currentStep.value]['subtitle'];
  }
  
  IconData getStepIcon() {
    return uploadSteps[currentStep.value]['icon'];
  }
  
  File? getCurrentStepImage() {
    final currentDocType = uploadSteps[currentStep.value]['type'] as DocumentType;
    return uploadedDocuments[currentDocType];
  }
}
