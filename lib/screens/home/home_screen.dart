import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/emergency/emergency_screen.dart';
import 'package:sickler/screens/profile/profile_screen.dart';
import 'package:sickler/screens/water/water_screen.dart';

import '../../core/core.dart';
import 'components/components.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String id = "home";
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final SicklerUser? user = ref.watch(authProvider).value;

    final String displayName = user?.displayName != null
        ? user!.displayName!.split(" ").first
        : user?.email ?? "User";

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
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Welcome,",
                                style: theme.textTheme.titleMedium),
                          ],
                        ),
                      ),
                      Text(displayName,
                          style: theme.textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w800)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: theme.colorScheme.primary.withOpacity(.2),
                    splashFactory: InkSparkle.splashFactory,
                    borderRadius: BorderRadius.circular(kPadding64),
                    onTap: () {
                      context.pushNamed(ProfileScreen.id);
                    },
                    child: CircleAvatar(
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : const AssetImage("assets/images/memoji.png")
                              as ImageProvider,
                      radius: 32,
                      backgroundColor: SicklerColours.neutral90,
                    ),
                  ),
                ],
              ),
              const Gap(kPadding24),
              const FeelingCard(),
              const Gap(kPadding16),
              WaterCard(
                onPressed: () {
                  context.pushNamed(WaterScreen.id);
                },
              ),
              const Gap(kPadding32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Health Info",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              // const Gap(kPadding16),
              // GestureDetector(
              //     onTap: () {
              //       context.goNamed(MedsScreen.id);
              //     },
              //     child: const MedsReminderCard()),
              const Gap(kPadding16),
              EmergencySharingCard(
                onPressed: () {
                  context.pushNamed(EmergencyScreen.id);
                },
              ),
              const SizedBox(
                height: kPadding64 * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
