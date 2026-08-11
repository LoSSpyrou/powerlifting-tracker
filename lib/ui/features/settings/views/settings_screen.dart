import 'package:flutter/material.dart';

import '../../../core/app_preview.dart';

class SettingsScreen extends StatelessWidget {
  @AppPreview(name: 'Settings Screen')
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Units (kg/lb) and theme go here')),
    );
  }
}
