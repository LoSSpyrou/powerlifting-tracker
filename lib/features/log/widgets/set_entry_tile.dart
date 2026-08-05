import 'package:flutter/material.dart';

import '../../../database/repositories/lift_display_name.dart';
import '../../../database/repositories/logged_set.dart';
import '../../../shared/models/format_weight.dart';
import '../../../shared/models/lift_type.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';

class SetEntryTile extends StatelessWidget {
  const SetEntryTile({super.key, required this.loggedSet});

  final LoggedSet loggedSet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = loggedSet.entry;
    final unit = entry.unit == WeightUnit.kg ? 'kg' : 'lb';
    final accent =
        entry.rpe != null ? AppColors.rpeColor(entry.rpe!) : theme.colorScheme.primary;

    return ListTile(
      leading: SizedBox(
        width: 6,
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      title: Text(liftDisplayName(loggedSet.lift), style: theme.textTheme.bodyLarge),
      subtitle: Text(TimeOfDay.fromDateTime(entry.createdAt).format(context)),
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
                style: TextStyle(color: accent, fontWeight: FontWeight.w700),
              ),
          ],
        ),
      ),
    );
  }
}
