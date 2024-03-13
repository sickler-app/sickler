import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class FeelingCheckupCard extends StatelessWidget {
  const FeelingCheckupCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      //  color: theme.cardColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("How are you\n feeling today?"),
              const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "7",
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w800)),
                TextSpan(text: "/10", style: theme.textTheme.bodyMedium),
              ]))
            ],
          ),
          Gap( 24),
          Slider(value: .7, onChanged: (value) {}),
          Gap( 24),
          TextFormField(
            maxLines: 3,
            decoration: SicklerInputDecoration.inputDecoration(context)
                .copyWith(hintText: "Description"),
          ),
          Gap( 24),
          SicklerButton(
            onPressed: () {},
            label: "Trigger SOS Alert",
            showIcon: true,
            iconPath: "assets/svg.emergency.svg",
          ),
        ],
      ),
    );
  }
}
