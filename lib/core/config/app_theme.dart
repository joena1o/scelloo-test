import 'package:flutter/material.dart';
import 'package:scelloo_blog_app/core/app_colors.dart';

class MainAppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(color: Colors.white,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey, // Set the border color
          width: 1, // Set the border width
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.blue, // Border color when focused
          width: 1, // Border width when focused
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error border color
          width: 1,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error color when focused
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.lightColor,
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
      fontFamily: "Montserrat",
      //brightness: Brightness.dark, // Enable dark mode brightness
      appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
        color: Color.fromARGB(255, 42, 42, 42),
          titleTextStyle: TextStyle(fontSize: 16)
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.white70, // Lighter border color for dark theme
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.5), // Softer disabled color
            width: 1.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.red, // Error border color
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Colors.red, // Error color when focused
            width: 1,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: AppColors.lightColor,
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      scaffoldBackgroundColor:
          const Color.fromARGB(255, 42, 42, 42), // Dark background
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark), // Dark theme color scheme
      useMaterial3: true);
}
