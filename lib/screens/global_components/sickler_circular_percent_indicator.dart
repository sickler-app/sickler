import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sickler/core/constants.dart';




class SicklerCircularPercentIndicator extends StatelessWidget {
  final String? value;
  final Color? progressColour;
  final Color? bgColor;
  final bool? animate;
  final String unit;
  final double progress;

  /// Between 0 and 1

  const SicklerCircularPercentIndicator({
    Key? key,
    required this.value,
    this.progressColour,
    this.bgColor,
    this.animate,
    required this.unit,
    required this.progress,

    ///Between 0 and 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * .5,
      height: screenSize.width * .5,
      child: CircularPercentIndicator(
        animateFromLastPercent: true,
        animation: animate ?? false,
        circularStrokeCap: CircularStrokeCap.round,
        radius: screenSize.width * .24,
        progressColor: progressColour ?? SicklerColours.blue60,
        lineWidth: kDefaultPadding,
        backgroundColor: bgColor ?? SicklerColours.blue80,
        percent: progress,
        center: Row(
mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value??"0",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 44),
              ),
              Text(
                  unit, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).iconTheme.color!.withOpacity(.4))),
            ],
          ),

      ),
    );
  }
}