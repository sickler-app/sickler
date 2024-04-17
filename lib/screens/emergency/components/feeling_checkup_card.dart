import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/emergency/components/dialogs/emergency_alert_no_contact_dialog.dart';

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
              Text(
                "How are you\nfeeling today?",
                style: theme.textTheme.headlineSmall,
              ),
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
          const Gap(24),
          Row(
            children: [
              Text(
                "No Pain",
                style: theme.textTheme.bodySmall,
              ),
              const Spacer(),
              Text(
                "Extreme Pain",
                style: theme.textTheme.bodySmall,
              )
            ],
          ),
          Slider(value: .7, onChanged: (value) {}),
          const Gap(24),
          TextFormField(
            maxLines: 4,
            decoration: SicklerInputDecoration.inputDecoration(context)
                .copyWith(hintText: "Description"),
          ),
          const Gap(16),
          SicklerButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const EmergencyAlertNoContactDialog(),
              );
            },
            label: "Trigger SOS Alert",
            iconPath: "assets/svg/emergency-alt.svg",
          ),
        ],
      ),
    );
  }
}
