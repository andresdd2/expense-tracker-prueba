import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  bool isExpense = true;
  DateTime date = DateTime(2025, 8, 22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Transacción', style: TextStyle( fontWeight: FontWeight.bold),), 
        centerTitle: false
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Segmented(
              isExpense: isExpense,
              onChanged: (v) => setState(() => isExpense = v),
            ),
            const SizedBox(height: 16),
            Text('Cantidad', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(prefixText: ' \$ '),
            ),
            const SizedBox(height: 20),
            Text('Categoría', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _CategoryChip(label: 'Comida'),
                _CategoryChip(label: 'Transporte'),
                _CategoryChip(label: 'Entretenimiento'),
                _CategoryChip(label: 'Salud'),
                _CategoryChip(label: 'Compras'),
                _CategoryChip(label: 'Servicios'),
              ],
            ),
            const SizedBox(height: 20),
            Text('Descripción', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(hintText: 'Agregar una nota...'),
            ),
            const SizedBox(height: 20),
            Text('Fecha', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: '22/08/2025'),
                    readOnly: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.event),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 56),
              ],
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: isExpense
                      ? AppTheme.cCard.withOpacity(
                          .8,
                        ) 
                      : AppTheme.cAccent,
                ),
                child: Text(isExpense ? 'Guardar Gasto' : 'Guardar Ingreso'),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _Segmented extends StatelessWidget {
  final bool isExpense;
  final ValueChanged<bool> onChanged;
  const _Segmented({required this.isExpense, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<bool>(
      segments: const [
        ButtonSegment(value: true, label: Text('Gasto')),
        ButtonSegment(value: false, label: Text('Ingreso')),
      ],
      selected: {isExpense},
      onSelectionChanged: (s) => onChanged(s.first),
      style: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  const _CategoryChip({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}