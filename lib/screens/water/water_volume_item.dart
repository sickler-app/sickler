import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class WaterVolumeItem extends StatefulWidget {
  const WaterVolumeItem({
    super.key,
    this.iconPath,
    this.color,
    this.backgroundColor,
    this.label,
    required this.volumeType,
    // required this.onSelected,
    required this.onPressed,
    this.isSelected = false,
  });
  final String? label;
  final bool isSelected;
  final VolumeType volumeType;
  // final Function(MedicationType medicationType)? onSelected;
  final String? iconPath;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback onPressed;

  @override
  State<WaterVolumeItem> createState() => _WaterVolumeItemState();
}

class _WaterVolumeItemState extends State<WaterVolumeItem>
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

    switch (widget.volumeType) {
      ///Color the card based on medication type, but have a way to override colors
      case VolumeType.volume1:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.purple90
                : SicklerColours.purple95)
            : SicklerColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : SicklerColours.purple90;
        _iconPath = "assets/svg/medication.svg";
        _label = "200ml";
        break;

      case VolumeType.volume2:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.green90
                : SicklerColours.green95)
            : SicklerColours.green20;
        _color = !isDarkMode ? SicklerColours.green60 : SicklerColours.green90;
        _iconPath = "assets/svg/medication.svg";
        _label = "300ml";

        break;
      case VolumeType.volume3:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.blue90
                : SicklerColours.blue95)
            : SicklerColours.blue20;
        _color = !isDarkMode ? SicklerColours.blue60 : SicklerColours.blue90;
        _iconPath = "assets/svg/medication.svg";
        _label = "400ml";

      case VolumeType.volume4:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected ? SicklerColours.red90 : SicklerColours.red95)
            : SicklerColours.red10;
        _color = !isDarkMode ? SicklerColours.red50 : SicklerColours.red90;
        _iconPath = "assets/svg/medication.svg";
        _label = "500ml";
        break;
      case VolumeType.volume5:
        _backgroundColor = !isDarkMode
            ? (widget.isSelected
                ? SicklerColours.purple90
                : SicklerColours.purple95)
            : SicklerColours.purple20;
        _color =
            !isDarkMode ? theme.colorScheme.primary : SicklerColours.purple90;
        _iconPath = "assets/svg/plus.svg";
        _label = "600ml";
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
        const SizedBox(height: 8),
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
