import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ContactCard extends StatelessWidget {
  final bool showAddContactButton;
  const ContactCard({super.key, this.showAddContactButton = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      width: 144,
      padding: const EdgeInsets.only(top: 8, right: 8, left: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDarkMode ? theme.cardColor : SicklerColours.neutral95,
      ),
      child: showAddContactButton
          ? Center(
              child: IconButton.filled(
                iconSize: 80,
                style: IconButton.styleFrom(
                  elevation: 0,
                  foregroundColor: theme.cardColor,
                ),
                splashRadius: 40,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/svg/plus.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary, BlendMode.srcIn),
                ),
              ),
            )
          : Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Brother",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.primary),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/svg/edit.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/svg/delete.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.error, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CircleAvatar(
                  radius: 40,
                  child: Image.asset("assets/images/memoji.png"),
                ),
                const SizedBox(height: 24),
                Text(
                  "Nuikweh",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Lewis", style: theme.textTheme.bodyMedium),
                const SizedBox(height: 12),
                Text(
                  "6 77 77 77 77",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary),
                ),
              ],
            ),
    );
  }
}
