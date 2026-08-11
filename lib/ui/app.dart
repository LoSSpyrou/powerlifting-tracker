import 'package:flutter/material.dart';

import 'core/adaptive_breakpoints.dart';
import 'core/theme/app_theme.dart';
import 'features/calculators/views/calculators_screen.dart';
import 'features/history/views/history_screen.dart';
import 'features/log/views/log_screen.dart';
import 'features/prs/views/prs_screen.dart';
import 'features/settings/views/settings_screen.dart';

class _Destination {
  const _Destination(this.icon, this.label);

  final IconData icon;
  final String label;
}

const _destinations = [
  _Destination(Icons.edit_note, 'Log'),
  _Destination(Icons.show_chart, 'History'),
  _Destination(Icons.calculate, 'Calculators'),
  _Destination(Icons.emoji_events, 'PRs'),
  _Destination(Icons.settings, 'Settings'),
];

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
    final content = IndexedStack(index: _index, children: _screens);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= kLargeScreenMinWidth) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    for (final d in _destinations)
                      NavigationRailDestination(
                        icon: Icon(d.icon),
                        label: Text(d.label),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: content),
              ],
            ),
          );
        }

        return Scaffold(
          body: content,
          bottomNavigationBar: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: [
              for (final d in _destinations)
                NavigationDestination(icon: Icon(d.icon), label: d.label),
            ],
          ),
        );
      },
    );
  }
}
