import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/calculators/views/calculators_screen.dart';
import 'features/history/views/history_screen.dart';
import 'features/log/views/log_screen.dart';
import 'features/prs/views/prs_screen.dart';
import 'features/settings/views/settings_screen.dart';

class PowerliftingTrackerApp extends StatelessWidget {
  const PowerliftingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Powerlifting Tracker',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const _RootShell(),
    );
  }
}

class _RootShell extends StatefulWidget {
  const _RootShell();

  @override
  State<_RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<_RootShell> {
  int _index = 0;

  static const _screens = [
    LogScreen(),
    HistoryScreen(),
    CalculatorsScreen(),
    PrsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.edit_note), label: 'Log'),
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'History'),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Calculators',
          ),
          NavigationDestination(icon: Icon(Icons.emoji_events), label: 'PRs'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
