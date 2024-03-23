
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class UserInfoChip extends StatelessWidget {
  final String label;
  final String? iconPath;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  const UserInfoChip(
      {super.key,
        required this.label,
        this.iconPath,
        this.icon,
        this.color,
        this.backgroundColor});

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
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: backgroundColor ?? theme.colorScheme.primaryContainer),
      child: Row(
        children: [
          // Icon(FluentIcons.food_cake_24_regular,
          //     color:  color ?? theme.colorScheme.onPrimaryContainer),

          icon != null
              ? Icon(
            size: 20,
            icon,
            color: color?? theme.colorScheme.onPrimaryContainer,
          )
              : SvgPicture.asset(
            iconPath ?? "",
            height: 20,
            colorFilter: ColorFilter.mode(
                color ?? theme.colorScheme.onPrimaryContainer,
                BlendMode.srcIn),
          ),
          const Gap(4),
          Text(
            label,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: color ?? theme.colorScheme.onPrimaryContainer),
          )
        ],
      ),
    );
  }
}