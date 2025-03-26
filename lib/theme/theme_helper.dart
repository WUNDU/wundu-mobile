import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors getThemeColors() {
    return supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.gray90001,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.black90001.withAlpha(25),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray30003.withAlpha(102),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray500,
          fontSize: 14.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray90002.withAlpha(204),
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 50.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 30.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: appTheme.gray90003,
          fontSize: 26.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
        headlineSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 25.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray900.withAlpha(102),
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 9.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.black90001.withAlpha(179),
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // Amber
  Color get amber100 => Color(0XFFFFF2B0);
  Color get amber200 => Color(0XFFF5D97E);
  Color get amber400 => Color(0XFFFFC727);
  Color get amber40001 => Color(0XFFFFD920);
  Color get amber600 => Color(0XFFF5BB00);

  // Black
  Color get black900 => Color(0XFF000000);
  Color get black90001 => Color(0XFF0B0B0B);

  // Blue
  Color get blue800 => Color(0XFF0940CE);
  Color get blue80001 => Color(0XFF0940CF);
  Color get blueA400 => Color(0XFF356FEE);
  Color get blueA40001 => Color(0XFF2E6FFE);
  Color get blueA700 => Color(0XFF1252F7);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray50 => Color(0XFFF1F1F2);
  Color get blueGray5001 => Color(0XFFF1F1F3);
  Color get blueGray6003f => Color(0X3F506773);
  Color get blueGray700 => Color(0XFF50555C);
  Color get blueGray70001 => Color(0XFF455A64);
  Color get blueGray800 => Color(0XFF37474F);
  Color get blueGray900 => Color(0XFF0F2045);
  Color get blueGray90001 => Color(0XFF263238);

  // DeepOrange
  Color get deepOrange300 => Color(0XFFFF725E);
  Color get deepOrangeA40019 => Color(0X19FF1F00);

  // DeepPurple
  Color get deepPurpleA200 => Color(0XFF8874FF);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFEBEBEB);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFE3E3E3);
  Color get gray30002 => Color(0XFFDBDBDB);
  Color get gray30003 => Color(0XFFE6E6E6);
  Color get gray400 => Color(0XFFB2B2B2);
  Color get gray40001 => Color(0XFFC7C7C7);
  Color get gray40007 => Color(0X07C3C7C6);
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray500 => Color(0XFFA6A6A6);
  Color get gray50001 => Color(0XFFA7A7A7);
  Color get gray50075 => Color(0X75A3A3A3);
  Color get gray500Cc => Color(0XCC979797);
  Color get gray5001 => Color(0XFFF7F7FF);
  Color get gray600 => Color(0XFF6D7471);
  Color get gray800 => Color(0XFF4F4F4F);
  Color get gray80001 => Color(0XFF444444);
  Color get gray900 => Color(0XFF050A2D);
  Color get gray90001 => Color(0XFF1E1E1E);
  Color get gray90002 => Color(0XFF141B34);
  Color get gray90003 => Color(0XFF121F1A);

  // Green
  Color get green100 => Color(0XFFC2E7D6);

  // Indigo
  Color get indigo600 => Color(0XFF254FAB);
  Color get indigo900 => Color(0XFF062D92);
  Color get indigo90001 => Color(0XFF143374);
  Color get indigoA200 => Color(0XFF6E68FF);

  // LightBlue
  Color get lightBlueA200 => Color(0XFF46CEFF);

  // Orange
  Color get orange600 => Color(0XFFE59400);
  Color get orange60001 => Color(0XFFE08F00);
  Color get orange700 => Color(0XFFD38200);
  Color get orange800 => Color(0XFFBC6F00);

  // Purple
  Color get purpleA200 => Color(0XFFEE33D5);

  // Red
  Color get red300 => Color(0XFFAD6359);
  Color get redA200 => Color(0XFFFF5959);

  // Teal
  Color get teal300 => Color(0XFF49B58F);
  Color get tealA400 => Color(0XFF00FFA4);

  // TealA
  Color get tealA2004c => Color(0X4C5BFCC3);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get whiteA70001 => Color(0XFFFDFDFD);

  // Yellow
  Color get yellow100 => Color(0XFFFFF6CA);
  Color get yellow300 => Color(0XFFFFF176);
  Color get yellow50 => Color(0XFFFFFBE7);
  Color get yellow700 => Color(0XFFF2BC1A);
  Color get yellow900 => Color(0XFFD68F30);
  Color get yellowA700 => Color(0XFFFFD400);
}
