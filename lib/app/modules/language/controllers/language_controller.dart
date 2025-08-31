import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  static const String _storageKey = 'selected_language';
  final GetStorage _storage = GetStorage();

  // Observable current locale
  final Rx<Locale> _currentLocale = const Locale('en', 'US').obs;
  Locale get currentLocale => _currentLocale.value;

  // Supported locales
  final List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  // Load saved language from storage
  void _loadSavedLanguage() {
    final savedLanguage = _storage.read(_storageKey);
    if (savedLanguage != null) {
      final parts = savedLanguage.split('_');
      if (parts.length == 2) {
        _currentLocale.value = Locale(parts[0], parts[1]);
        Get.updateLocale(_currentLocale.value);
      }
    }
  }

  // Change language
  void changeLanguage(Locale locale) {
    _currentLocale.value = locale;
    Get.updateLocale(locale);
    _storage.write(_storageKey, '${locale.languageCode}_${locale.countryCode}');

    // Confirmation message
    String messageKey = locale.languageCode == 'en'
        ? 'language_selected_en'
        : 'language_selected_fr';
    Get.snackbar(
      'language'.tr,
      messageKey.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // Get current language name
  String get currentLanguageName {
    switch (_currentLocale.value.languageCode) {
      case 'fr':
        return 'french'.tr;
      case 'en':
      default:
        return 'english'.tr;
    }
  }

  // Convenience getters
  bool get isFrench => _currentLocale.value.languageCode == 'fr';
  bool get isEnglish => _currentLocale.value.languageCode == 'en';

  // Get flag emoji for current language
  String get currentLanguageFlag {
    switch (_currentLocale.value.languageCode) {
      case 'fr':
        return '🇫🇷';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
