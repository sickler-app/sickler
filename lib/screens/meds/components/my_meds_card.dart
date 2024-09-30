import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/meds/meds_details_screen.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class MyMedsCard extends StatelessWidget {
  const MyMedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? theme.cardColor : SicklerColours.neutral95),
      child: Row(
        ///The Compressed Mode
        children: [
          RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hydroxyl Urea",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const Gap(8),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/tablet.svg",
                      colorFilter: ColorFilter.mode(
                          theme.colorScheme.primary, BlendMode.srcIn),
                    ),
                    const Gap(8),
                    Text(
                      "Tablet",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: SicklerColours.neutral50),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: theme.colorScheme.errorContainer,
            child: IconButton(
              color: theme.colorScheme.error,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/delete.svg",
                colorFilter:
                    ColorFilter.mode(theme.colorScheme.error, BlendMode.srcIn),
              ),
            ),
          ),
          const Gap(8),
          SicklerButton(
              isChipButton: true,
              iconPath: "assets/svg/check.svg",
              buttonType: SicklerButtonType.primary,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const MedsDetailsScreen(),
                );
              },
              label: "View")
        ],
      ),
    );
  }
}
