import 'package:flutter/material.dart';

import '../../../core/core.dart';

class GenotypeSelector extends StatefulWidget {
  const GenotypeSelector({
    super.key,
    this.colorScheme = SelectorColors.purple,
    required this.onPressed,
    required this.label,
    this.isSelected = false,
  });
  final SelectorColors colorScheme;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  State<GenotypeSelector> createState() => _GenotypeSelectorState();
}

class _GenotypeSelectorState extends State<GenotypeSelector> {
  Color backgroundColor = SicklerColours.purple95;

  Color color = SicklerColours.purple40;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    switch (widget.colorScheme) {
      case SelectorColors.purple:
        backgroundColor = theme.brightness == Brightness.light
            ? SicklerColours.purple95
            : SicklerColours.purple20;
        color = theme.brightness == Brightness.light
            ? theme.colorScheme.primary
            : SicklerColours.purple80;
        break;
      case SelectorColors.blue:
        backgroundColor = theme.brightness == Brightness.light
            ? SicklerColours.blue95
            : SicklerColours.blue20;
        color = theme.brightness == Brightness.light
            ? SicklerColours.blue60
            : SicklerColours.blue80;
        break;

      case SelectorColors.green:
        backgroundColor = theme.brightness == Brightness.light
            ? SicklerColours.green95
            : SicklerColours.green20;
        color = theme.brightness == Brightness.light
            ? SicklerColours.green60
            : SicklerColours.green80;
        break;

      case SelectorColors.red:
        backgroundColor = theme.brightness == Brightness.light
            ? SicklerColours.red95
            : SicklerColours.red10;
        color = theme.brightness == Brightness.light
            ? SicklerColours.red50
            : SicklerColours.red80;
        break;

      case SelectorColors.orange:
        backgroundColor = theme.brightness == Brightness.light
            ? SicklerColours.orange95
            : SicklerColours.orange20;
        color = theme.brightness == Brightness.light
            ? SicklerColours.orange60
            : SicklerColours.orange80;
    }

    return InkWell(
      onTap: widget.onPressed,
      splashColor: color.withOpacity(.2),
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(72),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        height: 72,
        width: widget.isSelected ? (size.width - ((72 * 2) + (16 * 4))) : 72,
        child: Ink(
          decoration: BoxDecoration(
              border:
                  widget.isSelected ? Border.all(color: color, width: 1) : null,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(72)),
          child: Center(
            child: Text(
              widget.label,
              style: widget.isSelected
                  ? theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w800, color: color)
                  : theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
