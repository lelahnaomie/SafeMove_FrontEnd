import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehicle_registration_controller.dart';

class ColorSelectorView extends GetView<VehicleRegistrationController> {
  const ColorSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Rechercher votre marque de voiture',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Colors list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: controller.vehicleColors.length,
              itemBuilder: (context, index) {
                final colorData = controller.vehicleColors[index];
                final colorName = colorData['name'] as String;
                final color = colorData['color'] as Color;
                final isGradient = colorData['isGradient'] == true;
                
                return InkWell(
                  onTap: () => controller.selectColor(colorName),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Color indicator
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: isGradient ? null : color,
                            gradient: isGradient
                                ? const LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.orange,
                                      Colors.yellow,
                                      Colors.green,
                                      Colors.blue,
                                      Colors.purple,
                                    ],
                                  )
                                : null,
                            border: colorName == 'White'
                                ? Border.all(color: Colors.grey[300]!)
                                : null,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        
                        Expanded(
                          child: Text(
                            colorName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                        
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
