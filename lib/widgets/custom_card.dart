import 'package:flutter/material.dart';
import '../common/app_theme.dart';
import '../common/app_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final Border? border;
  final BoxShadow? shadow;
  final VoidCallback? onTap;
  final bool isSelected;

  const CustomCard({
    Key? key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.shadow,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.durationMedium,
        padding: padding ?? const EdgeInsets.all(AppConstants.spacing16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.secondaryLight.withOpacity(0.1) : backgroundColor ?? AppTheme.cardColor,
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadiusLarge),
          border: border ?? Border.all(
            color: isSelected ? AppTheme.secondaryColor : AppTheme.textLight.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: shadow != null
              ? [shadow!]
              : [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                ],
        ),
        child: child,
      ),
    );
  }
}
