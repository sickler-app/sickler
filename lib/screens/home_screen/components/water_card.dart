import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../global_components/global_components.dart';
import '../../../core/core.dart';


class WaterCard extends StatelessWidget {
  const WaterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context );
    return      Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: SicklerColours.blue95,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Water",
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svg/droplet.svg",
                colorFilter: const ColorFilter.mode(
                    SicklerColours.blue60, BlendMode.srcIn),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CircleAvatar(
                radius: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "160 ml ",
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w800)),
                          TextSpan(
                            text: "remaining",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: SicklerColours.neutral50),
                          ),
                        ])),
                    const SizedBox(height: 4),
                    Text(
                      "Only 2 hours left to finish your daily goal",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SicklerChipButton(
                        onPressed: () {},
                        label: "Drink",
                        backgroundColor: SicklerColours.blue60,
                        buttonType: SicklerButtonType.primary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
