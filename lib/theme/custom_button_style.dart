import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blue800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray70001.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillDeepOrange => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepOrange300.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillGrayTL8 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray90001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillGreen => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillIndigoA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.indigoA200.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillTeal => ElevatedButton.styleFrom(
        backgroundColor: appTheme.teal300.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.whiteA700.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get fillYellowA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellowA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  // Outline button style
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.gray90001,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        padding: EdgeInsets.zero,
      );

  static ButtonStyle get outlineGrayTL6 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.gray30001,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.h),
        ),
        padding: EdgeInsets.zero,
      );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: Colors.transparent),
        ),
      );
}
