import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/screens/emergency/emergency_screen.dart';
import 'package:sickler/screens/meds/meds_screen.dart';
import 'package:sickler/screens/profile/profile_screen.dart';
import 'package:sickler/screens/water/water_screen.dart';

import '../../core/core.dart';
import 'components/components.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(64 + 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Welcome, ",
                            style: theme.textTheme.headlineSmall),
                        TextSpan(
                            text: "Joe",
                            style: theme.textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.w800)),
                      ])),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Your water intake looks good,Good Job!",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.pushNamed(ProfileScreen.id);
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/memoji.png"),
                      radius: 32,
                      backgroundColor: SicklerColours.neutral90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              const FeelingCard(),
              const Gap(16),
              WaterCard(
                onPressed: () {
                  context.pushNamed(WaterScreen.id);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Health Info",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const Gap(16),
              GestureDetector(
                  onTap: () {
                    context.goNamed(MedsScreen.id);
                  },
                  child: const MedsReminderCard()),
              const Gap(16),
              EmergencySharingCard(
                onPressed: () {
                  context.pushNamed(EmergencyScreen.id);
                },
              ),
              const SizedBox(
                height: 64,
              )
            ],
          ),
        ),
      ),
    );
  }
}
