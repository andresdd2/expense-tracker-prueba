import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración',), 
        centerTitle: false
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Perfil'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.palette_outlined),
              title: Text('Apariencia'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Privacidad'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
