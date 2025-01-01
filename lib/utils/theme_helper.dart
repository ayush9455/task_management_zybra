import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorSchemes = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the current theme's color scheme.
  ColorScheme _getColorScheme() {
    // You can fetch the theme dynamically if needed using PrefUtils, currently returning primary as default.
    return _supportedColorSchemes['primary'] ?? ColorSchemes.primaryColorScheme;
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    final colorScheme = _getColorScheme();
    return ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      splashColor: colorScheme.primary.withOpacity(0.3),
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: TextThemes.textTheme(colorScheme),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.r),
          ),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
        ),
      ),
      highlightColor: Colors.lightBlueAccent.shade700,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(colorScheme.primary),
        checkColor: WidgetStateProperty.all(Colors.white),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: Colors.grey.shade300,
        space: 0,
      ),
    );
  }

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        // Headings
        headlineLarge: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 36.0.sp, // Heading 01
          height: 1.2,

          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 32.0.sp, // Heading 02
          height: 1.2,

          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 28.0.sp, // Heading 03
          height: 1.3,

          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 24.0.sp, // Heading 04
          height: 1.3,

          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 20.0.sp, // Heading 04
          height: 1.3,

          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 16.0.sp, // Heading 04
          height: 1.3,

          fontWeight: FontWeight.w600,
        ),
        // Body text
        bodyLarge: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 18.0.sp, // Regular/Large
          height: 1.5,

          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 16.0.sp, // Regular/Base
          height: 1.5,

          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 14.0.sp, // Regular/Small

          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colorScheme.onSurface,
          fontSize: 12.0.sp, // Regular/XSmall

          fontWeight: FontWeight.w400,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    primary: Color.fromARGB(255, 172, 148, 215), // Forest Green
    secondary: Color(0xFF9E9E9E),
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
  );
}

/// Use globally accessible themes.
ThemeData get theme => ThemeHelper().themeData();
