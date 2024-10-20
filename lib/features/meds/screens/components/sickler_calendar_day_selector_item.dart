import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/core.dart';

class SicklerCalendarDaySelectorItem extends StatefulWidget {
  const SicklerCalendarDaySelectorItem({
    super.key,
    this.color,
    this.backgroundColor,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<SicklerCalendarDaySelectorItem> createState() =>
      _SicklerCalendarDaySelectorItemState();
}

class _SicklerCalendarDaySelectorItemState
    extends State<SicklerCalendarDaySelectorItem>
    with TickerProviderStateMixin {
  final Color _color = AppColours.purple40;

  late final AnimationController animationController;
  late final AnimationController colorAnimationController;
  late final Animation<double> _radiusAnimation;
  // late final Animation<Color> _colorAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: 200.ms);
    colorAnimationController =
        AnimationController(vsync: this, duration: 200.ms);

    _radiusAnimation = Tween<double>(begin: 22, end: 12).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    // _colorAnimation = Tween<Color>(
    //         begin: SicklerColours.purple95, end: SicklerColours.purple40)
    //     .animate(CurvedAnimation(
    //         parent: colorAnimationController, curve: Curves.easeInOut));

    if (widget.isSelected) {
      colorAnimationController.forward();
    } else {
      colorAnimationController.animateBack(0);
    }

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _radiusAnimation,
      builder: (context, child) {
        return InkWell(
          onTapDown: (TapDownDetails tapDownDetails) {
            animationController.forward();
          },
          onTapUp: (TapUpDetails tapUpDetails) {
            animationController.reverse(from: 1.0);
          },
          onTap: widget.onPressed,
          splashColor: _color.withValues(alpha:.2),
          splashFactory: InkSparkle.splashFactory,
          borderRadius: BorderRadius.circular(_radiusAnimation.value),
          child: Ink(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(_radiusAnimation.value),
              color: widget.isSelected
                  ? theme.colorScheme.primary
                  : theme.cardColor,
              border: widget.isSelected
                  ? null
                  : Border.all(color: theme.colorScheme.primary),
            ),
            child: Center(
              child: Text(widget.label,
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: widget.isSelected
                          ? (isDarkMode
                              ? AppColours.purple10
                              : AppColours.white)
                          : (isDarkMode
                              ? AppColours.white
                              : AppColours.neutral50),
                      fontWeight: widget.isSelected
                          ? FontWeight.w700
                          : FontWeight.normal)),
            ),
          ),
        );
      },
    );
  }
}
