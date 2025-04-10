import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
// Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black90001.withValues(alpha: 0.1),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: appTheme.blueGray100,
      );
  static BoxDecoration get fillBluegray5001 => BoxDecoration(
        color: appTheme.blueGray5001,
      );
  static BoxDecoration get fillBluegray900 => BoxDecoration(
        color: appTheme.blueGray900.withValues(alpha: 0.3),
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillIndigoA => BoxDecoration(
        color: appTheme.indigoA200,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal300.withValues(alpha: 0.2),
      );
  static BoxDecoration get fillTeal300 => BoxDecoration(
        color: appTheme.teal300.withValues(alpha: 0.1),
      );
  static BoxDecoration get fillwhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.fill,
        ),
      );
  static BoxDecoration get fillwhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillwhiteA7001 => BoxDecoration(
        color: appTheme.whiteA700.withValues(alpha: 0.8),
      );

// Gradient decorations
  static BoxDecoration get gradient03 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.03, 1),
          end: const Alignment(1, 0),
          colors: [
            appTheme.yellowA700,
            appTheme.deepOrange300,
            appTheme.orange600,
          ],
        ),
      );
  static BoxDecoration get gradient2 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [appTheme.blueGray900, appTheme.indigo600],
        ),
      );

// Gradiente decorations
  static BoxDecoration get gradiente => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [appTheme.blueA400, appTheme.lightBlueA200],
        ),
      );

// Outline decorations
  static BoxDecoration get outline => BoxDecoration();
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black90001.withValues(alpha: 0.1),
          width: 1,
        ),
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withValues(alpha: 0.03),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      );

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray900.withValues(alpha: 0.05),
          width: 1,
        ),
      );

  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray100.withValues(alpha: 0.7),
          width: 1,
        ),
      );

  static BoxDecoration get outlineBluegray1001 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1,
        ),
      );

  static BoxDecoration get outlineBluegray900 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray900.withValues(alpha: 0.1),
          width: 1,
        ),
      );
  static BoxDecoration get outlineBluegray9001 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray900,
          width: 4,
        ),
      );

  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray30003,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5001,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get outlineGray30003 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray30003,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5001,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      );

  static BoxDecoration get outlineGray300031 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray30003.withValues(alpha: 0.9),
          width: 1,
        ),
      );

  static BoxDecoration get outlineGray300032 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray30003.withValues(alpha: 0.8),
          width: 1,
        ),
      );

  static BoxDecoration get outlineIndigoA => BoxDecoration(
        border: Border.all(
          color: appTheme.indigoA200.withValues(alpha: 0.7),
          width: 0.98,
        ),
      );

  static BoxDecoration get outlineTealA => BoxDecoration(
        border: Border.all(
          color: appTheme.tealA400,
          width: 3,
        ),
      );

  static BoxDecoration get outline1 => BoxDecoration();
// Primarycolor decorations
  static BoxDecoration get primarycolor => BoxDecoration(
        color: appTheme.yellowA700,
      );

// Vv decorations
  static BoxDecoration get vv2 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [appTheme.blue80001, appTheme.blueA700],
        ),
      );

// Row decorations
  static BoxDecoration get row2 => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.fill,
        ),
      );

  static BoxDecoration get row4 => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.fill,
        ),
      );

// Stack decorations
  static BoxDecoration get stack1 => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.fill,
        ),
      );

  static BoxDecoration get stack3 => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.fill,
        ),
      );
}

class BorderRadiusStyle {
// Circle borders
  static BorderRadius get circleBorder162 => BorderRadius.circular(162);
  static BorderRadius get circleBorder28 => BorderRadius.circular(28);
  static BorderRadius get circleBorder32 => BorderRadius.circular(32);
  static BorderRadius get circleBorder40 => BorderRadius.circular(40);
  static BorderRadius get circleBorder50 => BorderRadius.circular(50);

// Custom borders
  static BorderRadius get customBorderTL12 => BorderRadius.vertical(
        top: Radius.circular(12),
      );
  static BorderRadius get customBorderTL14 => BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
        bottomRight: Radius.circular(14),
      );

  static BorderRadius get customBorderTL141 => BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
        bottomLeft: Radius.circular(14),
      );

  static BorderRadius get customBorderTL22 => BorderRadius.vertical(
        top: Radius.circular(20),
      );

// Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(12);
  static BorderRadius get roundedBorder16 => BorderRadius.circular(16);
  static BorderRadius get roundedBorder20 => BorderRadius.circular(20);
  static BorderRadius get roundedBorder24 => BorderRadius.circular(24);
  static BorderRadius get roundedBorder4 => BorderRadius.circular(4);
  static BorderRadius get roundedBorder76 => BorderRadius.circular(76);
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8);
}
