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
  final double? radius;
  final bool? isSmall;

  /// Between 0 and 1

  const SicklerCircularPercentIndicator({
    super.key,
    required this.value,
    this.progressColour,
    this.backgroundColor,
    this.shouldAnimate = true,
    required this.unit,
    required this.progress,
    this.radius,
    this.isSmall = false,

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
      radius: radius ?? screenSize.width * .22,
      progressColor: progressColour ?? theme.colorScheme.tertiary,
      lineWidth: 24,
      backgroundColor: backgroundColor ??
          (isDarkMode ? theme.cardColor : SicklerColours.blue90),
      percent: progress,
      center: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: value,
                style: isSmall!
                    ? theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w700)
                    : theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w700)),
            TextSpan(text: " %", style: theme.textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }
}
