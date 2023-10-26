import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class SicklerChipButton extends StatefulWidget {
  const SicklerChipButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
    this.iconPath,
    this.showIcon = false,
    this.overrideIconColor = true,
    this.buttonType = SicklerButtonType.primary,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final SicklerButtonType buttonType;
  final bool showIcon;
  final String? iconPath;
  final Color? color;
  final Color? backgroundColor;
  final bool? overrideIconColor;

  @override
  State<SicklerChipButton> createState() => _SicklerChipButtonState();
}

class _SicklerChipButtonState extends State<SicklerChipButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.showIcon == true && widget.iconPath == null) {
      throw ErrorHint(
          "You've not provided an icon path to show, consider providing a path");
    }

    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    ButtonStyle style = ElevatedButton.styleFrom(
      fixedSize: const Size.fromHeight(36),
      backgroundColor: widget.backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: widget.color ?? Colors.white,
    );
    Color labelColor = SicklerColours.purple40;
    switch (widget.buttonType) {
      case SicklerButtonType.primary:
        style = ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(36),
          alignment: Alignment.center,
          backgroundColor: widget.backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: widget.color ?? Colors.white,
        );
        labelColor = widget.color ?? theme.colorScheme.onPrimary;
        break;

      case SicklerButtonType.secondary:
        style = ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(36),
          backgroundColor: !isDarkMode
              ? widget.backgroundColor ?? theme.colorScheme.primaryContainer
              : SicklerColours.neutral20,
          foregroundColor: widget.color ?? theme.colorScheme.onPrimaryContainer,
        );
        labelColor = widget.color ?? theme.colorScheme.onPrimaryContainer;
        break;

      case SicklerButtonType.outline:
        style = ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(36),
            backgroundColor: Colors.transparent,
            foregroundColor: widget.color ?? theme.colorScheme.primary,
            side: BorderSide(
              width: 1,
              color: widget.color ?? theme.colorScheme.primary,
            ));

        labelColor = widget.color ?? theme.colorScheme.primary;
        break;
      case SicklerButtonType.text:
        style = ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(36),
            backgroundColor: Colors.transparent,
            foregroundColor: widget.color ?? theme.colorScheme.primary);
        labelColor = widget.color ?? theme.colorScheme.primary;
        break;

      default:
        style = ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(36),
          backgroundColor: widget.backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: widget.color ?? Colors.white,
        );
        labelColor = widget.color ?? theme.colorScheme.primary;
        break;
    }

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.showIcon,
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.iconPath ?? "",
                  colorFilter: widget.overrideIconColor!
                      ? ColorFilter.mode(
                          labelColor,
                          BlendMode.srcIn, // the blend mode
                        )
                      : null,
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
          Text(widget.label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: labelColor)),
        ],
      ),
    );
  }
}
