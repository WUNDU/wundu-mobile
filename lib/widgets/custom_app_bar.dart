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
                    imagePath: ImageConstant.userProfile,
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
                  // Botão com animação de toque
                  _AnimatedIconButton(
                    icon: ImageConstant.wunduIA,
                    onTap: () {
                      // Ação ao tocar no botão
                    },
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  // Botão com animação de toque
                  _AnimatedIconButton(
                    icon: ImageConstant.notification,
                    onTap: () {
                      // Ação ao tocar no botão
                    },
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

class _AnimatedIconButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;

  const _AnimatedIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => isPressed = true);
      },
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => isPressed = false);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform:
            isPressed ? (Matrix4.identity()..scale(0.9)) : Matrix4.identity(),
        child: CustomIconButton(
          height: 40.h,
          width: 40.h,
          padding: EdgeInsets.all(8.h),
          decoration: IconButtonStyleHelper.outlineIndigoA,
          child: CustomImageView(
            imagePath: widget.icon,
          ),
        ),
      ),
    );
  }
}
