import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SicklerRadio<T> extends StatelessWidget {
  final String label;
  final T value;
  final T groupValue;
  final void Function(T? value) onChanged;

  const SicklerRadio(
      {super.key,
      required this.label,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue ? true : false;
    final ThemeData theme = Theme.of(context);
    return RadioListTile<T>(
      selected: isSelected,
      tileColor: theme.cardColor,
      selectedTileColor: theme.colorScheme.primaryContainer,
      overlayColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple90;
        } else if (states.contains(MaterialState.disabled)) {
          return SicklerColours.neutral90;
        }
        return null;
      }),
      title: Text(label, style: theme.textTheme.bodyMedium),
      fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return theme.primaryColor;
        } else if (states.contains(MaterialState.disabled)) {
          return SicklerColours.neutral50;
        }
        return null;
      }),
      shape: RoundedRectangleBorder(
          side: isSelected
              ? BorderSide(width: 1, color: theme.colorScheme.primary)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(12)),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
