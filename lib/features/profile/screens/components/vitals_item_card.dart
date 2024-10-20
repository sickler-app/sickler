import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VitalsItemCard extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  final VoidCallback onPressed;
  final Widget icon;
  final Color? color;
  final Color? backgroundColor;

  const VitalsItemCard(
      {super.key,
      required this.label,
      required this.value,
      this.unit,
      this.color,
      this.backgroundColor,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      splashFactory: InkSparkle.splashFactory,
      splashColor: color?.withValues(alpha:.2) ?? theme.colorScheme.primary,
      child: Ink(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: backgroundColor ?? theme.colorScheme.primaryContainer),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: color ?? theme.colorScheme.primary),
                ),
                const Spacer(),
                icon,
              ],
            ),
            const Gap(32),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text: unit ?? "",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: color ?? theme.colorScheme.tertiary))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
