import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SettingsListItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final String? iconPath;
  final Widget? trailingWidget;
  final Color? color;
  final bool? showBorder;
  const SettingsListItem({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconPath,
    this.trailingWidget,
    this.color,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (icon != null && iconPath != null) {
      throw ErrorHint(
          "Cannot set both an icon and an iconPath property simultaneously, consider removing one");
    }
    if (icon == null && iconPath == null) {
      throw ErrorHint("Must provide and `icon` or an `iconPath` property");
    }
    return InkWell(
      onTap: () {},
      splashFactory: InkSparkle.splashFactory,
      splashColor:
      color?.withValues(alpha:.2) ?? theme.colorScheme.primary.withValues(alpha:.2),
      child: Ink(
        decoration: BoxDecoration(
          border: showBorder!
              ? Border(bottom: BorderSide(width: 1, color: theme.cardColor))
              : null,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            icon != null
                ? Icon(icon, color: color)
                : SvgPicture.asset(iconPath ?? "",
                colorFilter: ColorFilter.mode(
                    color ?? theme.iconTheme.color!, BlendMode.srcIn)),
            const Gap(8),
            Text(
              label,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: color ?? theme.textTheme.bodyMedium!.color),
            ),
            const Spacer(),
            trailingWidget != null
                ? trailingWidget!
                : Icon(FluentIcons.chevron_right_24_regular, color: color)
          ],
        ),
      ),
    );
  }
}
