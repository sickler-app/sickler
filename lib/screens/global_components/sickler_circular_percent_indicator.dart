import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sickler/core/constants.dart';

class SicklerCircularPercentIndicator extends StatelessWidget {
  final String? value;
  final Color? progressColour;
  final Color? backgroundColor;
  final bool? shouldAnimate;
  final String unit;
  final double progress;

  /// Between 0 and 1

  const SicklerCircularPercentIndicator({
    super.key,
    required this.value,
    this.progressColour,
    this.backgroundColor,
    this.shouldAnimate = true,
    required this.unit,
    required this.progress,

    ///Between 0 and 1
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      animation: shouldAnimate!,
      circularStrokeCap: CircularStrokeCap.round,
      radius: screenSize.width * .22,
      progressColor: progressColour ?? SicklerColours.blueSeed,
      lineWidth: kDefaultPadding,
      backgroundColor: backgroundColor ?? (isDarkMode? theme.cardColor: SicklerColours.blue90),
      percent: progress,
      center: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "37",
                style: theme.textTheme.displayMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: " %", style: theme.textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }
}
