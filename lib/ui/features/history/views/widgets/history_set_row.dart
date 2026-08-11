import 'package:flutter/material.dart';

import '../../../../../domain/models/format_weight.dart';
import '../../../../../domain/models/lift_type.dart';
import '../../../../../domain/models/logged_set.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Same RPE-swatch-plus-readout layout as the Log screen's set list, but
/// dated rather than timestamped since history spans many sessions.
class HistorySetRow extends StatelessWidget {
  const HistorySetRow({super.key, required this.loggedSet});

  final LoggedSet loggedSet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = loggedSet.entry;
    final unit = entry.unit == WeightUnit.kg ? 'kg' : 'lb';
    final accent = entry.rpe != null
        ? AppColors.rpeColor(entry.rpe!)
        : theme.colorScheme.primary;
    final date = entry.createdAt;

    return ListTile(
      leading: SizedBox(
        width: 6,
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
            ),
          ),
        ),
      ),
      title: Text(
        '${date.month}/${date.day}/${date.year}',
        style: theme.textTheme.bodyLarge,
      ),
      trailing: Text.rich(
        TextSpan(
          style: AppTypography.numeric(
            fontSize: 16,
            color: theme.colorScheme.onSurface,
          ),
          children: [
            TextSpan(text: '${formatWeight(entry.weight)}$unit'),
            TextSpan(
              text: ' × ${entry.reps}',
              style: TextStyle(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            if (entry.rpe != null)
              TextSpan(
                text: ' @${entry.rpe!.toStringAsFixed(1)}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
          ],
        ),
      ),
    );
  }
}
