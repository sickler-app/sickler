import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/emergency/components/sickler_calendar_week_selector_item.dart';

class SicklerCalendarWeekSelector extends StatefulWidget {
  const SicklerCalendarWeekSelector({
    super.key,
    required this.selectedDay,
  });
  final void Function(String? selectedDay) selectedDay;

  @override
  State<SicklerCalendarWeekSelector> createState() =>
      _SicklerCalendarWeekSelectorState();
}

class _SicklerCalendarWeekSelectorState
    extends State<SicklerCalendarWeekSelector> {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  final List<String> dates = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
  ];

  String? selectedDay;

  Map<int, bool> isDaySelected = {};

  @override
  Widget build(BuildContext context) {
    //Gets the seperator spacing by calculating the the width of the device and
    //subtracting the combined widths of the daySelectorItems+padding,
    //then dividing the remaining space by 6 (6 spaces inbetween 7 objects)
    double seperatorSpacing =
        (MediaQuery.sizeOf(context).width - 32 - (44 * 7)) / 6;
    return SizedBox(
      height: 44,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            isDaySelected.putIfAbsent(index, () => false);
            return Center(
              child: SicklerCalendarWeekSelectorItem(
                label: days[index].substring(0, 2),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Feedback.forTap(context);
                  isDaySelected.update(
                      index, (value) => !isDaySelected[index]!);
                  selectedDay = days[index];
                  setState(() {});
                  widget.selectedDay.call(selectedDay);
                },
                isSelected: isDaySelected[index]!,
                date: dates[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap( seperatorSpacing);
          },
          itemCount: days.length),
    );
  }
}
