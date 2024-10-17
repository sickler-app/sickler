import 'package:flutter/material.dart';

import '../../../../../core/core.dart';


class GenotypeSelectorItem extends StatefulWidget {
  const GenotypeSelectorItem({
    super.key,
    required this.onPressed,
    this.label,
    required this.genotype,
    this.isSelected = false,
    this.color,
    this.backgroundColor,
  });

  final String? label;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final bool isSelected;
  final Genotype genotype;

  @override
  State<GenotypeSelectorItem> createState() => _GenotypeSelectorItemState();
}

class _GenotypeSelectorItemState extends State<GenotypeSelectorItem> {
  Color _backgroundColor = AppColours.purple95;

  Color _color = AppColours.purple40;
  String _label = "AA";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    switch (widget.genotype) {
      case Genotype.aa:
        _backgroundColor =
            !isDarkMode ? AppColours.green95 : AppColours.green20;
        _color = !isDarkMode ? AppColours.green60 : AppColours.green80;
        _label = "AA";
        break;
      case Genotype.as:
        _backgroundColor =
            !isDarkMode ? AppColours.blue95 : AppColours.blue20;
        _color = !isDarkMode ? AppColours.blue60 : AppColours.blue80;
        _label = "AS";
        break;
      case Genotype.ss:
        _backgroundColor =
            !isDarkMode ? AppColours.red95 : AppColours.red10;
        _color = !isDarkMode ? AppColours.red50 : AppColours.red80;
        _label = "SS";
        break;
      case Genotype.na:
        _backgroundColor =
            !isDarkMode ? AppColours.neutral95 : AppColours.neutral20;
        _color =
            !isDarkMode ? AppColours.neutral50 : AppColours.neutral50;
        _label = "N/A";
        break;
    }

    return InkWell(
      onTap: widget.onPressed,
      splashColor: widget.color?.withValues(alpha:.2) ?? _color.withValues(alpha:.2),
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(72),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        height: 72,
        width: widget.isSelected ? (size.width - ((72 * 3) + (16 * 5))) : 72,
        child: Ink(
          decoration: BoxDecoration(
              border: widget.isSelected
                  ? Border.all(color: widget.color ?? _color, width: 1)
                  : null,
              color: widget.backgroundColor ?? _backgroundColor,
              borderRadius: BorderRadius.circular(72)),
          child: Center(
            child: Text(
              widget.label ?? _label,
              style: widget.isSelected
                  ? theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: widget.color ?? _color)
                  : theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
