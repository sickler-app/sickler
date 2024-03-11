import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'components/components.dart';

class HomeScreen extends StatefulWidget {
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
              const SizedBox(height: 64 + 16),
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
                        "Your water intake looks good,\nGood Job!😉",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/memoji.png"),
                    radius: 32,
                    backgroundColor: SicklerColours.neutral90,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              const FeelingCard(),
              const SizedBox(height: 16),
              const WaterCard(),
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Health Info",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(child: MedsReminderCard()),
                  SizedBox(width: 16),
                  Expanded(child: EmergencySharingCard())
                ],
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
