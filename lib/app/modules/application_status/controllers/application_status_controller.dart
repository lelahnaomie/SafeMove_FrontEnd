import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ApplicationStatusController extends GetxController {
  // Observable variables
  final applicationStatus = ApplicationStatus.underReview.obs;
  final submissionDate = DateTime.now().obs;
  final estimatedReviewTime = '2-3 business days'.obs;
  final isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Load application data
    _loadApplicationData();
  }
  
  @override
  void onReady() {
    super.onReady();
  }
  
  @override
  void onClose() {
    super.onClose();
  }
  
  void _loadApplicationData() {
    // Here you would typically load the application status from your API
    // For now, we'll use the submitted status
    applicationStatus.value = ApplicationStatus.underReview;
    submissionDate.value = DateTime.now();
  }
  
  Future<void> checkStatus() async {
    try {
      isLoading.value = true;
      
      // Simulate API call to check status
      await Future.delayed(const Duration(seconds: 1));
      
      // Here you would call your API to get the latest status
      // For demo purposes, we'll just show a success message
      Get.snackbar(
        'Status Updated',
        'Your application status is up to date.',
        backgroundColor: Colors.green[100],
        colorText: Colors.green[800],
        snackPosition: SnackPosition.TOP,
      );
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to check status. Please try again.',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void goToHome() {
    // Navigate to home or main dashboard
    Get.offAllNamed('/home');
  }
  
  void goToSettings() {
    // Navigate to settings to check status
    Get.toNamed('/settings');
  }
  
  String getStatusMessage() {
    switch (applicationStatus.value) {
      case ApplicationStatus.pending:
        return 'Your application is being processed';
      case ApplicationStatus.underReview:
        return 'Your application is submitted\nand is Under review';
      case ApplicationStatus.approved:
        return 'Congratulations! Your application has been approved';
      case ApplicationStatus.rejected:
        return 'Your application has been rejected';
      case ApplicationStatus.needsMoreInfo:
        return 'Additional information required';
    }
  }
  
  String getStatusDescription() {
    switch (applicationStatus.value) {
      case ApplicationStatus.pending:
        return 'We are reviewing your submitted documents and information.';
      case ApplicationStatus.underReview:
        return 'You will be notified with application status\nor check the status by going to settings.';
      case ApplicationStatus.approved:
        return 'You can now start accepting ride requests and earning money.';
      case ApplicationStatus.rejected:
        return 'Please review the feedback and resubmit your application.';
      case ApplicationStatus.needsMoreInfo:
        return 'Please provide the additional documents requested.';
    }
  }
  
  Color getStatusColor() {
    switch (applicationStatus.value) {
      case ApplicationStatus.pending:
        return Colors.orange;
      case ApplicationStatus.underReview:
        return Colors.blue;
      case ApplicationStatus.approved:
        return Colors.green;
      case ApplicationStatus.rejected:
        return Colors.red;
      case ApplicationStatus.needsMoreInfo:
        return Colors.amber;
    }
  }
  
  IconData getStatusIcon() {
    switch (applicationStatus.value) {
      case ApplicationStatus.pending:
        return Icons.schedule;
      case ApplicationStatus.underReview:
        return Icons.assignment;
      case ApplicationStatus.approved:
        return Icons.check_circle;
      case ApplicationStatus.rejected:
        return Icons.cancel;
      case ApplicationStatus.needsMoreInfo:
        return Icons.info;
    }
  }
  
  String getFormattedSubmissionDate() {
    final now = DateTime.now();
    final difference = now.difference(submissionDate.value);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

enum ApplicationStatus {
  pending,
  underReview,
  approved,
  rejected,
  needsMoreInfo,
}
