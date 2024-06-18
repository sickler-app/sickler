import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/auth/auth_success.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/global_components/bottom_nav_bar.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

import '../../models/user/user_preferences.dart';
import '../../providers/providers.dart';

class GoogleSignInScreen extends ConsumerStatefulWidget {
  static const String id = "google_sign_in";
  const GoogleSignInScreen({super.key});

  @override
  ConsumerState<GoogleSignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<GoogleSignInScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final UserPreferences? userPreferences =
          ref.read(userPreferencesProvider).value;

      ref
          .read(userPreferencesProvider.notifier)
          .addUserPreferencesToLocal(userPreferences!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final authProviderNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SicklerButton(
                    color: theme.colorScheme.primary,
                    overrideIconColor: false,
                    buttonType: SicklerButtonType.secondary,
                    iconPath: "assets/svg/google.svg",
                    onPressed: () async {
                      final UserPreferences? userPreferences =
                          ref.watch(userPreferencesProvider).value;

                      await authProviderNotifier.singInWithGoogle().then((_) {
                        if (context.mounted) {
                          if (userPreferences!.isFirstTime) {
                            ref
                                .watch(userPreferencesProvider.notifier)
                                .addUserPreferencesToLocal(userPreferences
                                    .copyWith(isFirstTime: false));

                            //mark as not first time
                            context.goNamed(AuthSuccessScreen.id);
                          } else {
                            if (userPreferences.isOnboardingComplete) {
                              context.goNamed(BottomNavBar.id);
                            } else {
                              context.goNamed(ProfileBasicInfoScreen.id);
                            }
                          }
                        }
                      });

                      // if (!user.hasError && user.hasValue) {
                      //Check if user is onboarded and either go to info screen or home screen
                      // final UserPreferences? userPreferences =
                      //     ref.watch(userPreferencesProvider).value;
                      // print("new user prefs");
                      // print(userPreferences);

                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //           "${(user.error as Failure).errorMessage}"),
                      //     ),
                      //   );
                      // }
                    },
                    label: "Continue")
                .animate()
                .fade(delay: 300.ms, duration: 600.ms)
                .moveY(
                    delay: 300.ms,
                    duration: 600.ms,
                    begin: 64,
                    end: 0,
                    curve: Curves.easeInOut),
            const Gap(kPadding16),
            const Text("Or").animate().fade(delay: 600.ms, duration: 200.ms),
            FittedBox(
              child: SicklerButton(
                      buttonType: SicklerButtonType.text,
                      onPressed: () {
                        context.pushNamed(SignInScreen.id);
                      },
                      label: "Continue with Email")
                  .animate()
                  .fade(delay: 700.ms, duration: 200.ms),
            ),
            const Gap(kPadding32),
          ],
        ),
      ),
    );
  }
}
