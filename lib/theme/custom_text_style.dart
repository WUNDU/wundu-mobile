import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get mrsWintermouse {
    return copyWith(
      fontFamily: 'Mrs. Wintermouse',
    );
  }
}

class CustomTextStyles {
  // ignore: prefer_typing_uninitialized_variables
  static var titleMediumRed500cc;

// Body text style
  static TextStyle get bodyLargeBluegray900 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray900,
      );

  static TextStyle get bodyLargeDeeporange300 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.deepOrange300,
      );

  static TextStyle get bodyMediumMrsWintermouseGray600 =>
      theme.textTheme.bodyMedium!.mrsWintermouse.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );

  static TextStyle get bodySmallBlack90001 =>
      theme.textTheme.bodySmall!.copyWith(
          color: appTheme.black90001.withValues(
        alpha: 0.7,
      ));

  static TextStyle get bodySmallBlack9000110 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001.withValues(
          alpha: 0.7,
        ),
        fontSize: 10.fSize,
      );

  static TextStyle get bodySmallBlack90001_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001,
      );
  static TextStyle get bodySmallBlueA40001 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA40001,
      );
  static TextStyle get bodySmallInterBlack90001 =>
      theme.textTheme.bodySmall!.inter.copyWith(
          color: appTheme.black90001.withValues(
        alpha: 0.7,
      ));
  static TextStyle get bodySmallInterBluegray900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.blueGray900.withValues(
          alpha: 0.4,
        ),
      );
// Headline text style
  static TextStyle get headlineLarge32 =>
      theme.textTheme.headlineLarge!.copyWith(
        fontSize: 32.fSize,
      );
  static TextStyle get headlineMediumBold =>
      theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineMediumPoppinsGray800 =>
      theme.textTheme.headlineMedium!.poppins.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headlineMediumSemiBold =>
      theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headlineSmallBluegray900 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray900,
      );
  static TextStyle get headlineSmallBluegray900Medium =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
// Label text style
  static TextStyle get labelLargeBluegray900 =>
      theme.textTheme.labelLarge!.copyWith(
          color: appTheme.blueGray900.withValues(
        alpha: 0.9,
      ));
  static TextStyle get labelLargePoppinsBlack90001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
          color: appTheme.black90001.withValues(
        alpha: 0.8,
      ));
  static TextStyle get labelLargePoppinsBlack90001SemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(
          alpha: 0.7,
        ),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargePoppinsBlack90001SemiBold_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(
          alpha: 0.85,
        ),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargePoppinsBlack90001_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
          color: appTheme.black90001.withValues(
        alpha: 0.85,
      ));
  static TextStyle get labelLargePoppinsGray90002_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray90002,
      );
  static TextStyle get labelLargePoppinsWhiteA700 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargeWhiteA700 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeWhiteA700Bold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelMediumMedium =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelMediumMedium_1 =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelSmallMedium => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );

// Poppins text style
  static TextStyle get poppinsBlack900 => TextStyle(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      ).poppins;
// Title text style
  static TextStyle get titleLargeBluegray900 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
      );
  static TextStyle get titleLargeGray200 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray200,
      );
  static TextStyle get titleLargePoppinsBluegray900 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleLargeSemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleLargeSemiBold_1 =>
      theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleLargeSemiBold_2 =>
      theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumBluegray700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBluegray900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900.withValues(
          alpha: 0.4,
        ),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumGray500cc =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );
  static TextStyle get titleMediumGray90002 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumPoppinsBlack900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleMediumPoppinsBlack90001 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black90001,
      );
  static TextStyle get titleMediumPoppinsRedA200 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.redA200,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumWhiteA700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallBlack90001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withValues(
          alpha: 0.3,
        ),
      );

  static TextStyle get titleSmallBlack90001SemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallBlack90001_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );
  static TextStyle get titleSmallBlack90001_2 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );
  static TextStyle get titleSmallBlack90001_3 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withValues(
          alpha: 0.4,
        ),
      );
  static TextStyle get titleSmallBlack90001_4 =>
      theme.textTheme.titleSmall!.copyWith(
          color: appTheme.black90001.withValues(
        alpha: 0.9,
      ));

  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallInterBluegray900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallInterBluegray900SemiBold =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallInterGray200 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray200,
      );
  static TextStyle get titleSmallInterGray600 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallInterGray60015 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallInterGray60015_1 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallInterGray600Bold =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallInterGray90001 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray90001,
      );
  static TextStyle get titleSmallInterGray90003 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray90003,
      );
}
