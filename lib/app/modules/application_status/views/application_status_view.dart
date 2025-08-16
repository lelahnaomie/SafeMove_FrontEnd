import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/application_status_controller.dart';

class ApplicationStatusView extends GetView<ApplicationStatusController> {
  const ApplicationStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Obx(() => Column(
            children: [
              const SizedBox(height: 60),
              
              // Main content area
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Status icon with animation
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: controller.getStatusColor().withOpacity(0.1),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Clipboard icon
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Clipboard base
                                      Positioned(
                                        left: 20,
                                        top: 15,
                                        child: Container(
                                          width: 40,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.orange[200],
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      // Clipboard clip
                                      Positioned(
                                        left: 30,
                                        top: 10,
                                        child: Container(
                                          width: 20,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.orange[400],
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      // Lines on clipboard
                                      Positioned(
                                        left: 25,
                                        top: 25,
                                        child: Column(
                                          children: [
                                            Container(width: 30, height: 2, color: Colors.blue),
                                            const SizedBox(height: 3),
                                            Container(width: 25, height: 2, color: Colors.blue),
                                            const SizedBox(height: 3),
                                            Container(width: 28, height: 2, color: Colors.blue),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Check mark
                                if (controller.applicationStatus.value == ApplicationStatus.approved ||
                                    controller.applicationStatus.value == ApplicationStatus.underReview)
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Status message
                    Text(
                      controller.getStatusMessage(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Status description
                    Text(
                      controller.getStatusDescription(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Status details card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Submitted ${controller.getFormattedSubmissionDate()}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 12),
                          
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Estimated review time: ${controller.estimatedReviewTime.value}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action buttons
              Column(
                children: [
                  // Check status button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: controller.isLoading.value 
                          ? null 
                          : controller.checkStatus,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF1A237E),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A237E)),
                              ),
                            )
                          : const Text(
                              'Check Status',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A237E),
                              ),
                            ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Continue/Submit button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.applicationStatus.value == ApplicationStatus.approved) {
                          controller.goToHome();
                        } else {
                          controller.goToSettings();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A237E),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        controller.applicationStatus.value == ApplicationStatus.approved
                            ? 'Get Started'
                            : 'Continue',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
