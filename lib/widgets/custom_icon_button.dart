import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineIndigoA => BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        border: Border.all(
          color: appTheme.indigoA200.withValues(
            alpha: 0.46,
          ),
          width: 1.h,
        ),
      );

  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900.withValues(
          alpha: 0.39,
        ),
        borderRadius: BorderRadius.circular(20.h),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300.withValues(
          alpha: 0.53,
        ),
        borderRadius: BorderRadius.circular(20.h),
      );
  static BoxDecoration get fillYellowA => BoxDecoration(
        color: appTheme.yellowA700.withValues(
          alpha: 0.3,
        ),
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
  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.alignment,
      this.height,
      this.width,
      this.decoration,
      this.padding,
      this.onTap,
      this.child});

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
            alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: appTheme.blueGray900.withValues(
                  alpha: 0.39,
                ),
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
