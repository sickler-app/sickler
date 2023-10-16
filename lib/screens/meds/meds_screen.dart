import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/meds/components/components.dart';

class MedsScreen extends StatelessWidget {
  const MedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SicklerAppBar(pageTitle: "Medication"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upcoming",
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  const MedsScreenReminderCard(
                    isCurrent: true,
                  ),
                  const SizedBox(height: 12),
                  const MedsScreenReminderCard(
                    isCurrent: false,
                  ),
                  const SizedBox(height: 48),
                  Text(
                    "My Medications",
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  const MyMedsCard(),
                  const SizedBox(height: 12),
                  const MyMedsCard(),
                  const SizedBox(height: 12),
                  const MyMedsCard(),
                  const SizedBox(
                    height: 32,
                  ),
                  SicklerButton(
                    showIcon: true,
                    iconPath: "assets/svg/plus.svg",
                    onPressed: () {},
                    label: "Add Medication",
                    buttonType: SicklerButtonType.secondary,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    children: [
                      Text(
                        "Today's History",
                        style: theme.textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/svg/filter.svg"))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const MedsHistoryItem(),
                  const MedsHistoryItem(),
                  const MedsHistoryItem(),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
