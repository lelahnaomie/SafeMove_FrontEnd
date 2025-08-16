import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Create an Account',
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
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              
              // Champ Name
              _buildLabel('Name'),
              _buildTextField(
                controller: controller.nameController,
                hint: 'e.g. Safe Move',
                keyboardType: TextInputType.name,
                errorKey: 'name',
              ),
              
              const SizedBox(height: 24),
              
              // Champ Email
              _buildLabel('Email Address'),
              _buildTextField(
                controller: controller.emailController,
                hint: 'e.g. safemove@gmail.com',
                keyboardType: TextInputType.emailAddress,
                errorKey: 'email',
              ),
              
              const SizedBox(height: 24),
              
              // Champ Phone
              _buildLabel('Phone Number'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  children: [
                    // Sélecteur de pays
                    GestureDetector(
                      onTap: () => _showCountryPicker(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Obx(() => Text(
                              controller.selectedCountryFlag.value,
                              style: const TextStyle(fontSize: 20),
                            )),
                            const SizedBox(width: 6),
                            Obx(() => Text(
                              controller.selectedCountryCode.value,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    
                    // Divider
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.grey[300],
                    ),
                    
                    // Champ de téléphone
                    Expanded(
                      child: TextField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        decoration: InputDecoration(
                          hintText: '657 97 28 21',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => controller.formErrors['phone'] != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 6, left: 4),
                      child: Text(
                        controller.formErrors['phone']!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              
              const SizedBox(height: 24),
              
              // Champ City (Sélecteur personnalisé)
              _buildLabel('City'),
              GestureDetector(
                onTap: () => controller.selectCity(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(() => Text(
                          controller.selectedCity.value.isEmpty
                              ? 'e.g. Fowalab Arrel'
                              : controller.selectedCity.value,
                          style: TextStyle(
                            color: controller.selectedCity.value.isEmpty
                                ? Colors.grey[400]
                                : Colors.grey[700],
                            fontSize: 16,
                          ),
                        )),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => controller.formErrors['city'] != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 6, left: 4),
                      child: Text(
                        controller.formErrors['city']!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              
              const SizedBox(height: 24),
              
              // Champ Referral Code
              _buildLabel('Referral Code (Optional)'),
              _buildTextField(
                controller: controller.referralController,
                hint: 'e.g. SFGEG4',
                textCapitalization: TextCapitalization.characters,
              ),
              
              const SizedBox(height: 30),
              
              // Checkbox des termes
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Checkbox(
                    value: controller.acceptTerms.value,
                    onChanged: (value) => controller.toggleTerms(),
                    activeColor: const Color(0xFFE91E63),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 1.4,
                          ),
                          children: const [
                            TextSpan(text: 'En continuant, j\'accepte les '),
                            TextSpan(
                              text: 'termes d\'utilisation',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: ' et la '),
                            TextSpan(
                              text: 'politique de confidentialité',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Bouton Créer un Compte
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    elevation: 0,
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
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Créer un Compte',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                )),
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A1A1A),
        ),
      ),
    );
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
    String? errorKey,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
        if (errorKey != null)
          Obx(() => this.controller.formErrors[errorKey] != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    this.controller.formErrors[errorKey]!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                )
              : const SizedBox.shrink()),
      ],
    );
  }
  
  void _showCountryPicker(BuildContext context) {
    final countries = [
      {'name': 'Cameroon', 'code': '+237', 'flag': '🇨🇲'},
      {'name': 'France', 'code': '+33', 'flag': '🇫🇷'},
      {'name': 'USA', 'code': '+1', 'flag': '🇺🇸'},
      {'name': 'Nigeria', 'code': '+234', 'flag': '🇳🇬'},
      {'name': 'Côte d\'Ivoire', 'code': '+225', 'flag': '🇨🇮'},
      {'name': 'Senegal', 'code': '+221', 'flag': '🇸🇳'},
    ];
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Country',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...countries.map((country) => ListTile(
              leading: Text(
                country['flag']!,
                style: const TextStyle(fontSize: 28),
              ),
              title: Text(country['name']!),
              trailing: Text(
                country['code']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                controller.setCountry(country['code']!, country['flag']!);
                Get.back();
              },
            )).toList(),
          ],
        ),
      ),
    );
  }
}
