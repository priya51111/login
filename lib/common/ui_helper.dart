import 'package:flutter/material.dart';
import 'package:login/common/constans.dart';

class UiHelper {
  UiHelper();

  ThemeData themeData(String themeMode) {
    return ThemeData(
      brightness: themeMode == "LIGHT" ? Brightness.light : Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1F41BB),
        brightness: themeMode == "LIGHT" ? Brightness.light : Brightness.dark,
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          minimumSize: WidgetStateProperty.all(Size(160, 60)),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              inherit: false,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: Constants.FONT_POPPINS,
            ),
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              inherit: false,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: Constants.FONT_POPPINS,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              inherit: false,
              fontWeight: FontWeight.w500,
              fontFamily: Constants.FONT_POPPINS,
            ),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        bodyMedium: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        bodySmall: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        labelLarge: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        labelMedium: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        labelSmall: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        titleLarge: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        titleMedium: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        titleSmall: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        headlineLarge: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        headlineMedium: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        headlineSmall: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        displayLarge: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        displayMedium: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
        displaySmall: TextStyle(
          inherit: true,
          fontFamily: Constants.FONT_POPPINS,
        ),
      ),
    );
  }
}
