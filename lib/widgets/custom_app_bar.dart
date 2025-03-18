import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String welcomeMessage;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.welcomeMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 74.h,
      backgroundColor: appTheme.whiteA700,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.logoHome,
                    height: 50.h,
                    width: 50.h,
                    radius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          welcomeMessage,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  CustomIconButton(
                    height: 40.h,
                    width: 40.h,
                    padding: EdgeInsets.all(8.h),
                    decoration: IconButtonStyleHelper.outlineIndigoA,
                    child: CustomImageView(
                      imagePath: ImageConstant.wunduIA,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  CustomIconButton(
                    height: 40.h,
                    width: 40.h,
                    padding: EdgeInsets.all(8.h),
                    decoration: IconButtonStyleHelper.fillBlueGray,
                    child: CustomImageView(
                      imagePath: ImageConstant.notification,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(74.h);
}
