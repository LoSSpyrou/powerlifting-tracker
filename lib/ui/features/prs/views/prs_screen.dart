import 'package:flutter/material.dart';

class PrsScreen extends StatelessWidget {
  const PrsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PRs')),
      body: const Center(child: Text('Personal records leaderboard goes here')),
    );
  }
}
