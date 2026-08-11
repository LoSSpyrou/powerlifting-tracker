import 'package:flutter/material.dart';

import '../adaptive_breakpoints.dart';

/// Centers [child] and caps its width at [maxWidth] so it doesn't stretch
/// full-bleed on a large window; has no effect once the window is narrower
/// than [maxWidth].
class ResponsiveContent extends StatelessWidget {
  const ResponsiveContent({
    super.key,
    required this.child,
    this.maxWidth = kContentMaxWidth,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
