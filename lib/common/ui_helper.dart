import 'package:flutter/material.dart';

class UiHelper {
  UiHelper();

  ThemeData themeData(String themeMode) {
    if (themeMode == "LIGHT") {
      return ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F41BB),
          brightness: Brightness.light,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textStyle: WidgetStateProperty.all(
              TextStyle(
                inherit: true,
                fontWeight: FontWeight.w400,
                // fontFamily: Constants.app.FONT_POPPINS,
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
              TextStyle(
                inherit: true,
                fontWeight: FontWeight.w500,
                // fontFamily: Constants.app.FONT_POPPINS,
              ),
            ),
          ),
        ),
      );
    } else {
      return ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F41BB),
          brightness: Brightness.dark,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textStyle: WidgetStateProperty.all(
              TextStyle(
                inherit: false,
                fontWeight: FontWeight.w400,
                // fontFamily: Constants.app.FONT_POPPINS,
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
              TextStyle(
                inherit: false,
                fontWeight: FontWeight.w500,
                // fontFamily: Constants.app.FONT_POPPINS,
              ),
            ),
          ),
        ),
        // textTheme: TextTheme(
        //   bodyLarge: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   bodyMedium: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   bodySmall: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   labelLarge: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   labelMedium: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   labelSmall: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   titleLarge: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   titleMedium: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   titleSmall: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   headlineLarge: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   headlineMedium: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   headlineSmall: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   displayLarge: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   displayMedium: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        //   displaySmall: TextStyle(
        //     inherit: true,
        //     fontFamily: Constants.app.FONT_POPPINS,
        //   ),
        // ),
      );
    }
  }
}
