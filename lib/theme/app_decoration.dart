import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

class AppDecoration {
// Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
          color: appTheme.black90001.withValues(
        alpha: 0.1,
      ));

  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillBluegray5001 => BoxDecoration(
        color: appTheme.blueGray5001,
      );

  static BoxDecoration get fillTeal => BoxDecoration(
          color: appTheme.teal300.withValues(
        alpha: 0.2,
      ));
  static BoxDecoration get fillTeal300 => BoxDecoration(
          color: appTheme.teal300.withValues(
        alpha: 0.1,
      ));
  static BoxDecoration get fillWhiteA => BoxDecoration(
      color: appTheme.whiteA700,
      image: DecorationImage(
        image: AssetImage(
          ImageConstant.background,
        ),
        fit: BoxFit.fill,
      ));
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Gradient decorations
  static BoxDecoration get gradient03 => BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.03, 1),
            end: Alignment(1, 0),
            colors: [
              appTheme.yellowA700,
              appTheme.deepOrange300,
              appTheme.orange600
            ]),
      );

  static BoxDecoration get gradient2 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.blueGray900, appTheme.indigo600],
        ),
      );
// Gradiente decorations
  static BoxDecoration get gradiente => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.blueA400, appTheme.lightBlueA200],
        ),
      );
// Outline decorations
  static BoxDecoration get outline => BoxDecoration();
  static BoxDecoration get outlineBlack => BoxDecoration(
          border: Border.all(
        color: appTheme.black90001.withValues(
          alpha: 0.1,
        ),
        width: 1.h,
      ));
  static BoxDecoration get outlineBlack900 =>
      BoxDecoration(color: appTheme.whiteA700, boxShadow: [
        BoxShadow(
            color: appTheme.black900.withValues(
              alpha: 0.03,
            ),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ))
      ]);

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray900.withValues(
            alpha: 0.05,
          ),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray900 => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray900.withValues(
            alpha: 0.1,
          ),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray9001 => BoxDecoration(
          border: Border.all(
        color: appTheme.blueGray900,
        width: 4.h,
      ));

  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray30003,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
              color: appTheme.gray5001,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                4,
              ))
        ],
      );
  static BoxDecoration get outlineGray30003 => BoxDecoration(
          color: appTheme.whiteA700,
          border: Border.all(
            color: appTheme.gray30003,
            width: 0.5.h,
          ),
          boxShadow: [
            BoxShadow(
                color: appTheme.gray5001,
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(0, 1))
          ]);

  static BoxDecoration get outlineTealA => BoxDecoration(
          border: Border.all(
        color: appTheme.tealA400,
        width: 3.h,
      ));

  static BoxDecoration get outline1 => BoxDecoration();
// Primarycolor decorations
  static BoxDecoration get primarycolor => BoxDecoration(
        color: appTheme.yellowA700,
      );
}

class BorderRadiusStyle {
// Circle borders
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );

  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}
