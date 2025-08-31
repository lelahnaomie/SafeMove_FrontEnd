import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _themeKey = 'app_theme_mode';

  // Observable theme mode - 0: System, 1: Light, 2: Dark
  final _themeMode = 0.obs;
  int get themeModeValue => _themeMode.value;

  // Theme mode for GetMaterialApp
  ThemeMode get themeMode {
    switch (_themeMode.value) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // Theme mode name for display
  String get themeModeText {
    switch (_themeMode.value) {
      case 1:
        return 'Light';
      case 2:
        return 'Dark';
      default:
        return 'System';
    }
  }

  // Theme icon
  IconData get themeIcon {
    switch (_themeMode.value) {
      case 1:
        return Icons.light_mode;
      case 2:
        return Icons.dark_mode;
      default:
        return Icons.brightness_auto;
    }
  }

  // Check if current theme is dark
  bool get isDarkMode {
    if (_themeMode.value == 2) return true;
    if (_themeMode.value == 1) return false;
    // For system mode, checking actual brightness
    return Get.isDarkMode;
  }

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  /// Loading theme preference from storage
  void _loadThemeFromStorage() {
    _themeMode.value = _box.read(_themeKey) ?? 0;
  }

  /// Setting theme mode
  void setThemeMode(int mode) {
    _themeMode.value = mode;
    _box.write(_themeKey, mode);

    // Applying theme change
    ThemeMode newThemeMode;
    switch (mode) {
      case 1:
        newThemeMode = ThemeMode.light;
        break;
      case 2:
        newThemeMode = ThemeMode.dark;
        break;
      default:
        newThemeMode = ThemeMode.system;
        break;
    }

    Get.changeThemeMode(newThemeMode);
  }

  // Toggle between light and dark
  void toggleTheme() {
    if (_themeMode.value == 1) {
      setThemeMode(2); // Light -> Dark
    } else {
      setThemeMode(1); // Dark or System -> Light
    }
  }
}
