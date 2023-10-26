import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class MedsDetailsScreen extends StatelessWidget {
  const MedsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Hydroxyl Urea",
                  style: theme.textTheme.headlineSmall,
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/svg/syringe.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Text(
                  "Tablets",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Ut ipsum et viverra adipiscing velit viverra sit venenatis facilisis. Vel laoreet pellentesque amet amet orci viverra eget.",
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
            ),
            const SizedBox(height: 24),
            Wrap(
              runSpacing: 12,
              children: [
                const SicklerChip(
                    chipType: SicklerChipType.info, label: "Daily"),
                Container(
                  width: 2,
                  height: 24,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                const SicklerChip(
                    chipType: SicklerChipType.info, label: "8:00 AM"),
                const SicklerChip(
                    chipType: SicklerChipType.info, label: "3:00 PM"),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Medication History",
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const SicklerCalendar(),
            const SizedBox(height: 24),
            SicklerButton(
              onPressed: () {},
              label: "Edit Medication",
              showIcon: true,
              iconPath: "assets/svg/edit.svg",
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

class SicklerCalendar extends StatelessWidget {
  const SicklerCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      ///Todo; Make a Calendar Widget
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: theme.cardColor),
      child: const Center(
        child: Text("Build Calendar Widget here"),
      ),
    );
  }
}
