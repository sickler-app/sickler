import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';
import 'components.dart';

class GenotypeSelector extends StatefulWidget {
  final Function(Genotype selectedGenotype) onGenotypeSelect;
  const GenotypeSelector({super.key, required this.onGenotypeSelect});

  @override
  State<GenotypeSelector> createState() => _GenotypeSelectorState();
}

class _GenotypeSelectorState extends State<GenotypeSelector> {
  Map<int, bool> isGenotypeSelected = {3: true};
  List<Genotype> genotypeData = Genotype.values;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: genotypeData.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          isGenotypeSelected.putIfAbsent(index, () => false);

          return GenotypeSelectorItem(
            onPressed: () {
              HapticFeedback.mediumImpact();
              Feedback.forTap(context);
              isGenotypeSelected.updateAll((key, value) => false);
              isGenotypeSelected.update(
                  index, (value) => !isGenotypeSelected[index]!);

              setState(() {});
              widget.onGenotypeSelect.call(genotypeData[index]);
            },
            isSelected: isGenotypeSelected[index]!,
            genotype: genotypeData[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Gap(16);
        },
      ),
    );
  }
}
