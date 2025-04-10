import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appTheme.gray200,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.userProfile,
                        height: 44.h,
                        width: 44.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          welcomeMessage,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.h),
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
                      Navigator.pushNamed(
                          context, AppRoutes.notificationScreen);
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

  BoxDecoration _getButtonDecoration() {
    if (widget.icon == ImageConstant.wunduIA) {
      return BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(20.h),
        border: Border.all(
          color: appTheme.indigoA200,
          width: 1.5,
        ),
      );
    } else if (widget.icon == ImageConstant.notification) {
      return BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(20.h),
      );
    }
    return BoxDecoration(
      color: appTheme.whiteA700,
      borderRadius: BorderRadius.circular(8.h),
      border: Border.all(
        color: appTheme.gray300,
        width: 1.5,
      ),
    );
  }

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
        child: Container(
          height: 40.h,
          width: 40.h,
          padding: widget.icon == ImageConstant.wunduIA
              ? EdgeInsets.all(5.h)
              : EdgeInsets.all(6.h),
          decoration: _getButtonDecoration(),
          child: CustomImageView(
            imagePath: widget.icon,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
