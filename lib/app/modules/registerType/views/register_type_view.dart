import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_type_controller.dart';

class RegisterTypeView extends GetView<RegisterTypeController> {
  const RegisterTypeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Driver Registration',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 20,
            ),
          ),
          onPressed: () => controller.goBack(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Step indicator
                  Text(
                    'Step 1 of 4',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Title
                  const Text(
                    'Tell us your vehicule\npreference',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Cards Section
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                children: [
                  // I have a car card
                  _buildVehicleCard(
                    context,
                    title: 'I have a car',
                    description: 'You own to planning to purchase a vehicule or vehicules i will drive myself but might also employ others to drive your vehicule.',
                    imagePath: 'assets/images/preference_register_1.png',
                    type: 'have_car',
                  ),
                  
                  // I need a car card
                  _buildVehicleCard(
                    context,
                    title: 'I need a car',
                    description: 'I want to be employ as a driver by one of SafeMove partners and drive for them on SafeMove Company.',
                    imagePath: 'assets/images/preference_register_2.png',
                    type: 'need_car',
                  ),
                ],
              ),
            ),
            
            // Bottom Section with Indicators
            Container(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: Center(
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: index == controller.currentPage.value ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == controller.currentPage.value 
                            ? const Color(0xFF1A1A1A) 
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildVehicleCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required String type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Image Container
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback image
                    return Container(
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            type == 'have_car' 
                                ? Icons.directions_car 
                                : Icons.car_rental,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            type == 'have_car' 
                                ? 'Own Vehicle' 
                                : 'Need Vehicle',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Content Section
          Expanded(
            child: Column(
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                
                const Spacer(),
                
                // Action Button
                GestureDetector(
                  onTap: () => controller.selectVehicleType(type),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1A1A1A).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
