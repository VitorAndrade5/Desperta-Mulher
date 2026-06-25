import 'package:flutter/material.dart';
import '../common/app_theme.dart';
import '../common/app_constants.dart';

class EnhancedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final double? width;
  final double height;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;

  const EnhancedButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.width,
    this.height = AppConstants.buttonHeightMedium,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = false,
  }) : super(key: key);

  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppTheme.primaryColor;
      case ButtonVariant.secondary:
        return AppTheme.secondaryColor;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.danger:
        return AppTheme.dangerColor;
      case ButtonVariant.success:
        return AppTheme.successColor;
    }
  }

  Color _getForegroundColor() {
    if (variant == ButtonVariant.outline) {
      return AppTheme.primaryColor;
    }
    return AppTheme.textWhite;
  }

  BorderSide? _getBorderSide() {
    if (variant == ButtonVariant.outline) {
      return const BorderSide(
        color: AppTheme.primaryColor,
        width: 2,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidget = SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getForegroundColor(),
          side: _getBorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
          elevation: variant == ButtonVariant.outline ? 0 : 4,
          disabledBackgroundColor: AppTheme.textLight.withOpacity(0.3),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(_getForegroundColor()),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: AppConstants.iconSizeMedium),
                    const SizedBox(width: AppConstants.spacing8),
                  ],
                  Text(label),
                ],
              ),
      ),
    );

    return buttonWidget;
  }
}

enum ButtonVariant { primary, secondary, outline, danger, success }
