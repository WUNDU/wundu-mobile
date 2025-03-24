import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class HomeScreenItemWidget extends StatelessWidget {
  HomeScreenItemWidget(this.model, {super.key});

  HomeScreenItemModel model;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    final bool isTablet = ScreenUtil().screenWidth > 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: isTablet ? 60.w : 50.w,
          width: isTablet ? 60.w : 50.w,
          padding: EdgeInsets.all(isTablet ? 14.w : 12.w),
          decoration: BoxDecoration(
            color: model.backgroundColor ?? appTheme.tealA2004c,
            borderRadius: BorderRadius.circular(isTablet ? 30.w : 24.w),
          ),
          child: model.iconPath != null
              ? CustomImageView(
                  imagePath: model.iconPath!,
                  fit: BoxFit.contain,
                )
              : SizedBox(),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.transactionType ?? "Transação",
                style: theme.textTheme.titleMedium,
              ),
              Text(
                model.ibanCounter ?? "Detalhes não disponíveis",
                style: theme.textTheme.labelLarge,
              )
            ],
          ),
        ),
        CustomIconButton(
          height: isTablet ? 28.w : 24.w,
          width: isTablet ? 28.w : 24.w,
          padding: EdgeInsets.all(6.w),
          decoration: IconButtonStyleHelper.none,
          child: CustomImageView(
            imagePath: ImageConstant.arrowRight, // Corrigido para arrowRight
          ),
        )
      ],
    );
  }
}
