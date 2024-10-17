import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';
import 'app_icon.dart';
import 'generic_selector.dart';

///--------------////
class SelectableChip extends StatefulWidget implements SelectableWidget {
  const SelectableChip({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isItemSelected,
    this.onDeleted,
    this.selectedColor,
    this.selectedBackgroundColor,
    this.icon,
    this.iconPath,
  });

  final VoidCallback onPressed;
  final VoidCallback? onDeleted;
  final IconData? icon;
  final String? iconPath;
  final String label;
  final Color? selectedColor;
  final Color? selectedBackgroundColor;
  final bool isItemSelected;

  @override
  bool get isSelected => isItemSelected;

  @override
  VoidCallback get onSelected => onPressed;

  @override
  State<SelectableChip> createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ChoiceChip(
      padding: EdgeInsets.only(
        top: kPadding12,
        bottom: kPadding12,
        left: (widget.icon != null || widget.iconPath != null)
            ? kPadding8
            : kPadding12,
        right: kPadding12,
      ),
      backgroundColor: widget.isItemSelected
          ? theme.colorScheme.primary
          : theme.colorScheme.surfaceContainer,
      selectedColor: theme.colorScheme.primary,
      showCheckmark:
          (widget.icon != null || widget.iconPath != null) ? false : true,
      checkmarkColor: widget.isItemSelected
          ? theme.scaffoldBackgroundColor
          : theme.iconTheme.color,
      selected: widget.isSelected,
      onSelected: (val) {
        widget.onPressed.call();
      },
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.iconPath != null || widget.icon != null,
            child: Row(
              children: [
                AppIcon(
                  size: 16,
                  iconPath: widget.iconPath,
                  icon: widget.icon,
                  color: widget.isItemSelected
                      ? theme.scaffoldBackgroundColor
                      : null,
                ),
                const Gap(kPadding8),
              ],
            ),
          ),
          Text(
            widget.label,
            style: theme.textTheme.bodyMedium!.copyWith(
                color: widget.isItemSelected
                    ? theme.scaffoldBackgroundColor
                    : theme.textTheme.bodyMedium?.color),
          ),
        ],
      ),
    );
  }
}
