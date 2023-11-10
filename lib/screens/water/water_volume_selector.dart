import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sickler/screens/water/water_volume_item.dart';

import '../../../core/core.dart';


class WaterVolumeSelector extends StatefulWidget {
  const WaterVolumeSelector({super.key, required this.selectedVolume});
  final Function(VolumeType medicationType) selectedVolume;

  @override
  State<WaterVolumeSelector> createState() => _WaterVolumeSelectorState();
}

class _WaterVolumeSelectorState extends State<WaterVolumeSelector> {
  Map<int, bool> isVolumeSelected = {};
  List<VolumeType> volumeTypeData = VolumeType.values;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: volumeTypeData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .7,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        isVolumeSelected.putIfAbsent(index, () => false);
        return WaterVolumeItem(
            volumeType: volumeTypeData[index],
            onPressed: () {
              HapticFeedback.mediumImpact();
              Feedback.forTap(context);
              isVolumeSelected.updateAll((key, value) => false);
              isVolumeSelected.update(
                  index, (value) => !isVolumeSelected[index]!);
              setState(() {});

              ///Calls a selectedMedication function, to expose the selectedMedication in the parent widget
              widget.selectedVolume.call(volumeTypeData[index]);
            },
            isSelected: isVolumeSelected[index]!);
      },
    );
  }
}
