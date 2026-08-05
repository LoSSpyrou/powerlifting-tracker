import 'package:flutter/material.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculators'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Plate Loader'),
              Tab(text: '1RM'),
              Tab(text: 'Wilks/DOTS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Plate loading calculator goes here')),
            Center(child: Text('1RM estimator goes here')),
            Center(child: Text('Wilks/DOTS calculator goes here')),
          ],
        ),
      ),
    );
  }
}
