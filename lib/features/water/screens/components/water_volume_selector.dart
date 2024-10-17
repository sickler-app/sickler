import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/components.dart';


class WaterVolumeSelector extends StatefulWidget {
  const WaterVolumeSelector({super.key, required this.selectedVolume});
  final Function(double? volume) selectedVolume;

  @override
  State<WaterVolumeSelector> createState() => _WaterVolumeSelectorState();
}

class _WaterVolumeSelectorState extends State<WaterVolumeSelector> {
  Map<int, bool> isVolumeSelected = {};
  List<String> volumes = ["250", "500", "1000", "custom"];

  Map<String, IconData> volumesData = {
    "250": FluentIcons.drink_coffee_24_regular,
    "500": FluentIcons.drink_bottle_32_regular,
    "100": FluentIcons.drink_bottle_32_regular,
    "custom": FluentIcons.add_24_regular,
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: volumesData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .7,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        isVolumeSelected.putIfAbsent(index, () => false);
        return AppSelectorItem(
            color: theme.colorScheme.tertiary,
            backgroundColor: isDarkMode
                ? theme.cardColor
                : theme.colorScheme.tertiaryContainer,
            icon: volumesData.values.toList()[index],
            label: volumesData.keys.toList()[index],
            unit: "ml",
            onPressed: () {
              HapticFeedback.mediumImpact();
              Feedback.forTap(context);

              ///Does the logic to select what was pressed on,
              ///by deselecting everything else, then selecting what was chosen
              isVolumeSelected.updateAll((key, value) => false);
              isVolumeSelected.update(
                  index, (value) => !isVolumeSelected[index]!);
              setState(() {});

              ///Then calls a selectedVolume function, to expose the selectedVolume in the parent widget
              widget.selectedVolume.call(double.tryParse(volumes[index]));
            },
            isSelected: isVolumeSelected[index]!);
      },
    );
  }
}
