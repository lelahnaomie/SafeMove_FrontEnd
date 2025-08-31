import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/theme/controllers/theme_controller.dart';
import '../modules/language/controllers/language_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final languageController = Get.find<LanguageController>();

    return Drawer(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF2C2C2C)
                  : Colors.grey[800],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'app_name'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'app_subtitle'.tr,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildMenuItem(
                  Icons.home,
                  'home'.tr,
                  () => Get.offAllNamed('/home'),
                ),
                _buildMenuItem(Icons.person, 'profile'.tr, () {}),
                _buildMenuItem(
                  Icons.car_rental,
                  'vehicle_registration'.tr,
                  () => Get.toNamed('/vehicle-registration'),
                ),
                _buildMenuItem(
                  Icons.assignment,
                  'application_status'.tr,
                  () => Get.toNamed('/application-status'),
                ),

                const Divider(),

                // Theme & Language Settings
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'settings'.tr,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Obx(
                  () => _buildThemeOption(
                    0,
                    Icons.brightness_auto,
                    'system_default'.tr,
                    'follow_system'.tr,
                    themeController,
                  ),
                ),
                Obx(
                  () => _buildThemeOption(
                    1,
                    Icons.light_mode,
                    'light_mode'.tr,
                    'always_light'.tr,
                    themeController,
                  ),
                ),
                Obx(
                  () => _buildThemeOption(
                    2,
                    Icons.dark_mode,
                    'dark_mode'.tr,
                    'always_dark'.tr,
                    themeController,
                  ),
                ),

                const Divider(),

                _buildMenuItem(
                  Icons.language,
                  'language'.tr,
                  () => _showLanguageDialog(),
                ),

                const Divider(),

                _buildMenuItem(Icons.settings, 'general_settings'.tr, () {}),
                _buildMenuItem(Icons.help, 'help_support'.tr, () {}),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.info),
                  title: Text('about'.tr),
                  subtitle: Text('${'app_name'.tr} ${'version'.tr}'),
                  onTap: null,
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'logout'.tr,
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () => _showLogout(),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Divider(),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        themeController.themeIcon,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${'current_theme'.tr}${themeController.themeModeText}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        languageController.currentLanguageFlag,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        languageController.currentLanguageName,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${'app_name'.tr} ${'version'.tr}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Get.back();
        onTap();
      },
    );
  }

  Widget _buildThemeOption(
    int value,
    IconData icon,
    String title,
    String subtitle,
    ThemeController controller,
  ) {
    return RadioListTile<int>(
      value: value,
      groupValue: controller.themeModeValue,
      onChanged: (val) => controller.setThemeMode(val!),
      title: Text(title),
      subtitle: Text(subtitle),
      secondary: Icon(icon),
      activeColor: Get.theme.primaryColor,
    );
  }

  void _showLanguageDialog() {
    final languageController = Get.find<LanguageController>();

    Get.dialog(
      AlertDialog(
        title: Text('choose_language'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => ListTile(
                title: Text('english'.tr),
                leading: Radio<Locale>(
                  value: const Locale('en', 'US'),
                  groupValue: languageController.currentLocale,
                  onChanged: (value) {
                    languageController.changeLanguage(value!);
                    Get.back();
                  },
                ),
                trailing: const Text('🇺🇸', style: TextStyle(fontSize: 20)),
              ),
            ),
            Obx(
              () => ListTile(
                title: Text('french'.tr),
                leading: Radio<Locale>(
                  value: const Locale('fr', 'FR'),
                  groupValue: languageController.currentLocale,
                  onChanged: (value) {
                    languageController.changeLanguage(value!);
                    Get.back();
                  },
                ),
                trailing: const Text('🇫🇷', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
        ],
      ),
    );
  }

  void _showLogout() {
    Get.dialog(
      AlertDialog(
        title: Text('logout_title'.tr),
        content: Text('logout_message'.tr),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed('/login');
            },
            child: Text('logout'.tr),
          ),
        ],
      ),
    );
  }
}
