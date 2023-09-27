import 'package:flutter/material.dart';

import '../../core/core.dart';

class SicklerChip extends StatefulWidget {
  const SicklerChip({
    super.key,
    this.onSelected,
    required this.label,
    this.chipType = SicklerChipType.filter,
  });

  final Function(bool)? onSelected;
  final SicklerChipType chipType;
  final String label;

  @override
  State<SicklerChip> createState() => _SicklerChipState();
}

class _SicklerChipState extends State<SicklerChip> {
  bool labelSelected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chipType == SicklerChipType.filter &&
        widget.onSelected == null) {
      throw ErrorHint(
          "onSelected must not be null on a Filter Chip type, please consider adding the onSelected parameter");
    }
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    Color selectedLabelColor = SicklerColours.purple20;
    Color unselectedLabelColor = !isDarkMode
        ? SicklerColours.neutral30
        : SicklerColours.white;
    return widget.chipType == SicklerChipType.filter
        ? FilterChip(
            side: labelSelected
                ? BorderSide(width: 1, color: theme.colorScheme.primary)
                : BorderSide.none,
            showCheckmark: true,
            checkmarkColor:
                labelSelected ? selectedLabelColor : unselectedLabelColor,
            selected: labelSelected,
            label: Text(
              widget.label,
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: labelSelected
                      ? selectedLabelColor
                      : unselectedLabelColor),
            ),
            onSelected: (value) {
              setState(() {
                labelSelected = value;
              });

              widget.onSelected!.call(value);
            })
        : Chip(
            //side: BorderSide(width: 1, color: theme.colorScheme.primary),
            backgroundColor: !isDarkMode
                ? SicklerColours.purple90
                : theme.colorScheme.primary,
            label: Text(
              widget.label,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: SicklerColours.purple10),
            ),
          );
  }
}
