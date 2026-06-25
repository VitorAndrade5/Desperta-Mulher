import 'package:flutter/material.dart';
import '../common/app_theme.dart';
import '../common/app_constants.dart';

class ProgressHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final String title;
  final String? description;

  const ProgressHeader({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = currentPage / totalPages;

    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.borderRadiusXL),
          bottomRight: Radius.circular(AppConstants.borderRadiusXL),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textWhite,
                        ),
                      ),
                      if (description != null) ...[
                        const SizedBox(height: AppConstants.spacing8),
                        Text(
                          description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFE8D5E8),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing12,
                    vertical: AppConstants.spacing8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                  ),
                  child: Text(
                    '$currentPage/$totalPages',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textWhite,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing20),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacing12),
            Text(
              '${(progress * 100).toStringAsFixed(0)}% concluído',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFE8D5E8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
