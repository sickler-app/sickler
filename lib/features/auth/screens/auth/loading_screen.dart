import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/bottom_nav_bar.dart';
import '../../../profile/profile.dart';
import '../../auth.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  static const id = "loading_screen";
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await evaluateInitialLocation(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //Todo:Replace this scaffold with either a static or animated splash screen;
    return const Scaffold(
        //     backgroundColor: Colors.red,
        //      body: Center(
        //        child: FittedBox(child: CircularProgressIndicator()),
        //      ),
        );
  }

  Future<void> evaluateInitialLocation(BuildContext context) async {
    log("EVALUATING INITIAL LOCATION");

    final userNotifier = ref.read(userProvider.notifier);

    await userNotifier.getCurrentUserData();

    final AppUser user = ref.watch(userProvider).value!;

    final bool isFirstTime = user.preferences.isFirstTime;
    final bool isOnboardingComplete = user.preferences.isOnboarded;
    final bool isLoggedIn = user.isNotEmpty;
    if (context.mounted) {
      if (isLoggedIn) {
        if (!isOnboardingComplete) {
          ///not onboarded
          context.goNamed(ProfileBasicInfoScreen.id);
        } else {
          ///Logged in and onboarded
          context.goNamed(BottomNavBar.id);
        }
      } else {
        ///Is not Logged In
        if (isFirstTime) {
          context.goNamed(OnboardingBaseScreen.id);
        } else {
          context.goNamed(GoogleSignInScreen.id);
        }
      }
    }
  }
}
