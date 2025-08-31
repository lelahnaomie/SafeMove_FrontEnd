import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',

    // Light color scheme
    colorScheme: const ColorScheme.light(
      primary: Colors.black87,
      onPrimary: Colors.white,
      secondary: Colors.black54,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
      background: Colors.white,
      onBackground: Colors.black87,
    ),

    primaryColor: Colors.black87,

    // Background Colors
    scaffoldBackgroundColor: Colors.white,
    canvasColor: const Color(0xFFFAFAFA),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(color: Colors.black87),
      surfaceTintColor: Colors.white,
    ),

    // Drawer Theme
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),

    // List Tile Theme
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black54,
      textColor: Colors.black87,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black87, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.grey[700], fontFamily: 'Poppins'),
    ),

    // Text Theme with font
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      displayMedium: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      displaySmall: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      headlineLarge: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      headlineMedium: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      headlineSmall: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      titleLarge: TextStyle(
        color: Colors.black87,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Colors.black87,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Colors.black87,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: Colors.black87, fontFamily: 'Poppins'),
      bodyMedium: TextStyle(color: Colors.black54, fontFamily: 'Poppins'),
      bodySmall: TextStyle(color: Colors.black54, fontFamily: 'Poppins'),
      labelLarge: TextStyle(
        color: Colors.black87,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: Colors.black54),

    // Divider Theme
    dividerTheme: DividerThemeData(color: Colors.grey[300], thickness: 1),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',

    // Dark color scheme
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.white70,
      onSecondary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      background: Color(0xFF121212),
      onBackground: Colors.white,
    ),

    primaryColor: Colors.white,

    // Background Colors
    scaffoldBackgroundColor: const Color(0xFF121212),
    canvasColor: const Color(0xFF1E1E1E),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(color: Colors.white),
      surfaceTintColor: Color(0xFF1E1E1E),
    ),

    // Drawer Theme
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),

    // List Tile Theme
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white70,
      textColor: Colors.white,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black87, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.grey[700], fontFamily: 'Poppins'),
    ),

    // Text Theme with font
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      displayMedium: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      displaySmall: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headlineLarge: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headlineMedium: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headlineSmall: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
      bodySmall: TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: Colors.white70),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: Color(0xFF424242),
      thickness: 1,
    ),
  );
}
