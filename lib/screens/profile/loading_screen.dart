import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/screens/auth/google_sign_in_screen.dart';
import 'package:sickler/screens/onboarding/onboarding_base_screen.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

import '../../models/auth/sickler_user_model.dart';
import '../../models/user/user_preferences.dart';
import '../../providers/providers.dart';
import '../global_components/bottom_nav_bar.dart';

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
      await evaluateInitialLocation();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //Replace this scaffold with either a static or animated splash screen;
    return const Scaffold(
        //     backgroundColor: Colors.red,
        //      body: Center(
        //        child: FittedBox(child: CircularProgressIndicator()),
        //      ),
        );
  }

  Future<void> evaluateInitialLocation() async {
    print("EVALUATING INITIAL LOCATION");
    final SicklerUser user = ref.watch(currentUserStreamProvider).value!;
    late UserPreferences preferences;
    late bool isFirstTime;
    late bool isOnboardingComplete;
    await ref
        .watch(userPreferencesProvider.notifier)
        .getUserPreferences()
        .then((_) {
      ///Getting user data
      preferences = ref.watch(userPreferencesProvider).value!;

      isFirstTime = preferences.isFirstTime;
      isOnboardingComplete = preferences.isOnboardingComplete;
      final bool isLoggedIn = (user.isNotEmpty);
      if (context.mounted) {
        if (isLoggedIn) {
          if (!isOnboardingComplete) {
            ///not onboarded
            print("NAVIGATING TO ONBOARDING BEGINING SCREEN");
            context.goNamed(ProfileBasicInfoScreen.id);
            // return "/${ProfileScreen.id}/${ProfileBasicInfoScreen.id}";
          } else {
            ///Logged in and onboarded
            print("NAVIGATE HOME");
            context.goNamed(BottomNavBar.id);
            // return "/";
          }
        } else {
          ///Is not Logged In
          if (isFirstTime) {
            print("NAVIGATING TO ONBOARDING SCREENS");
            context.goNamed(OnboardingBaseScreen.id);
            //  return "/${OnboardingBaseScreen.id}";
          } else {
            print("NAVIGATING TO GOOGLE SIGN IN SCREEN");
            context.goNamed(GoogleSignInScreen.id);
            //  return "/auth/${GoogleSignInScreen.id}";
          }
        }
      }
    });
  }
}
