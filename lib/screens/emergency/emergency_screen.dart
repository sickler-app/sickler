import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/emergency/components/components.dart';

import '../global_components/global_components.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SicklerAppBar(pageTitle: "Emergency"),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const EmergencyLocationSharingCard(),
                      Gap(24),
                      const FeelingCheckupCard(),
                      Gap(32),
                      Row(
                        children: [
                          Text(
                            "My Contacts",
                            style: theme.textTheme.headlineSmall,
                          ),
                          const Spacer(),
                           SicklerButton( isChipButton:true,
                            onPressed: () {},
                            label: "Add Contact",
                            buttonType: SicklerButtonType.text,
                            iconPath: "assets/svg/emergency.svg",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(16),
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
                      Gap(16),
                      ContactCard(
                        showAddContactButton: true,
                      ),
                      Gap(12),
                      ContactCard(),
                      Gap(12),
                      ContactCard(),
                      Gap(16),
                    ],
                  ),
                ),
                Gap(64),
              ],
            )
          ],
        ),
      ),
    );
  }
}
