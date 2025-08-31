import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/theme/controllers/theme_controller.dart';
import 'app/modules/language/controllers/language_controller.dart';
import 'app/utils/app_themes.dart';
import 'app/modules/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialization GetStorage for theme and language
  await GetStorage.init();

  // Configuration de l'orientation (portrait uniquement)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initializing controllers
  Get.put(ThemeController());
  Get.put(LanguageController());

  runApp(const SafeMoveApp());
}

class SafeMoveApp extends StatelessWidget {
  const SafeMoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final languageController = Get.find<LanguageController>();

    return GetMaterialApp(
      title: 'SafeMove',
      debugShowCheckedModeBanner: false,

      // Theme configuration with your existing brand colors
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeController.themeMode,

      // Internationalization configuration
      translations: AppTranslations(),
      locale: languageController.currentLocale,
      fallbackLocale: const Locale('en', 'US'),

      initialRoute: '/splash', // Démarrage sur le splash screen
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),

      builder: (context, child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        // Configuration de la barre de statut dynamique selon le thème
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isDark
                ? Brightness.light
                : Brightness.dark,
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
            systemNavigationBarColor: isDark
                ? const Color(0xFF121212)
                : Colors.white,
            systemNavigationBarIconBrightness: isDark
                ? Brightness.light
                : Brightness.dark,
          ),
        );

        return child!;
      },
    );
  }
}
