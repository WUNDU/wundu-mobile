import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineIndigoA => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        border: Border.all(
          // ignore: deprecated_member_use
          color: appTheme.indigoA200.withOpacity(0.46),
          width: 1.h,
        ),
      );

  static BoxDecoration get fillBlueGray => BoxDecoration(
        // ignore: deprecated_member_use
        color: appTheme.blueGray900.withOpacity(0.39),
        borderRadius: BorderRadius.circular(20.h),
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300.withOpacity(0.53),
        borderRadius: BorderRadius.circular(20.h),
      );

  static BoxDecoration get fillYellowA => BoxDecoration(
        color: appTheme.yellowA700.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24.h),
      );

  static BoxDecoration get gradientYellowAToOrange => BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0.03, 1),
          end: Alignment(1.0, 0),
          colors: [appTheme.yellowA700, appTheme.orange600],
        ),
      );

  static BoxDecoration get fillBlueGrayTL14 => BoxDecoration(
        color: appTheme.blueGray100,
        borderRadius: BorderRadius.circular(14.h),
      );

  static BoxDecoration get fillBlueGrayTL16 => BoxDecoration(
        color: appTheme.blueGray900.withOpacity(0.39),
        borderRadius: BorderRadius.circular(16.h),
      );

  static BoxDecoration get fillBlueGrayTL10 => BoxDecoration(
        color: appTheme.blueGray100,
        borderRadius: BorderRadius.circular(10.h),
      );

  static BoxDecoration get outlineIndigo => BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
      );

  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber200,
        borderRadius: BorderRadius.circular(30.h),
      );

  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  });

  final Alignment? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: appTheme.blueGray900.withOpacity(0.39),
                borderRadius: BorderRadius.circular(12.h),
              ),
          child: IconButton(
            padding: padding ?? EdgeInsets.zero,
            onPressed: onTap,
            icon: child ?? Container(),
          ),
        ),
      );
}
