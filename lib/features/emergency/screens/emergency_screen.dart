import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';

import '../../../components/components.dart';
import '../emergency.dart';

class EmergencyScreen extends StatelessWidget {
  static const String id = "emergency";
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
            const CustomAppBar(pageTitle: "Emergency"),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const EmergencyLocationSharingCard(),
                      const Gap(24),
                      const FeelingCheckupCard(),
                      const Gap(32),
                      Row(
                        children: [
                          Text(
                            "My Contacts",
                            style: theme.textTheme.headlineSmall,
                          ),
                          const Spacer(),
                          AppButton(
                            isChipButton: true,
                            onPressed: () {},
                            label: "Add Contact",
                            buttonType: SicklerButtonType.text,
                            iconPath: "assets/svg/emergency-alt.svg",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      const Gap(16),
                      ContactCard(
                        onPressed: () {
                          context.goNamed(AddEmergencyContactScreen.id);
                        },
                        showAddContactButton: true,
                      ),
                      const Gap(12),
                      const ContactCard(),
                      const Gap(12),
                      const ContactCard(),
                      const Gap(16),
                    ],
                  ),
                ),
                const Gap(64),
              ],
            )
          ],
        ),
      ),
    );
  }
}
