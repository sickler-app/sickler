import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/meds/add_edit_meds_screen.dart';

class MedsDetailsScreen extends StatelessWidget {
  static const String id = "meds_details";
  const MedsDetailsScreen({super.key});

  ///Todo: Add more medication detail here, like the does, frequency, and stuff, reference Apple Health

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
            const Gap(24),
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
                const Gap(8),
                Text(
                  "Tablets",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary),
                ),
              ],
            ),
            const Gap(24),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Ut ipsum et viverra adipiscing velit viverra sit venenatis facilisis. Vel laoreet pellentesque amet amet orci viverra eget.",
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
            ),
            const Gap(24),
            const Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SicklerChip(chipType: SicklerChipType.info, label: "Daily"),
                SicklerChip(chipType: SicklerChipType.info, label: "8:00 AM"),
                SicklerChip(chipType: SicklerChipType.info, label: "3:00 PM"),
              ],
            ),
            const Gap(24),
            Text(
              "Medication History",
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const Gap(12),
            const SicklerCalendar(),
            const Gap(24),
            SicklerButton(
              onPressed: () {
                context.pushNamed(AddMedsScreen.id);
              },
              label: "Edit Medication",
              icon: FluentIcons.edit_24_regular,
            ),
            const Gap(64),
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
