import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Home
          _buildAnimatedNavItem(
            icon: ImageConstant.home,
            label: "Home",
            isSelected: widget.currentIndex == 0,
            onTap: () => widget.onTap(0),
          ),
          // Cards
          _buildAnimatedNavItem(
            icon: ImageConstant.creditCard,
            label: "Cartões",
            isSelected: widget.currentIndex == 1,
            onTap: () => widget.onTap(1),
          ),
          // Center button
          _buildAnimatedCenterButton(
            icon: ImageConstant.logoHome,
            onTap: () => widget.onTap(2),
          ),
          // Library
          _buildAnimatedNavItem(
            icon: ImageConstant.digitalLibrary,
            label: "Biblioteca",
            isSelected: widget.currentIndex == 3,
            onTap: () => widget.onTap(3),
          ),
          // Profile
          _buildAnimatedNavItem(
            icon: ImageConstant.user,
            label: "Perfil",
            isSelected: widget.currentIndex == 4,
            onTap: () => widget.onTap(4),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedNavItem({
    required String icon,
    required String label,
    double iconHeight = 30,
    double iconWidth = 30,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return _AnimatedNavButton(
      icon: icon,
      label: label,
      iconHeight: iconHeight,
      iconWidth: iconWidth,
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  Widget _buildAnimatedCenterButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return _AnimatedCenterButton(
      icon: icon,
      onTap: onTap,
    );
  }
}

class _AnimatedNavButton extends StatefulWidget {
  final String icon;
  final String label;
  final double iconHeight;
  final double iconWidth;
  final bool isSelected;
  final VoidCallback onTap;

  const _AnimatedNavButton({
    required this.icon,
    required this.label,
    this.iconHeight = 30,
    this.iconWidth = 30,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<_AnimatedNavButton> {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: widget.icon,
              height: widget.iconHeight,
              width: widget.iconWidth,
              color: widget.isSelected ? appTheme.blueA40001 : null,
            ),
            Text(
              widget.label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: widget.isSelected ? appTheme.blueA40001 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedCenterButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;

  const _AnimatedCenterButton({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_AnimatedCenterButton> createState() => _AnimatedCenterButtonState();
}

class _AnimatedCenterButtonState extends State<_AnimatedCenterButton> {
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
        child: CustomImageView(
          imagePath: widget.icon,
          height: 50.h,
          width: 52.h,
        ),
      ),
    );
  }
}
