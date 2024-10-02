import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../providers/providers.dart';
import '../global_components/bottom_nav_bar.dart';
import '../profile/profile_basic_info_screen.dart';
import 'auth_success.dart';

class GoogleSignInScreen extends ConsumerStatefulWidget {
  static const String id = "google_sign_in";
  const GoogleSignInScreen({super.key});

  @override
  ConsumerState<GoogleSignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<GoogleSignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final authNotifier = ref.read(authProvider.notifier);
    final userNotifier = ref.read(userProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SicklerButton(
                    isLoading: ref.watch(authProvider).isLoading,
                    color: theme.colorScheme.primary,
                    overrideIconColor: false,
                    buttonType: SicklerButtonType.secondary,
                    iconPath: "assets/svg/google.svg",
                    onPressed: () async {
                      await authNotifier.singInWithGoogle();

                      if (authNotifier.isSuccessful) {
                        await userNotifier.getCurrentUserData();
                        SicklerUser user = ref.watch(userProvider).value!;

                        if (context.mounted) {
                          showCustomSnackBar(
                              context: context,
                              message: "Signed in successfully",
                              mode: SnackBarMode.success);
                          if (user.preferences.isFirstTime) {
                            ///Set as is Not First Time

                            await userNotifier.updateUserData(
                                user: user.copyWith(
                                    preferences: user.preferences
                                        .copyWith(isFirstTime: false)));

                            if (context.mounted) {
                              context.goNamed(AuthSuccessScreen.id);
                            }
                          } else {
                            if (user.preferences.isOnboarded) {
                              context.goNamed(BottomNavBar.id);
                            } else {
                              context.goNamed(ProfileBasicInfoScreen.id);
                            }
                          }
                        }
                      } else if (authNotifier.errorMessage != null) {
                        if (context.mounted) {
                          showCustomSnackBar(
                              context: context,
                              message: authNotifier.errorMessage!,
                              mode: SnackBarMode.error);
                        }
                      }
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
