import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';

/// The judges' decision panel from a powerlifting meet: three white lights
/// mean a good lift. Flashes once, in sequence, to confirm a set was logged.
class ThreeLights extends StatefulWidget {
  const ThreeLights({super.key, required this.trigger});

  /// Bump this value to replay the animation.
  final int trigger;

  @override
  State<ThreeLights> createState() => _ThreeLightsState();
}

class _ThreeLightsState extends State<ThreeLights>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void didUpdateWidget(covariant ThreeLights oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger != oldWidget.trigger) {
      if (MediaQuery.of(context).disableAnimations) {
        _controller.value = 1;
      } else {
        _controller.forward(from: 0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final delay = index * 0.15;
            final t = ((_controller.value - delay) / 0.3).clamp(0.0, 1.0);
            final lit = Curves.easeOut.transform(t);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.lerp(Colors.transparent, AppColors.chalk, lit),
                  border: Border.all(
                    color: AppColors.chalk.withValues(alpha: 0.5),
                  ),
                  boxShadow: lit > 0.1
                      ? [
                          BoxShadow(
                            color: AppColors.chalk.withValues(alpha: 0.6 * lit),
                            blurRadius: 10,
                          ),
                        ]
                      : null,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
