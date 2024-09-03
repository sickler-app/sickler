import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/snackbar_notifier.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/charts/chart_data_transformer.dart';
import 'package:sickler/screens/water/charts/line_chart_widget.dart';
import 'package:sickler/screens/water/charts/test_chart_screen.dart';
import 'package:sickler/screens/water/components/water_volume_selector.dart';

import '../../models/models.dart';
import 'components/components.dart';

class WaterScreen extends ConsumerStatefulWidget {
  static const String id = "water";
  const WaterScreen({super.key});

  @override
  ConsumerState<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends ConsumerState<WaterScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(waterProvider.notifier).getWaterLogs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final waterNotifier = ref.watch(waterProvider.notifier);
    final SicklerUser user = ref.watch(userProvider).value!;

    List<WaterLog> totalLogsToday = ref.watch(waterProvider).value!;
    double totalToday =
        waterNotifier.calculateTotalFromLogs(logs: totalLogsToday);

    int dailyGoal = waterNotifier.preferences.dailyGoal!;
    double percentComplete = ((totalToday / dailyGoal) * 100);
    int remaining = dailyGoal - totalToday.toInt();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SnackBarNotifier(
        provider: waterProvider,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SicklerAppBar(pageTitle: "Water Intake"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SicklerCircularPercentIndicator(
                            value: percentComplete.toInt().toString(),
                            shouldAnimate: true,
                            unit: "%",
                            progress: percentComplete > 100
                                ? 1
                                : percentComplete / 100,
                          ),
                        ),
                        const Gap(16),
                        Text("${totalToday.toInt()} ml",
                            style: theme.textTheme.displaySmall!
                                .copyWith(fontWeight: FontWeight.w800)),
                        const Gap(16),
                        Text(
                            remaining == 0
                                ? "Goal Completed!"
                                : "remaining $remaining ml",
                            style: theme.textTheme.bodyMedium),
                        // const Gap(24),
                        // Text(
                        //     "Looking great! Log your water intake and hit that water goal ",
                        //     textAlign: TextAlign.center,
                        //     style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    const Gap(16),
                    WaterVolumeSelector(
                        selectedVolume: (double? selectedVolume) async {
                      WaterLog waterLog = WaterLog(
                          timestamp: DateTime.now(),
                          amount: selectedVolume ??
                              waterNotifier.preferences.logAmount!.toDouble());

                      await waterNotifier.addWaterLog(
                          entry: waterLog, user: user, updateRemote: true);
                      if (!waterNotifier.isSuccessful &&
                          waterNotifier.errorMessage != null) {
                        if (context.mounted) {
                          showCustomSnackBar(
                              context: context,
                              message: "Failed to add entry",
                              mode: SnackBarMode.error);
                        }
                      }
                    }),
                    Text("Statistics", style: theme.textTheme.headlineSmall),
                    const Gap(kPadding16),
                    // Text("Weekly Average", style: theme.textTheme.bodyMedium),
                    // const Gap(kPadding4),
                    //  Text("$dailyGoal ml",
                    //      style: theme.textTheme.headlineSmall!.copyWith(
                    //          fontWeight: FontWeight.w700,
                    //          color: theme.colorScheme.tertiary)),
                    const Gap(24),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: SicklerColours.neutral10,
                        borderRadius: BorderRadius.circular(kPadding24),
                      ),
                      child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChartWidget(
                            //s  xUnit: "H",
                            yUnit: "L",
                            timeScale: ChartTimeScale.month,
                            spots: ChartDataTransformer
                                .transformForCumulativeDailyTrend(
                                    generateSampleWaterLogs()
                                        .where((log) =>
                                            log.timestamp.isAfter(DateTime(
                                                2024, 08, 19, 0, 0, 0)) &&
                                            log.timestamp.isBefore(DateTime(
                                                2024, 08, 20, 0, 0, 0, 0)))
                                        .toList()),
                          )),
                    ),
                    const WaterStatistics(),
                    const Gap(24),
                    Text("Today's Logs", style: theme.textTheme.titleLarge),
                    const Gap(16),
                    ListView.separated(
                      separatorBuilder: (context, index) => const Gap(8),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: ref.watch(waterProvider).value!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return WaterLogListItem(
                          log: ref.watch(waterProvider).value![index],
                          onDeletePressed: () async {
                            await waterNotifier.deleteWaterLog(
                                entry: ref.watch(waterProvider).value![index],
                                user: user,
                                updateRemote:
                                    false); // Todo: change to true or setup periodic syncing
                          },
                          onEditPressed: (newLog) async {
                            await waterNotifier.updateWaterLog(
                                entry: newLog,
                                user: user,
                                updateRemote:
                                    false); // Todo: change to true or setup periodic syncing
                            setState(() {});
                          },
                        );
                      },
                    ),
                    const Gap(64)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
