import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cAccent,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Balance Total',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white70),
              ),
              const Spacer(),
              Text(
                'Este mes',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('\$3420.75',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.white, fontWeight: FontWeight.w800)
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const _Dot(color: AppTheme.cText),
              const SizedBox(width: 8),
              Text(
                'Ingresos',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white70),
              ),
              const Spacer(),
              const _Dot(color: AppTheme.cText),
              const SizedBox(width: 8),
              Text(
                'Gastos',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$2500.00',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '\$567.25',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}