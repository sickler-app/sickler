import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class MyMedsCard extends StatelessWidget {
  const MyMedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: SicklerColours.neutral95),
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
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/tablet.svg",
                      colorFilter:
                          ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 8),
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
            backgroundColor: SicklerColours.red90,
            child: IconButton(
              color: SicklerColours.red50,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/delete.svg",
                colorFilter: const ColorFilter.mode(
                    SicklerColours.red50, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SicklerChipButton(
              iconPath: "assets/svg/check.svg",
              buttonType: SicklerButtonType.primary,
              onPressed: () {},
              label: "View")
        ],
      ),
    );
  }
}
