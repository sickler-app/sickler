import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/core.dart';
import 'components.dart';

class MedicationTypeSelector extends StatefulWidget {
  const MedicationTypeSelector({super.key, required this.selectedMedication});
  final Function(MedicationType medicationType) selectedMedication;

  @override
  State<MedicationTypeSelector> createState() => _MedicationTypeSelectorState();
}

class _MedicationTypeSelectorState extends State<MedicationTypeSelector> {
  Map<int, bool> isMedicationTypeSelected = {};
  List<MedicationType> medicationTypeData = MedicationType.values;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: medicationTypeData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .7,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        isMedicationTypeSelected.putIfAbsent(index, () => false);
        return MedsTypeItem(
            medicationType: medicationTypeData[index],
            onPressed: () {
              HapticFeedback.mediumImpact();
              Feedback.forTap(context);
              isMedicationTypeSelected.updateAll((key, value) => false);
              isMedicationTypeSelected.update(
                  index, (value) => !isMedicationTypeSelected[index]!);
              setState(() {});

              ///Calls a selectedMedication function, to expose the selectedMedication in the parent widget
              widget.selectedMedication.call(medicationTypeData[index]);
            },
            isSelected: isMedicationTypeSelected[index]!);
      },
    );
  }
}
