import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/snackbar_notifier.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/charts/chart_data_transformer.dart';
import 'package:sickler/screens/water/charts/line_chart_widget.dart';
import 'package:sickler/screens/water/components/water_volume_selector.dart';

import '../../models/models.dart';
import '../../providers/water/water_log_notifier.dart';
import '../../providers/water/water_providers.dart';
import 'charts/bar_chart_widget.dart';
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
      ref.watch(waterLogProvider.notifier).getWaterLogs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WaterLogNotifier waterLogNotifier =
        ref.watch(waterLogProvider.notifier);
    final SicklerUser user = ref.watch(userProvider).value!;

    final WaterStats waterStats = ref.watch(waterStatsProvider);

    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SnackBarNotifier(
        provider: waterLogProvider,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SicklerAppBar(pageTitle: "Water Intake"),
              Align(
                alignment: Alignment.center,
                child: SicklerCircularPercentIndicator(
                  value: waterStats.percentCompleteToday.toInt().toString(),
                  shouldAnimate: true,
                  unit: "%",
                  progress: waterStats.percentCompleteToday > 100
                      ? 1
                      : waterStats.percentCompleteToday / 100,
                ),
              ),
              const Gap(kPadding16),
              Align(
                alignment: Alignment.center,
                child: Text("${waterStats.totalToday.toInt()} ml",
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w800)),
              ),
              const Gap(kPadding12),
              Align(
                alignment: Alignment.center,
                child: Text(
                    waterStats.remainingToday <= 0
                        ? "Goal Completed!"
                        : "remaining ${waterStats.remainingToday} ml",
                    style: theme.textTheme.bodyMedium),
              ),
              const Gap(kPadding24),
              WaterVolumeSelector(
                  selectedVolume: (double? selectedVolume) async {
                WaterLog waterLog = WaterLog(
                    timestamp: DateTime.now(),
                    amount: selectedVolume ??
                        waterLogNotifier.preferences.logAmount!.toDouble());

                await waterLogNotifier.addWaterLog(
                    entry: waterLog, user: user, updateRemote: false);
                if (!waterLogNotifier.isSuccessful &&
                    waterLogNotifier.errorMessage != null) {
                  if (context.mounted) {
                    showCustomSnackBar(
                        context: context,
                        message: "Failed to add entry",
                        mode: SnackBarMode.error);
                  }
                }
              }),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text("Statistics", style: theme.textTheme.titleMedium),
              ),
              const Gap(kPadding16),
              // Text("Weekly Average", style: theme.textTheme.bodyMedium),
              // const Gap(kPadding4),
              //  Text("$dailyGoal ml",
              //      style: theme.textTheme.headlineSmall!.copyWith(
              //          fontWeight: FontWeight.w700,
              //          color: theme.colorScheme.tertiary)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Gap(kPadding16),
                    WaterStatsCard(
                      title: "Today so far",
                      value:
                          "${(waterStats.totalToday / 1000).toStringAsFixed(1)} L",
                      child: waterStats.logsToday.isNotEmpty
                          ? LineChartWidget(
                              yUnit: "L",
                              timeScale: ChartTimeScale.day,
                              spots: ChartDataTransformer
                                  .transformForCumulativeDailyTrend(
                                      waterStats.logsToday),
                            )
                          : Center(
                              child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: kPadding24),
                              child: Text(
                                "You haven't drunk any water yet",
                                style: theme.textTheme.bodyMedium,
                              ),
                            )),
                    ),
                    const Gap(kPadding16),
                    WaterStatsCard(
                      title: "This week's average",
                      value:
                          "${(waterStats.averageThisWeek ?? 0).toStringAsFixed(2)} L",

                      ///Todo: Implement an error widget here
                      child: BarChartWidget(
                        yUnit: "L",
                        timeScale: ChartTimeScale.week,
                        barGroups:
                            ChartDataTransformer.transformForWeeklyTotals(
                                logs: waterStats.logsThisWeek ?? []),
                      ),
                    ),
                    const Gap(kPadding16),
                    WaterStatsCard(
                      title: "This month's average",
                      value:
                          "${(waterStats.averageThisMonth ?? 0).toStringAsFixed(2)} L",
                      child: BarChartWidget(
                          timeScale: ChartTimeScale.month,
                          yUnit: "L",
                          barGroups:
                              ChartDataTransformer.transformForMonthlyTotals(
                                  logs: waterStats.logsThisMonth ?? [])),
                    ),
                    const Gap(kPadding16),
                  ],
                ),
              )

              //    const WaterStatistics(),
              ,
              const Gap(24),
              Padding(
                  padding: const EdgeInsets.only(left: kPadding16),
                  child:
                      Text("Today's Logs", style: theme.textTheme.titleMedium)),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(8),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: waterStats.logsToday.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return WaterLogListItem(
                      log: waterStats.logsToday[index],
                      onDeletePressed: () async {
                        await waterLogNotifier.deleteWaterLog(
                            entry: waterStats.logsToday[index],
                            user: user,
                            updateRemote:
                                false); // Todo: change to true or setup periodic syncing
                      },
                      onEditPressed: (newLog) async {
                        await waterLogNotifier.updateWaterLog(
                            entry: newLog,
                            user: user,
                            updateRemote:
                                false); // Todo: change to true or setup periodic syncing
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
              const Gap(64)
            ],
          ),
        ),
      ),
    );
  }
}

class WaterStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget child;
  const WaterStatsCard(
      {super.key,
      required this.title,
      required this.value,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      width: MediaQuery.sizeOf(context).width - 32,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isDarkMode ? theme.cardColor : theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(kPadding24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.bodyMedium),
          const Gap(kPadding4),
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  "assets/svg/droplet-alt-filled.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.tertiary, BlendMode.srcIn),
                ),
              ),
              const Gap(kPadding4),
              Text(value,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.colorScheme.tertiary)),
            ],
          ),
          const Gap(kPadding24),
          AspectRatio(
            aspectRatio: 2,
            child: child,
          ),
        ],
      ),
    );
  }
}
