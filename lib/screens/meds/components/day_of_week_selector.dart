import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/screens/meds/components/day_of_week_item.dart';

class DayOfWeekSelector extends StatefulWidget {
  const DayOfWeekSelector({super.key, required this.selectedDays});
  final void Function(List<String> selectedDays) selectedDays;

  @override
  State<DayOfWeekSelector> createState() => _DayOfWeekSelectorState();
}

class _DayOfWeekSelectorState extends State<DayOfWeekSelector> {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  List<String> selectedDays = [];

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
              child: DayOfWeekItem(
                label: days[index].substring(0, 1).toUpperCase(),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Feedback.forTap(context);
                  // isDaySelected.updateAll((key, value) => false);
                  isDaySelected.update(
                      index, (value) => !isDaySelected[index]!);

                  if (isDaySelected[index]!) {
                    selectedDays.add(days[index]);
                  } else {
                    selectedDays.remove(days[index]);
                  }

                  setState(() {});
                  widget.selectedDays.call(selectedDays);
                },
                isSelected: isDaySelected[index]!,
              ),
            );
          },
          separatorBuilder: (contex, index) {
            return SizedBox(width: seperatorSpacing);
          },
          itemCount: days.length),
    );
  }
}
