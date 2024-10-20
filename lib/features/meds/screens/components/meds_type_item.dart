import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';


///Todo: Refactor this widget into a more generic form so it can be used elsewhere
class MedsTypeItem extends StatefulWidget {
  const MedsTypeItem({
    super.key,
    this.iconPath,
    this.color,
    this.backgroundColor,
    this.label,
    required this.medicationType,
    // required this.onSelected,
    required this.onPressed,
    this.isSelected = false,
  });
  final String? label;
  final bool isSelected;
  final MedicationType medicationType;
  // final Function(MedicationType medicationType)? onSelected;
  final String? iconPath;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback onPressed;

  @override
  State<MedsTypeItem> createState() => _MedsTypeItemState();
}

class _MedsTypeItemState extends State<MedsTypeItem>
    with SingleTickerProviderStateMixin {
  Color _backgroundColor = AppColours.purple95;
  Color _color = AppColours.purple40;
  String _iconPath = "assets/svg/tablet.svg";
  String _label = "Tablets";

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

    switch (widget.medicationType) {
      ///Color the card based on medication type, but have a way to override colors
      case MedicationType.tabletsPills:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.purple90
                : AppColours.purple95)
            : AppColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : AppColours.purple90;
        _iconPath = "assets/svg/tablet.svg";
        _label = "Tablets";
        break;

      case MedicationType.capsules:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.green90
                : AppColours.green95)
            : AppColours.green20;
        _color = !isDarkMode ? AppColours.green60 : AppColours.green90;
        _iconPath = "assets/svg/medication.svg";
        _label = "Capsules";

        break;
      case MedicationType.droplets:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.blue90
                : AppColours.blue95)
            : AppColours.blue20;
        _color = !isDarkMode ? AppColours.blue60 : AppColours.blue90;
        _iconPath = "assets/svg/droplet-alt.svg";
        _label = "Droplets";

      case MedicationType.injections:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected ? AppColours.red90 : AppColours.red95)
            : AppColours.red10;
        _color = !isDarkMode ? AppColours.red50 : AppColours.red90;
        _iconPath = "assets/svg/syringe.svg";
        _label = "Injections (IV/IM)";
        break;
      case MedicationType.liquids:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.purple90
                : AppColours.purple95)
            : AppColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : AppColours.purple90;
        _iconPath = "assets/svg/bottle.svg";
        _label = "Liquids & Syrups";
        break;
      case MedicationType.inhaler:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.green90
                : AppColours.green95)
            : AppColours.green20;
        _color = !isDarkMode ? AppColours.green60 : AppColours.green90;
        _iconPath = "assets/svg/medication.svg";
        _label = "Inhaler";
        break;

      case MedicationType.creamsOrGels:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.orange90
                : AppColours.orange95)
            : AppColours.orange20;
        _color =
            !isDarkMode ? AppColours.orange60 : AppColours.orange90;
        _iconPath = "assets/svg/stream.svg";
        _label = "Creams & Gels";
        break;

      case MedicationType.custom:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? AppColours.purple90
                : AppColours.purple95)
            : AppColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : AppColours.purple90;
        _iconPath = "assets/svg/plus.svg";
        _label = "Custom";
        break;
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
              splashColor: _color.withValues(alpha:.2),
              //splashColor: Colors.transparent,
              splashFactory: InkSparkle.splashFactory,
              borderRadius: BorderRadius.circular(_radiusAnimation.value),
              child: Ink(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  color: widget.backgroundColor ?? _backgroundColor,
                  border: widget.isSelected ? Border.all(color: _color) : null,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    widget.iconPath ?? _iconPath,
                    colorFilter: ColorFilter.mode(
                        widget.color ?? _color, BlendMode.srcIn),
                  ),
                ),
              ),
            );
          },
        ),
        const Gap(8),
        Text(
          widget.label ?? _label,
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
