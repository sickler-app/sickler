import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class SicklerCalendarWeekSelectorItem extends StatefulWidget {
  const SicklerCalendarWeekSelectorItem({
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
  State<SicklerCalendarWeekSelectorItem> createState() =>
      _SicklerCalendarWeekSelectorItemState();
}

class _SicklerCalendarWeekSelectorItemState
    extends State<SicklerCalendarWeekSelectorItem>
    with TickerProviderStateMixin {
  final Color _color = AppColours.purple40;
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
    final Size size = MediaQuery.sizeOf(context);
    //Assume a separator spacing of 8,
    double itemSpacing = 8;
    double itemWidth =
        (size.width - 32 - (itemSpacing * 6)) / 7; // Item width is 44.71
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
            width: itemWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(_radiusAnimation.value),
              color: widget.isSelected
                  ? theme.colorScheme.primary
                  : theme.cardColor,
              border: widget.isEmphasized
                  ? Border.all(color: theme.colorScheme.primary)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  const Gap(4),
                  Text(
                    widget.label,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: widget.isSelected
                          ? theme.scaffoldBackgroundColor
                          : AppColours.neutral50,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.isSelected
                              ? theme.scaffoldBackgroundColor
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          widget.date,
                          //  "27",
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: widget.isSelected || widget.isEmphasized
                                  ? theme.colorScheme.primary
                                  : (isDarkMode
                                      ? AppColours.white
                                      : AppColours.neutral50),
                              fontWeight: widget.isSelected
                                  ? FontWeight.w700
                                  : FontWeight.normal),
                        ),
                      ),
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
