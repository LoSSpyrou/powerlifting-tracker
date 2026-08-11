import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../domain/models/sex.dart';
import '../../../../../domain/use_cases/calculators/wilks_dots_math.dart';
import '../../../../core/theme/app_typography.dart';

class WilksDotsTab extends StatefulWidget {
  const WilksDotsTab({super.key});

  @override
  State<WilksDotsTab> createState() => _WilksDotsTabState();
}

class _WilksDotsTabState extends State<WilksDotsTab>
    with AutomaticKeepAliveClientMixin {
  final _bodyweightController = TextEditingController(text: '83');
  final _totalController = TextEditingController(text: '500');
  Sex _sex = Sex.male;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _bodyweightController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final bodyweight = double.tryParse(_bodyweightController.text);
    final total = double.tryParse(_totalController.text);
    final numericStyle = AppTypography.numeric(
      fontSize: 22,
      color: theme.colorScheme.onSurface,
    );

    double? dots;
    double? wilks;
    if (bodyweight != null && bodyweight > 0 && total != null && total > 0) {
      dots = calculateDots(sex: _sex, bodyweightKg: bodyweight, totalKg: total);
      wilks = calculateWilks(
        sex: _sex,
        bodyweightKg: bodyweight,
        totalKg: total,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: Text(
                  'MEN',
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
                selected: _sex == Sex.male,
                onSelected: (_) => setState(() => _sex = Sex.male),
              ),
              ChoiceChip(
                label: Text(
                  'WOMEN',
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
                selected: _sex == Sex.female,
                onSelected: (_) => setState(() => _sex = Sex.female),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _bodyweightController,
                  style: numericStyle,
                  decoration: const InputDecoration(
                    labelText: 'Bodyweight (kg)',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _totalController,
                  style: numericStyle,
                  decoration: const InputDecoration(labelText: 'Total (kg)'),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _ScoreCard(label: 'DOTS', value: dots, emphasize: true),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ScoreCard(label: 'WILKS', value: wilks),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final double? value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(label, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(
              value != null ? value!.toStringAsFixed(2) : '--',
              style: AppTypography.numeric(
                fontSize: 28,
                color: emphasize
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
