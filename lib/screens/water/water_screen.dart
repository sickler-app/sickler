import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/core/snackbar_notifier.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/models/water/water_preferences.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/components.dart';
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
  bool showFullDay = false;

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
    AppUser user = ref.watch(userProvider).value!;
    WaterStats waterStats = ref.watch(waterStatsProvider);
    WaterPreferences waterPreferences =
        ref.watch(waterPreferencesProvider).value!;

    List<WaterLog> todayLogs = waterStats.logsToday;
    List<WaterLog>? thisWeekLogs = waterStats.logsThisWeek;
    List<WaterLog>? thisMonthLogs = waterStats.logsThisMonth;

    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SnackBarNotifier(
        provider: waterLogProvider,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(pageTitle: "Water"),
              Align(
                alignment: Alignment.center,
                child: CustomCircularPercentIndicator(
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
                        .copyWith(fontWeight: FontWeight.w700)),
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
                        waterPreferences.logAmount!.toDouble());

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Gap(kPadding16),
                    WaterStatsCard(
                        dateRange: "Today",
                        title: "Today so far",
                        visible: todayLogs.isNotEmpty,
                        onActionPressed: () {
                          setState(() {
                            showFullDay = !showFullDay;
                          });
                        },
                        value:
                            "${(waterStats.totalToday / 1000).toStringAsFixed(1)} L",
                        child: LineChartWidget(
                          yUnit: "L",
                          timeScale: ChartTimeScale.day,
                          showFullDay: showFullDay,
                          spots: ChartDataTransformer
                              .transformForCumulativeDailyTrend(todayLogs),
                        )),
                    const Gap(kPadding16),
                    WaterStatsCard(
                      dateRange: "This Week",
                      title: "This week's average",
                      visible: thisWeekLogs!.isNotEmpty,
                      value:
                          "${(waterStats.averageThisWeek ?? 0).toStringAsFixed(2)} L",

                      ///Todo: Implement an error widget here
                      child: BarChartWidget(
                        yUnit: "L",
                        timeScale: ChartTimeScale.week,
                        barGroups:
                            ChartDataTransformer.transformForWeeklyTotals(
                                logList: thisWeekLogs),
                      ),
                    ),
                    const Gap(kPadding16),
                    WaterStatsCard(
                      visible: thisMonthLogs!.isNotEmpty,
                      dateRange: "This Month",
                      title: "This month's average",
                      value:
                          "${(waterStats.averageThisMonth ?? 0).toStringAsFixed(2)} L",
                      child: BarChartWidget(
                          timeScale: ChartTimeScale.month,
                          yUnit: "L",
                          barGroups:
                              ChartDataTransformer.transformForMonthlyTotals(
                                  logList: thisMonthLogs)),
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
  final String dateRange;
  final String value;
  final Widget child;
  final VoidCallback? onActionPressed;
  final IconData? actionIconData;
  final bool visible;
  const WaterStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.child,
    required this.dateRange,
    this.onActionPressed,
    this.actionIconData,
    this.visible = true,
  });

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
        //  color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(kPadding32),
      ),
      child: Visibility(
        visible: visible,
        replacement: AspectRatio(
          aspectRatio: 1.45,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/svg/illustrations/emojis/smiling-face-with-tear.svg",
                  height: 48,
                ),
                Gap(kPadding12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "No data to show, try adding some logs to see your stats here.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(children: [
            //   Chip(
            //     label: Text(
            //       dateRange,
            //       style: theme.textTheme.bodyMedium!
            //           .copyWith(color: theme.colorScheme.onTertiaryContainer),
            //     ),
            //     backgroundColor: SicklerColours.blue90,
            //     padding: EdgeInsets.symmetric(
            //         horizontal: kPadding12, vertical: kPadding12),
            //   ),
            //  Spacer(),

            // ],),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.textTheme.bodyMedium!.copyWith(

                            //color: Colors.white,

                            color: theme.colorScheme.onTertiary)),
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
                  ],
                ),
                const Spacer(),
                Visibility(
                  visible: onActionPressed != null,
                  child: IconButton.filled(
                    onPressed: onActionPressed,
                    icon: Icon(
                        actionIconData ?? FluentIcons.arrow_maximize_20_regular,
                        color: theme.colorScheme.onTertiary),
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? SicklerColours.neutral20
                            : SicklerColours.blue90),
                  ),
                ),
              ],
            ),

            const Gap(kPadding32),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: AspectRatio(
                aspectRatio: 2,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
