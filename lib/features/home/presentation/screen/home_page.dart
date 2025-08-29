import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/transaction_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¡Hola, María!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text('Administra tus finanzas',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .8),
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        children: [
          const BalanceCard(),
          const SizedBox(height: 16),
          Text(
            'Acciones Rápidas',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: QuickActionCard(
                  title: 'Agregar\nIngreso',
                  subtitle: 'Registrar entrada',
                  icon: Icons.south_west,
                  color: AppTheme.cAccent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: QuickActionCard(
                  title: 'Agregar Gasto',
                  subtitle: 'Registrar salida',
                  icon: Icons.north_east,
                  color: AppTheme.cAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Transacciones Recientes',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Ver todas')),
            ],
          ),
          const TransactionTile(
            title: 'Almuerzo restaurante',
            subtitle: 'Comida',
            amount: -45.50,
            dateLabel: 'Hoy',
          ),
          const TransactionTile(
            title: 'Pago mensual',
            subtitle: 'Salario',
            amount: 2500.00,
            dateLabel: 'Ayer',
            isIncome: true,
          ),
          const TransactionTile(
            title: 'Gasolina',
            subtitle: 'Transporte',
            amount: -89.99,
            dateLabel: '2 dic',
          ),
        ],
      ),
    );
  }
}
