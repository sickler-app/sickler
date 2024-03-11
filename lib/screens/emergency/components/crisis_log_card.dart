import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class CrisisLogCard extends StatefulWidget {
  const CrisisLogCard({super.key});

  @override
  State<CrisisLogCard> createState() => _CrisisEventLogCardState();
}

class _CrisisEventLogCardState extends State<CrisisLogCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return AnimatedContainer(
      duration: 300.ms,
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDarkMode
            ? theme.cardColor
            : (isExpanded ? SicklerColours.purple95 : theme.cardColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Crises Event",
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: SvgPicture.asset(
                  "assets/svg/chevron-down.svg",
                  colorFilter:
                      ColorFilter.mode(theme.iconTheme.color!, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          Gap(8),
          Row(
            children: [
              Text(
                "Extreme pain - 7",
                style: theme.textTheme.bodyMedium,
              ),
              Spacer(),
              Text(
                "12:07 pm",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          Gap(16),
          Visibility(
            child: Column(
              children: [
                Text(
                    "Description, if any, for example, pain felt, on lowe back and chest"),
                Gap(16),
                Row(
                  children: [
                    IconButton.filled(
                      style: IconButton.styleFrom(
                          elevation: 0,
                          backgroundColor: isDarkMode
                              ? SicklerColours.red20
                              : SicklerColours.red95),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/svg/delete.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.error, BlendMode.srcIn),
                      ),
                    ),
                    Gap(8),
                    SicklerChipButton(
                      onPressed: () {},
                      label: "Edit",
                      showIcon: true,
                      iconPath: "assets/svg/edit.svg",
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
