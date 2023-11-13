import 'package:flutter/material.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const EmergencyLocationSharingCard(),
                    const SizedBox(
                      width: 16,
                    ),
                    const FeelingCheckupCard(),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Text(
                          "My Contacts",
                          style: theme.textTheme.headlineSmall,
                        ),
                        const Spacer(),
                        SicklerChipButton(
                          onPressed: () {},
                          label: "Add Contact",
                          buttonType: SicklerButtonType.text,
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ContactCard(
                            showAddContactButton: true,
                          ),
                          SizedBox(width: 12),
                          ContactCard(),
                          SizedBox(width: 12),
                          ContactCard(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
