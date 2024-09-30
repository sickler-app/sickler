import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../global_components/bottom_nav_bar.dart';

class SuggestedWaterDailyGoalScreen extends ConsumerStatefulWidget {
  static const String id = "suggested_daily_goal";
  const SuggestedWaterDailyGoalScreen({super.key});

  @override
  ConsumerState<SuggestedWaterDailyGoalScreen> createState() =>
      _SuggestedWaterDailyGoalScreenState();
}

int dailyGoal = 2000;

class _SuggestedWaterDailyGoalScreenState
    extends ConsumerState<SuggestedWaterDailyGoalScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SicklerAppBar(
            showTitle: false,
            pageTitle: "Your daily goal",
            actions: [
              SicklerButton(
                  isChipButton: true,
                  onPressed: () {},
                  label: "Skip",
                  buttonType: SicklerButtonType.text),
            ],
          ),
          Text(
            "Your daily goal",
            style: theme.textTheme.displaySmall,
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "Based on the information you submitted, we suggest you drink this much water in a day",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          const Gap(64),
          Text("$dailyGoal ml",
              style: theme.textTheme.displaySmall!
                  .copyWith(fontWeight: FontWeight.w700)),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "We’ll remind you periodically to drink, you can also change your reminder preferences here.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SicklerButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => SicklerBottomSheet(
                        title: "Select Volume",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SicklerListWheelScrollViewPicker(
                          primaryInitialValue: 1000,
                          primaryFinalValue: 5000,
                          primaryValueInterval: 100,
                          primaryUnitLabels: const ["ml"],
                          onSelectedItemChanged: (selectedValue) {
                            /// Todo: change daily goal to selected volume

                            setState(() {
                              dailyGoal = selectedValue;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  label: "Change Goal",
                  icon: FluentIcons.edit_24_regular,
                  buttonType: SicklerButtonType.outline,
                ),
                const Gap(16),
                SicklerButton(
                  onPressed: () async {
                    //Save suggested water goal
                    SicklerUser user = ref.watch(userProvider).value!;

                    user = user.copyWith(
                        preferences: user.preferences
                            .copyWith(dailyWaterGoal: dailyGoal.toDouble()));

                    await ref
                        .watch(userProvider.notifier)
                        .updateUserData(user: user, updateRemote: true);

                    if (context.mounted) {
                      context.goNamed(BottomNavBar.id);
                    }
                  },
                  label: "Accept Goal & Continue",
                ),
              ],
            ),
          ),
          const Gap(64)
        ],
      ),
    );
  }
}
