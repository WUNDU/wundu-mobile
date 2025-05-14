import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:solar_icons/solar_icons.dart';
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
            icon: SolarIconsOutline.home2,
            label: "Home",
            iconSize: 30.h,
            isSelected: widget.currentIndex == 0,
            onTap: () => widget.onTap(0),
          ),
          // Cards
          _buildAnimatedNavItem(
            icon: SolarIconsOutline.card,
            label: "Cartões",
            iconSize: 30.h,
            isSelected: widget.currentIndex == 1,
            onTap: () => widget.onTap(1),
          ),
          // Center button
          _buildAnimatedCenterButton(
            icon: SolarIconsOutline.addCircle,
            iconSize: 40.h,
            onTap: () => widget.onTap(2),
          ),
          // Library
          _buildAnimatedNavItem(
            icon: LucideIcons.library,
            label: "Biblioteca",
            iconSize: 30.h,
            isSelected: widget.currentIndex == 3,
            onTap: () => widget.onTap(3),
          ),
          // Profile
          _buildAnimatedNavItem(
            icon: LucideIcons.user,
            label: "Perfil",
            iconSize: 30.h,
            isSelected: widget.currentIndex == 4,
            onTap: () => widget.onTap(4),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedNavItem({
    required IconData icon,
    required String label,
    required double iconSize,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return _AnimatedNavButton(
      icon: icon,
      label: label,
      iconSize: iconSize,
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  Widget _buildAnimatedCenterButton({
    required IconData icon,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return _AnimatedCenterButton(
      icon: icon,
      iconSize: iconSize,
      onTap: onTap,
    );
  }
}

class _AnimatedNavButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final bool isSelected;
  final VoidCallback onTap;

  const _AnimatedNavButton({
    required this.icon,
    required this.label,
    required this.iconSize,
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
            Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.isSelected ? appTheme.blueA40001 : Colors.grey,
            ),
            Text(
              widget.label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: widget.isSelected ? appTheme.blueA40001 : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedCenterButton extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;

  const _AnimatedCenterButton({
    required this.icon,
    required this.iconSize,
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFFC727), // Fundo amarelo brilhante
        ),
        width: 50.h, // Tamanho do botão central
        height: 50.h,
        child: Center(
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Colors.white, // Ícone branco
          ),
        ),
      ),
    );
  }
}
