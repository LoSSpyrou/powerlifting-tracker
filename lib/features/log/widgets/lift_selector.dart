import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../database/database.dart';
import '../../../database/repositories/lift_display_name.dart';

class LiftSelector extends StatelessWidget {
  const LiftSelector({
    super.key,
    required this.lifts,
    required this.selectedLiftId,
    required this.onSelected,
  });

  final List<Lift> lifts;
  final int? selectedLiftId;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (final lift in lifts)
          ChoiceChip(
            label: Text(
              liftDisplayName(lift).toUpperCase(),
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
            selected: lift.id == selectedLiftId,
            onSelected: (_) => onSelected(lift.id),
          ),
      ],
    );
  }
}
