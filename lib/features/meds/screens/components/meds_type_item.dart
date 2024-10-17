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
  Color _backgroundColor = SicklerColours.purple95;
  Color _color = SicklerColours.purple40;
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
                ? SicklerColours.purple90
                : SicklerColours.purple95)
            : SicklerColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : SicklerColours.purple90;
        _iconPath = "assets/svg/tablet.svg";
        _label = "Tablets";
        break;

      case MedicationType.capsules:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.green90
                : SicklerColours.green95)
            : SicklerColours.green20;
        _color = !isDarkMode ? SicklerColours.green60 : SicklerColours.green90;
        _iconPath = "assets/svg/medication.svg";
        _label = "Capsules";

        break;
      case MedicationType.droplets:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.blue90
                : SicklerColours.blue95)
            : SicklerColours.blue20;
        _color = !isDarkMode ? SicklerColours.blue60 : SicklerColours.blue90;
        _iconPath = "assets/svg/droplet-alt.svg";
        _label = "Droplets";

      case MedicationType.injections:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected ? SicklerColours.red90 : SicklerColours.red95)
            : SicklerColours.red10;
        _color = !isDarkMode ? SicklerColours.red50 : SicklerColours.red90;
        _iconPath = "assets/svg/syringe.svg";
        _label = "Injections (IV/IM)";
        break;
      case MedicationType.liquids:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.purple90
                : SicklerColours.purple95)
            : SicklerColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : SicklerColours.purple90;
        _iconPath = "assets/svg/bottle.svg";
        _label = "Liquids & Syrups";
        break;
      case MedicationType.inhaler:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.green90
                : SicklerColours.green95)
            : SicklerColours.green20;
        _color = !isDarkMode ? SicklerColours.green60 : SicklerColours.green90;
        _iconPath = "assets/svg/medication.svg";
        _label = "Inhaler";
        break;

      case MedicationType.creamsOrGels:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.orange90
                : SicklerColours.orange95)
            : SicklerColours.orange20;
        _color =
            !isDarkMode ? SicklerColours.orange60 : SicklerColours.orange90;
        _iconPath = "assets/svg/stream.svg";
        _label = "Creams & Gels";
        break;

      case MedicationType.custom:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.purple90
                : SicklerColours.purple95)
            : SicklerColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : SicklerColours.purple90;
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
              splashColor: _color.withOpacity(.2),
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
                  ? SicklerColours.neutral50
                  : SicklerColours.neutral70),
        )
      ],
    );
  }
}
