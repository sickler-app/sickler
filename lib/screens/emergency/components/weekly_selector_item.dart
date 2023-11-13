import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

class WeekDayItem extends StatefulWidget {
  const WeekDayItem({
    super.key,
    this.color,
    this.backgroundColor,
    required this.label,
    required this.date,
    required this.onPressed,
    this.isSelected = false,
    this.isEmphasized = false,
  });
  final String label;
  final String date;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? color;

  ///This represents a medium emphasis item, but not high enough to be 'selected'
  ///Such an emphasis can be used to denote the days where a crisis occurs for example.
  ///It can also be used to denote the current day "today" if used as a weekly calendar selector
  final bool isEmphasized;

  @override
  State<WeekDayItem> createState() => _WeekDayItemState();
}

class _WeekDayItemState extends State<WeekDayItem>
    with TickerProviderStateMixin {
  final Color _color = SicklerColours.purple40;
  late final AnimationController animationController;
  late final Animation<double> _radiusAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: 200.ms);
    _radiusAnimation = Tween<double>(begin: 22, end: 12).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

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
          splashColor: _color.withOpacity(.2),
          splashFactory: InkSparkle.splashFactory,
          borderRadius: BorderRadius.circular(_radiusAnimation.value),
          child: Ink(
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(_radiusAnimation.value),
              color: widget.isSelected
                  ? theme.colorScheme.primary
                  : theme.cardColor,
              border: widget.isEmphasized
                  ? null
                  : Border.all(color: theme.colorScheme.primary),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    widget.label,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: widget.isSelected
                            ? theme.colorScheme.primary
                            : SicklerColours.neutral50,
                        fontWeight: widget.isSelected
                            ? FontWeight.w800
                            : FontWeight.normal),
                  ),
                  Gap(8),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isSelected
                            ? theme.scaffoldBackgroundColor
                            : Colors.transparent),
                    child: Text(
                      widget.date,
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: widget.isSelected || widget.isEmphasized
                              ? theme.colorScheme.primary
                              : (isDarkMode
                                  ? SicklerColours.white
                                  : SicklerColours.neutral50),
                          fontWeight: widget.isSelected
                              ? FontWeight.w800
                              : FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
