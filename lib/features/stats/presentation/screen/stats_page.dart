import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas', 
          style: TextStyle(color:  AppTheme.cText, fontWeight: FontWeight.bold), ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        children: [
          const Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total Gastado',
                  value: '\$2,016.35',
                  icon: Icons.trending_up,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Promedio Diario',
                  value: '\$67.21',
                  icon: Icons.stacked_bar_chart,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Transacciones',
                  value: '47',
                  icon: Icons.pie_chart_outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            child: Container(
              height: 160,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, size: 40, color: AppTheme.cAccent),
                  const SizedBox(height: 8),
                  Text(
                    'Gráfico de gastos diarios',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppTheme.cAccent),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Gastos por Categorías',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800, color: AppTheme.cAccent),
          ),
          const SizedBox(height: 12),
          const _CategoryRow(name: 'Comida', amount: '\$450.50'),
          const _CategoryRow(name: 'Transporte', amount: '\$180.30'),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final String name;
  final String amount;
  const _CategoryRow({required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.cAccent,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
