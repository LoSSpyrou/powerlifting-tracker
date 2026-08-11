import 'package:flutter/material.dart';

import '../../../core/app_preview.dart';

class PrsScreen extends StatelessWidget {
  @AppPreview(name: 'PRs Screen')
  const PrsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PRs')),
      body: const Center(child: Text('Personal records leaderboard goes here')),
    );
  }
}
