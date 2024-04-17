import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/meds/meds_details_screen.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class MedsScreenReminderCard extends StatefulWidget {
  const MedsScreenReminderCard({
    super.key,
  });

  @override
  State<MedsScreenReminderCard> createState() => _MedsScreenReminderCardState();
}

class _MedsScreenReminderCardState extends State<MedsScreenReminderCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      splashFactory: InkSparkle.splashFactory,
      splashColor: theme.colorScheme.primary.withOpacity(.2),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => const MedsDetailsScreen(),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(24)),
        child: AnimatedContainer(
          duration: 250.ms,
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            ///The Expanded Mode
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Up Next",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: SicklerColours.neutral50),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/svg/tablet.svg",
                    colorFilter: ColorFilter.mode(
                        SicklerColours.neutral50, BlendMode.srcIn),
                  ),
                  const Gap(8),
                  Text(
                    "Tablet",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: SicklerColours.neutral50),
                  ),
                  const Gap(8),
                ],
              ),
              const Gap(8),
              RepaintBoundary(
                child:
                    Text("Hydroxyl Urea", style: theme.textTheme.headlineMedium)
                        .animate()
                        .slideX(
                            curve: Curves.easeOut,
                            duration: 500.ms,
                            begin: .3,
                            end: 0)
                        .fadeIn(
                            delay: 200.ms,
                            curve: Curves.easeOut,
                            duration: 500.ms),
              ),
              Gap(8),
              RepaintBoundary(
                child: Text("8:00 pm",
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w800))
                    .animate(delay: 500.ms)
                    .fadeIn(
                        delay: 200.ms, curve: Curves.easeOut, duration: 500.ms)
                    .slideX(
                        curve: Curves.easeOut,
                        duration: 500.ms,
                        begin: .3,
                        end: 0),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: SicklerButton(
                      isChipButton: true,
                      icon: FluentIcons.checkmark_20_regular,
                      buttonType: SicklerButtonType.primary,
                      onPressed: () {},
                      label: "Taken"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//  Row(
// ///The Compressed Mode
// children: [
// Container(
// height: 40,
// width: 40,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: theme.colorScheme.primaryContainer),
// child: Center(
// child: SvgPicture.asset(
// "assets/svg/medication.svg",
// colorFilter: ColorFilter.mode(
// theme.colorScheme.primary, BlendMode.srcIn),
// ),
// ),
// ),
// const Gap(16),
// RepaintBoundary(
// child: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Hydroxyl Urea",
// style: theme.textTheme.bodyLarge,
// )
//     .animate()
//     .slideX(
// curve: Curves.easeOut,
// duration: 500.ms,
// begin: .3,
// end: 0)
//     .fadeIn(
// delay: 200.ms,
// curve: Curves.easeOut,
// duration: 500.ms),
// SizedBox(height: widget.isCurrent ? 16 : 8),
// Text(
// "8:00 pm",
// style: theme.textTheme.bodyMedium,
// )
//     .animate(delay: 500.ms)
//     .fadeIn(
// delay: 200.ms,
// curve: Curves.easeOut,
// duration: 500.ms)
//     .slideX(
// curve: Curves.easeOut,
// duration: 500.ms,
// begin: .3,
// end: 0),
// ],
// ),
// ),
// const Spacer(),
// SicklerButton(
// isChipButton: true,
// icon: FluentIcons.check_20_regular,
// buttonType: SicklerButtonType.outline,
// onPressed: () {},
// label: "Taken")
// ],
// ),
