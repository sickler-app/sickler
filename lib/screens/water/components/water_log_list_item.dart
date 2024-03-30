
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

class WaterLogListItem extends StatelessWidget {
  const WaterLogListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: isDarkMode
                ? SicklerColours.neutral20
                : SicklerColours.neutral90,
          ),
          // color: isDarkMode
          //     ? SicklerColours.neutral20
          //     : SicklerColours.neutral95,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/svg/droplet.svg",
                    colorFilter: const ColorFilter.mode(
                        SicklerColours.neutral50, BlendMode.srcIn),
                  ),
                ),
                const Gap(
                   4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("150 ml",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w800)),
                    Text("2:13 pm ",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: SicklerColours.neutral50)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      //Todo: Implement Edit
                    },
                    icon: const Icon(
                      FluentIcons.edit_24_regular,
                    )),
                IconButton(
                  onPressed: () {
                    //Todo: Implement Edit
                  },
                  icon: Icon(
                    FluentIcons.delete_24_regular,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
