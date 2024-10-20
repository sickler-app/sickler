import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TodaysLog extends StatelessWidget {
  const TodaysLog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Gap(8),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }
}
