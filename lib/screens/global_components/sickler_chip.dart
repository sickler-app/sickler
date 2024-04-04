import 'package:flutter/material.dart';
import 'package:sickler/core/constants.dart';

import '../../core/core.dart';

class SicklerChip extends StatefulWidget {
  const SicklerChip({
    super.key,
    this.onSelected,
    required this.label,
    this.chipType = SicklerChipType.filter,
    this.unselectedColor = SicklerColours.black,
    this.unselectedBackgroundColor = SicklerColours.neutral95,
    this.selectedColor =  SicklerColours.purple90,
    this.selectedBackgroundColor = SicklerColours.purpleSeed,
  });

  final Function(bool)? onSelected;
  final SicklerChipType chipType;
  final String label;
  final Color? unselectedColor;
  final Color? selectedColor;
  final Color? unselectedBackgroundColor;
  final Color? selectedBackgroundColor;

  @override
  State<SicklerChip> createState() => _SicklerChipState();
}

class _SicklerChipState extends State<SicklerChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chipType == SicklerChipType.filter &&
        widget.onSelected == null) {
      throw ErrorHint(
          "onSelected must not be null on a Filter Chip type, please consider adding the onSelected parameter");
    }
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    if (widget.chipType == SicklerChipType.filter) {
      return FilterChip(
        backgroundColor: isSelected? widget.selectedBackgroundColor: widget.selectedBackgroundColor,
          side: isSelected
              ? BorderSide(
                  width: 1, color: widget.unselectedColor ?? theme.colorScheme.primary)
              : BorderSide.none,
          showCheckmark: true,
          checkmarkColor: isSelected
              ? widget.selectedColor
              : widget.unselectedColor,
          selected: isSelected,
          label: Text(
            widget.label,
            style: theme.textTheme.bodyMedium!.copyWith(
                color: isSelected ? widget.selectedColor: widget.unselectedColor),
          ),
          onSelected: (value) {
            setState(() {
              isSelected = value;
            });

            widget.onSelected!.call(value);
          });
    } else {
      return Chip(
        //side: BorderSide(width: 1, color: theme.colorScheme.primary),
        backgroundColor: !isDarkMode
            ? widget.unselectedBackgroundColor ?? SicklerColours.purple90
            : widget.unselectedBackgroundColor ?? theme.colorScheme.primary,
        label: Text(
          widget.label,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: widget.unselectedColor ?? SicklerColours.purple10),
        ),
      );
    }
  }
}
