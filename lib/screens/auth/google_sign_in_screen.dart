import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

import '../../providers/providers.dart';

class GoogleSignInScreen extends ConsumerStatefulWidget {
  static const String id = "google_sign_in";
  const GoogleSignInScreen({super.key});

  @override
  ConsumerState<GoogleSignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final authProviderNotifier = ref.watch(authProvider.notifier);
    final user = ref.watch(authProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SicklerButton(
                    color: theme.colorScheme.primary,
                    overrideIconColor: false,
                    buttonType: SicklerButtonType.secondary,
                    iconPath: "assets/svg/google.svg",
                    onPressed: () async {
                      await authProviderNotifier
                          .singInWithGoogle()
                          .then((value) {
                        if (user.hasError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${(user.error as Failure).errorMessage}"),
                            ),
                          );
                        } else {
                          ///todo: Navigate to user profile setup or home screen if the user in onboarded
                          context
                              .pushReplacementNamed(ProfileBasicInfoScreen.id);
                        }
                      });
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
            Gap(kPadding16),
            Text("Or").animate().fade(delay: 600.ms, duration: 200.ms),
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
            Gap(kPadding32),
          ],
        ),
      ),
    );
  }
}
