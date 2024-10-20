import 'package:flutter/material.dart';

import '../../../../../core/core.dart';



class AppRadio<T> extends StatelessWidget {
  final String label;
  final T value;
  final T groupValue;
  final void Function(T? value) onChanged;
  final Color? unselectedBackgroundColor;
  final Color? selectedBackgroundColor;
  final Color? fillColor;
  final bool? showBorder;

  const AppRadio(
      {super.key,
      required this.label,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.unselectedBackgroundColor,
      this.selectedBackgroundColor,
      this.showBorder = true,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue ? true : false;
    final ThemeData theme = Theme.of(context);
    return RadioListTile<T>(
      dense: true,
      selected: isSelected,
      tileColor: unselectedBackgroundColor ?? theme.cardColor,
      selectedTileColor:
          selectedBackgroundColor ?? theme.colorScheme.primaryContainer,
      overlayColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColours.purple90;
        } else if (states.contains(WidgetState.disabled)) {
          return AppColours.neutral90;
        }
        return null;
      }),
      title: Text(label, style: theme.textTheme.bodyMedium),
      fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return fillColor ?? theme.colorScheme.primary;
        } else if (states.contains(WidgetState.disabled)) {
          return AppColours.neutral50;
        }
        return null;
      }),
      shape: RoundedRectangleBorder(
          side: showBorder!
              ? isSelected
                  ? BorderSide(width: 1, color: theme.colorScheme.primary)
                  : BorderSide.none
              : BorderSide.none,
          borderRadius: BorderRadius.circular(12)),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
