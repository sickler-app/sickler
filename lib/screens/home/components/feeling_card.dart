import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class FeelingCard extends StatefulWidget {
  const FeelingCard({super.key});

  @override
  State<FeelingCard> createState() => _FeelingCardState();
}

class _FeelingCardState extends State<FeelingCard> {
  double sliderValue = 3;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "How are you\nfeeling today?",
                style: theme.textTheme.headlineSmall,
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${sliderValue.toInt()}",
                      style: theme.textTheme.displaySmall!.copyWith(
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w800),
                    ),
                    TextSpan(text: "/10", style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
          const Gap( 24),
          Row(children: [
            Text(
              "No Pain",
              style: theme.textTheme.bodySmall,
            ),
            const Spacer(),
            Text(
              "Extreme Pain",
              style: theme.textTheme.bodySmall,
            )
          ]),
          const Gap( 12),
          Slider(
              activeColor: theme.colorScheme.primary,
              inactiveColor: SicklerColours.neutral90,
              min: 0,
              max: 10,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              }),
          const Gap( 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               SicklerButton( isChipButton:true,
                  onPressed: () {},
                  label: "Cancel",
                  buttonType: SicklerButtonType.outline),
              const Gap( 16),
               SicklerButton( isChipButton:true,
                  onPressed: () {},
                  label: "Save",
                  iconPath: "assets/svg/check.svg",
                  icon: FluentIcons.check_20_regular,

                  buttonType: SicklerButtonType.primary),
            ],
          ),
        ],
      ),
    );
  }
}
