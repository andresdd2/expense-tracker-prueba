import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double amount;
  final String dateLabel;
  final bool isIncome;

  const TransactionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.dateLabel,
    this.isIncome = false,
  });

  @override
  Widget build(BuildContext context) {
    final amountWidth = MediaQuery.of(context).size.width * 0.26;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: isIncome
                  ? AppTheme.cAccent.withValues(alpha: .25) 
                  : AppTheme.cCard.withValues(alpha: .6), 
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.cText,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(color: AppTheme.cText.withValues(alpha: .8)),
                      ),
                      Icon(
                        Icons.event,
                        size: 16,
                        color: AppTheme.cText.withValues(alpha: .6),
                      ),
                      Text(
                        dateLabel,
                        style: TextStyle(color: AppTheme.cText.withValues(alpha: .6)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            SizedBox(
              width: amountWidth.clamp(90.0, 140.0),
              child: Text(
                (isIncome ? '+' : '-') + '\$' + amount.abs().toStringAsFixed(2),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: isIncome ? AppTheme.cAccent : AppTheme.cText,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
