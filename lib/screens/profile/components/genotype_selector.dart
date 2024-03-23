import 'package:flutter/material.dart';

import '../../../core/core.dart';

class GenotypeSelector extends StatefulWidget {
  const GenotypeSelector({
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
  State<GenotypeSelector> createState() => _GenotypeSelectorState();
}

class _GenotypeSelectorState extends State<GenotypeSelector> {
  Color _backgroundColor = SicklerColours.purple95;

  Color _color = SicklerColours.purple40;
  String _label = "AA";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    switch (widget.genotype) {
      case Genotype.aa:
        _backgroundColor =
            !isDarkMode ? SicklerColours.green95 : SicklerColours.green20;
        _color = !isDarkMode ? SicklerColours.green60 : SicklerColours.green80;
        _label = "AA";
        break;
      case Genotype.as:
        _backgroundColor =
            !isDarkMode ? SicklerColours.blue95 : SicklerColours.blue20;
        _color = !isDarkMode ? SicklerColours.blue60 : SicklerColours.blue80;
        _label = "AS";
        break;
      case Genotype.ss:
        _backgroundColor =
            !isDarkMode ? SicklerColours.red95 : SicklerColours.red10;
        _color = !isDarkMode ? SicklerColours.red50 : SicklerColours.red80;
        _label = "SS";
        break;
    }

    return InkWell(
      onTap: widget.onPressed,
      splashColor: widget.color?.withOpacity(.2) ?? _color.withOpacity(.2),
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(72),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        height: 72,
        width: widget.isSelected ? (size.width - ((72 * 2) + (16 * 4))) : 72,
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
                      fontWeight: FontWeight.w800,
                      color: widget.color ?? _color)
                  : theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
