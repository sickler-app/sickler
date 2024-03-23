import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class MedsScreenReminderCard extends StatefulWidget {
  final bool isCurrent;
  const MedsScreenReminderCard({
    super.key,
    this.isCurrent = false,
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
    return AnimatedContainer(
      duration: 250.ms,
      curve: Curves.easeInOut,
      height: widget.isCurrent ? 168 : 72,
      padding: widget.isCurrent
          ? const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8)
          : const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: widget.isCurrent
            ? theme.cardColor
            : theme.brightness == Brightness.dark
                ? theme.cardColor
                : SicklerColours.neutral95,
      ),
      child: widget.isCurrent
          ? Column(
              mainAxisSize: MainAxisSize.min,

              ///The Expanded Mode
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: widget.isCurrent,
                  child: Row(
                    children: [
                      Text(
                        "Up Next",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: theme.colorScheme.primary),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/svg/tablet.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                      const Gap( 8),
                      Text(
                        "Tablet",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: theme.colorScheme.primary),
                      ),
                      const Gap( 8),
                    ],
                  ),
                ),
                const Gap( 8),
                RepaintBoundary(
                  child: Text(
                    "Hydroxyl Urea",
                    style: widget.isCurrent
                        ? theme.textTheme.headlineMedium
                        : theme.textTheme.bodyLarge,
                  )
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
                SizedBox(height: widget.isCurrent ? 16 : 8),
                RepaintBoundary(
                  child: Text(
                    "8:00 pm",
                    style: widget.isCurrent
                        ? theme.textTheme.headlineMedium
                        : theme.textTheme.bodyMedium,
                  )
                      .animate(delay: 500.ms)
                      .fadeIn(
                          delay: 200.ms,
                          curve: Curves.easeOut,
                          duration: 500.ms)
                      .slideX(
                          curve: Curves.easeOut,
                          duration: 500.ms,
                          begin: .3,
                          end: 0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     SicklerButton( isChipButton:true,
                        buttonType: SicklerButtonType.outline,
                        onPressed: () {},
                        label: "View"),
                    const Gap( 8),
                     SicklerButton( isChipButton:true,
                        icon: FluentIcons.check_20_regular,
                        iconPath: "assets/svg/check.svg",
                        buttonType: SicklerButtonType.primary,
                        onPressed: () {},
                        label: "Taken")
                  ],
                )
              ],
            )
          : Row(
              ///The Compressed Mode
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primaryContainer),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/medication.svg",
                      colorFilter: ColorFilter.mode(
                          theme.colorScheme.primary, BlendMode.srcIn),
                    ),
                  ),
                ),
                const Gap( 16),
                RepaintBoundary(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hydroxyl Urea",
                        style: theme.textTheme.bodyLarge,
                      )
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
                      SizedBox(height: widget.isCurrent ? 16 : 8),
                      Text(
                        "8:00 pm",
                        style: theme.textTheme.bodyMedium,
                      )
                          .animate(delay: 500.ms)
                          .fadeIn(
                              delay: 200.ms,
                              curve: Curves.easeOut,
                              duration: 500.ms)
                          .slideX(
                              curve: Curves.easeOut,
                              duration: 500.ms,
                              begin: .3,
                              end: 0),
                    ],
                  ),
                ),
                const Spacer(),
                 SicklerButton( isChipButton:true,

                    iconPath: "assets/svg/check.svg",
                    icon: FluentIcons.check_20_regular,
                    buttonType: SicklerButtonType.outline,
                    onPressed: () {},
                    label: "Taken")
              ],
            ),
    );
  }
}
