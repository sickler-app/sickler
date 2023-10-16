import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class MedsTypeItem extends StatefulWidget {
  const MedsTypeItem(
      {super.key,
      this.colorScheme = SelectorColors.purple,
      required this.onPressed,
      required this.label,
      required this.iconPath});
  final SelectorColors colorScheme;
  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  ///Todo: create an onSelected Callbac ,k

  @override
  State<MedsTypeItem> createState() => _MedsTypeItemState();
}

class _MedsTypeItemState extends State<MedsTypeItem> {
  Color backgroundColor = SicklerColours.purple95;
  Color color = SicklerColours.purple40;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: widget.onPressed,
          splashColor: color.withOpacity(.2),
          splashFactory: InkSparkle.splashFactory,
          borderRadius: BorderRadius.circular(72),
          child: Ink(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.iconPath,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall!.copyWith(
              color: theme.brightness == Brightness.light
                  ? SicklerColours.neutral50
                  : SicklerColours.neutral70),
        )
      ],
    );
  }
}
