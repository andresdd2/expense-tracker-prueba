import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final valueStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 20, 
    );

    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 120),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppTheme.cAccent),
              const SizedBox(height: 10),
              Text(
                value,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.clip, 
                textScaler: const TextScaler.linear(1.0),
                style: valueStyle,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppTheme.cText.withValues(alpha: .8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
