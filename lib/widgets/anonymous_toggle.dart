import 'package:flutter/material.dart';
import '../common/app_theme.dart';
import '../common/app_constants.dart';

class AnonymousToggle extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  const AnonymousToggle({
    Key? key,
    required this.onChanged,
    this.initialValue = false,
  }) : super(key: key);

  @override
  State<AnonymousToggle> createState() => _AnonymousToggleState();
}

class _AnonymousToggleState extends State<AnonymousToggle> {
  late bool _isAnonymous;

  @override
  void initState() {
    super.initState();
    _isAnonymous = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _isAnonymous ? Icons.privacy_tip : Icons.person,
            color: AppTheme.primaryColor,
            size: AppConstants.iconSizeMedium,
          ),
          const SizedBox(width: AppConstants.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isAnonymous ? 'Modo Anônimo' : 'Modo Identificado',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Text(
                  _isAnonymous
                      ? 'Sua resposta não será registrada'
                      : 'Sua resposta será associada a seu perfil',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isAnonymous,
            onChanged: (value) {
              setState(() => _isAnonymous = value);
              widget.onChanged(value);
            },
            activeColor: AppTheme.secondaryColor,
            inactiveTrackColor: AppTheme.textLight.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
