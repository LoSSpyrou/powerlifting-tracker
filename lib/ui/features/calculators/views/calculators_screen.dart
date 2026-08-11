import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_content.dart';
import 'widgets/one_rep_max_tab.dart';
import 'widgets/plate_loader_tab.dart';
import 'widgets/wilks_dots_tab.dart';

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
        body: const ResponsiveContent(
          child: TabBarView(
            children: [PlateLoaderTab(), OneRepMaxTab(), WilksDotsTab()],
          ),
        ),
      ),
    );
  }
}
