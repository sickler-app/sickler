import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class EmergencyContactRadio extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String imagePath;
  final String number;
  const EmergencyContactRadio(
      {super.key,
      required this.isSelected,
      required this.name,
      required this.imagePath,
      required this.number});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.colorScheme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.errorContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? null
              : Border.all(
                  width: 1,
                  color: isDarkMode
                      ? AppColours.neutral20
                      : AppColours.neutral90)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 32,
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Gap(8),

              Text(
                number,
                style: theme.textTheme.bodyMedium,
              ),
              //  const Spacer(),

              ///TODO: Add Redio Button
            ],
          )
        ],
      ),
    );
  }
}
