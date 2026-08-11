import 'package:flutter/material.dart';

import '../../../../../data/services/database.dart';
import '../../../../../domain/models/format_weight.dart';
import '../../../../../domain/models/lift_display_name.dart';
import '../../../../../domain/models/lift_type.dart';
import '../../../../../domain/models/logged_set.dart';
import '../../../../core/app_preview.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class SetEntryTile extends StatelessWidget {
  const SetEntryTile({super.key, required this.loggedSet});

  final LoggedSet loggedSet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = loggedSet.entry;
    final unit = entry.unit == WeightUnit.kg ? 'kg' : 'lb';
    final accent = entry.rpe != null
        ? AppColors.rpeColor(entry.rpe!)
        : theme.colorScheme.primary;

    return ListTile(
      // The plate-color ramp is tuned to read as a swatch, not as freely
      // placed text — a bordered bar keeps even the near-white low-RPE end
      // visible against a light surface, the same way a real plate's rim
      // stays visible regardless of how light the plate itself is.
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
        liftDisplayName(loggedSet.lift),
        style: theme.textTheme.bodyLarge,
      ),
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
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
          ],
        ),
      ),
    );
  }
}

@AppPreview(name: 'Set Entry Tile')
Widget setEntryTilePreview() {
  return SetEntryTile(
    loggedSet: LoggedSet(
      lift: const Lift(id: 1, type: LiftType.squat),
      entry: SetEntry(
        id: 1,
        sessionId: 1,
        liftId: 1,
        weight: 140,
        reps: 5,
        rpe: 8.5,
        unit: WeightUnit.kg,
        createdAt: DateTime.now(),
      ),
    ),
  );
}
