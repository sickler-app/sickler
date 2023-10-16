import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class SicklerButton extends StatelessWidget {
  const SicklerButton({
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
  Widget build(BuildContext context) {
    if (showIcon == true && iconPath == null) {
      throw ErrorHint(
          "You've not provided an icon path to show, consider providing a path");
    }

    final theme = Theme.of(context);
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: color ?? Colors.white,
    );
    Color labelColor = SicklerColours.purple40;
    switch (buttonType) {
      case SicklerButtonType.primary:
        style = ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.onPrimary;
        break;

      case SicklerButtonType.secondary:
        style = ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? theme.colorScheme.primaryContainer,
          foregroundColor: color ?? theme.colorScheme.onPrimaryContainer,
        );
        labelColor = color ?? theme.colorScheme.onPrimaryContainer;
        break;

      case SicklerButtonType.outline:
        style = ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: color ?? theme.colorScheme.primary,
            side: BorderSide(
              width: 1,
              color: backgroundColor ?? theme.colorScheme.primary,
            ));

        labelColor = color ?? theme.colorScheme.primary;
        break;
      case SicklerButtonType.text:
        style = ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: color ?? theme.colorScheme.primary);
        labelColor = color ?? theme.colorScheme.primary;
        break;

      default:
        style = ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: showIcon,
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath ?? "",
                    colorFilter: overrideIconColor!
                        ? ColorFilter.mode(
                            labelColor,
                            BlendMode.srcIn, // the blend mode
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: labelColor)),
          ],
        ),
      ),
    );
  }
}
