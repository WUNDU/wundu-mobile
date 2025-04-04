import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get poppins1 {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get inter1 {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get inter2 {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get openSans1 {
    return copyWith(
      fontFamily: 'Open Sans',
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

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeBluegray900 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray900,
      );

  static TextStyle get bodyLargeDeeporange300 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.deepOrange300,
      );

  static TextStyle get bodyLargeTeal300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.teal300,
      );

  static TextStyle get bodyMediumInter1Gray90001 =>
      theme.textTheme.bodyMedium!.inter1.copyWith(
        color: appTheme.gray90001.withValues(alpha: 0.9),
      );

  static TextStyle get bodyMediumInter1Gray90001_1 =>
      theme.textTheme.bodyMedium!.inter1.copyWith(
        color: appTheme.gray90001.withValues(alpha: 0.9),
      );

  static TextStyle get bodyMediumMrsWintermouseGray600 =>
      theme.textTheme.bodyMedium!.mrsWintermouse.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );

  static TextStyle get bodyMediumPoppins1Black90001 =>
      theme.textTheme.bodyMedium!.poppins1.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.8),
      );

  static TextStyle get bodyMediumPoppins1Black90001_1 =>
      theme.textTheme.bodyMedium!.poppins1.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.5),
      );

  static TextStyle get bodySmallBlack90001 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
      );

  static TextStyle get bodySmallBlack9000110 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
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

  static TextStyle get bodySmallBluegray900 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray900,
      );

  static TextStyle get bodySmallInter1Black90001 =>
      theme.textTheme.bodySmall!.inter1.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
      );

  static TextStyle get bodySmallInter1Gray50001 =>
      theme.textTheme.bodySmall!.inter1.copyWith(
        color: appTheme.gray50001,
      );

  static TextStyle get bodySmallInter2Gray400 =>
      theme.textTheme.bodySmall!.inter2.copyWith(
        color: appTheme.gray400,
      );

  static TextStyle get bodySmallInter2Gray90001 =>
      theme.textTheme.bodySmall!.inter2.copyWith(
        color: appTheme.gray90001.withValues(alpha: 0.7),
        fontSize: 8.fSize,
      );

  static TextStyle get bodySmallInterBlack90001 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
      );

  static TextStyle get bodySmallInterBluegray900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.4),
      );

  static TextStyle get bodySmallwhiteA700 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );

  // Display text style
  static TextStyle get displayMediumWhiteA700 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );

  // Headline text style
  static TextStyle get headlineLarge32 =>
      theme.textTheme.headlineLarge!.copyWith(
        fontSize: 32.fSize,
      );

  static TextStyle get headlineLargeWhiteA700 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
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

  static TextStyle get headlineSmallBluegray90024 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 24.fSize,
      );

  static TextStyle get headlineSmallBluegray900Medium =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );

  // Label text style
  static TextStyle get labelLargeBlack90001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeBluegray900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.9),
      );

  static TextStyle get labelLargeBluegray90001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray90001,
      );

  static TextStyle get labelLargeGray90001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90001.withValues(alpha: 0.3),
        fontSize: 13.fSize,
      );

  static TextStyle get labelLargeGray90001SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90001.withValues(alpha: 0.8),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeGray90001_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90001,
      );

  static TextStyle get labelLargePoppinsBlack90001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.8),
      );

  static TextStyle get labelLargePoppinsBlack90001SemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.7),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargePoppinsBlack90001SemiBold_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.85),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargePoppinsBlack90001_1 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.85),
      );

  static TextStyle get labelLargePoppinsBlack90001_2 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.85),
      );

  static TextStyle get labelLargePoppinsGray90002 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray90002,
      );

  static TextStyle get labelLargePoppinsGray90002SemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w600,
      );

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

  static TextStyle get labelMediumGray90001 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90001,
      );

  static TextStyle get labelMediumMedium =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelMediumMedium1 =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelSmallBold => theme.textTheme.labelSmall!.copyWith(
        fontSize: 8.fSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelSmallGray90002 =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray90002,
        fontSize: 8.fSize,
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

  static TextStyle get titleMediumBluegray70001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBluegray900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.4),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBluegray900SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.9),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBluegray900SemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.6),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumDeeporange300 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepOrange300,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumGray500cc =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );

  static TextStyle get titleMediumGray90001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumGray90002 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumIndigoA200 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumPoppins1Bluegray900 =>
      theme.textTheme.titleMedium!.poppins1.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.9),
      );

  static TextStyle get titleMediumPoppins1Bluegray90001 =>
      theme.textTheme.titleMedium!.poppins1.copyWith(
        color: appTheme.blueGray90001,
      );

  static TextStyle get titleMediumPoppins1Bluegray90001_1 =>
      theme.textTheme.titleMedium!.poppins1.copyWith(
        color: appTheme.blueGray90001,
      );

  static TextStyle get titleMediumPoppins1DeeppurpleA200 =>
      theme.textTheme.titleMedium!.poppins1.copyWith(
        color: appTheme.deepPurpleA200,
      );

  static TextStyle get titleMediumPoppins1PurpleA200 =>
      theme.textTheme.titleMedium!.poppins1.copyWith(
        color: appTheme.purpleA200,
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

  static TextStyle get titleMediumTea1300 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.teal300,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumWhiteA700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumWhiteA700Bold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMediumWhiteA700Bold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallBlack90001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.3),
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
        color: appTheme.black90001.withValues(alpha: 0.4),
      );

  static TextStyle get titleSmallBlack90001_4 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001.withValues(alpha: 0.9),
      );

  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );

  static TextStyle get titleSmallInter1Bluegray900 =>
      theme.textTheme.titleSmall!.inter1.copyWith(
        color: appTheme.blueGray900.withValues(alpha: 0.6),
      );

  static TextStyle get titleSmallInter1WhiteA700 =>
      theme.textTheme.titleSmall!.inter1.copyWith(
        color: appTheme.whiteA700,
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

  static TextStyle get titleSmallOpenSans1Gray50001 =>
      theme.textTheme.titleSmall!.openSans1.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
}
