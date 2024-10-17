import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

///Todo: Refactor this widget into a more generic form so it can be used elsewhere
class AppSelectorItem extends StatefulWidget {
  const AppSelectorItem({
    super.key,
    this.iconPath,
    this.color,
    this.backgroundColor,
    this.label,
    this.unit,
    required this.onPressed,
    this.isSelected = false,
    this.icon,
  });
  final String? label;
  final String? unit;
  final bool isSelected;
  final String? iconPath;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback onPressed;

  @override
  State<AppSelectorItem> createState() => _AppSelectorItemState();
}

class _AppSelectorItemState extends State<AppSelectorItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> _radiusAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: 200.ms);

    _radiusAnimation = Tween<double>(begin: 36, end: 20).animate(
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

    if (widget.iconPath == null && widget.icon == null) {
      throw ErrorHint(
          "Both the 'iconPath' and 'icon' widget must not be null simultaneously, consider providing one of the parameters");
    }
    if (widget.iconPath != null && widget.icon != null) {
      throw ErrorHint(
          "Both the 'iconPath' and 'icon' widget must not provided simultaneously, consider removing one of the parameters");
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
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
              splashColor: widget.color?.withValues(alpha: 0.2) ??
                  theme.colorScheme.primary.withValues(alpha:.2),
              //splashColor: Colors.transparent,
              splashFactory: InkSparkle.splashFactory,
              borderRadius: BorderRadius.circular(_radiusAnimation.value),
              child: Ink(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  color: widget.backgroundColor ?? theme.cardColor,
                  border: widget.isSelected
                      ? Border.all(
                          color: widget.color ?? theme.colorScheme.primary)
                      : null,
                ),
                child: Center(
                  child: widget.icon != null
                      ? Icon(
                          widget.icon,
                          color: widget.color ?? theme.colorScheme.primary,
                        )
                      : SvgPicture.asset(widget.iconPath ?? "",
                          colorFilter: ColorFilter.mode(
                              widget.color ?? theme.colorScheme.primary,
                              BlendMode.srcIn)),
                ),
              ),
            );
          },
        ),
        const Gap(8),
        Text(
          widget.label == "custom"
              ? widget.label ?? "label"
              : "${widget.label} ${widget.unit ?? ""}",
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall!.copyWith(
              color: !isDarkMode
                  ? AppColours.neutral50
                  : AppColours.neutral70),
        )
      ],
    );
  }
}
