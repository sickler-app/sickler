import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/screens/auth/register_screen.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/emergency/add_emergency_contact_screen.dart';
import 'package:sickler/screens/emergency/crisis_logs_screen.dart';
import 'package:sickler/screens/emergency/emergency_screen.dart';
import 'package:sickler/screens/global_components/bottom_nav_bar.dart';
import 'package:sickler/screens/home/home_screen.dart';
import 'package:sickler/screens/meds/add_edit_meds_screen.dart';
import 'package:sickler/screens/meds/meds_details_screen.dart';
import 'package:sickler/screens/meds/meds_schedule_screen.dart';
import 'package:sickler/screens/meds/meds_screen.dart';
import 'package:sickler/screens/onboarding/onboarding_base_screen.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';
import 'package:sickler/screens/profile/profile_medical_info_screen.dart';
import 'package:sickler/screens/profile/profile_screen.dart';
import 'package:sickler/screens/profile/profile_vitals_info_screen.dart';
import 'package:sickler/screens/profile/settings_screen.dart';
import 'package:sickler/screens/water/edit_daily_goal_screen.dart';
import 'package:sickler/screens/water/suggested_water_daily_goal_screen.dart';
import 'package:sickler/screens/water/water_empty_screen.dart';
import 'package:sickler/screens/water/water_screen.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "root");
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "shell");
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      ///-------H
      GoRoute(
        path: "/",
        name: BottomNavBar.id,
        builder: (BuildContext context, GoRouterState state) =>
            const BottomNavBar(),
      ),

      ///-------Home-------///
      GoRoute(
        path: "/${HomeScreen.id}",
        name: HomeScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),

      ///------Water-------///
      GoRoute(
        path: "/${WaterScreen.id}",
        name: WaterScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const WaterScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: EditDailyGoalScreen.id,
            name: EditDailyGoalScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const EditDailyGoalScreen(),
          ),
          GoRoute(
            path: SuggestedWaterDailyGoalScreen.id,
            name: SuggestedWaterDailyGoalScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SuggestedWaterDailyGoalScreen(),
          ),
          GoRoute(
            path: WaterEmptyScreen.id,
            name: WaterEmptyScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const WaterEmptyScreen(),
          ),
        ],
      ),

      ///------Emergency-------///
      GoRoute(
        path: "/${EmergencyScreen.id}",
        name: EmergencyScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const EmergencyScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: AddEmergencyContactScreen.id,
            name: AddEmergencyContactScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const AddEmergencyContactScreen(),
          ),
          GoRoute(
            path: CrisisLogsScreen.id,
            name: CrisisLogsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const CrisisLogsScreen(),
          ),
        ],
      ),

      ///------Profile-------///
      GoRoute(
        path: "/${ProfileScreen.id}",
        name: ProfileScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfileScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: SettingsScreen.id,
            name: SettingsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SettingsScreen(),
          ),
          GoRoute(
            path: ProfileBasicInfoScreen.id,
            name: ProfileBasicInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const ProfileBasicInfoScreen(),
          ),
          GoRoute(
            path: ProfileMedicalInfoScreen.id,
            name: ProfileMedicalInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const ProfileMedicalInfoScreen(),
          ),
          GoRoute(
            path: ProfileVitalsInfoScreen.id,
            name: ProfileVitalsInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const ProfileVitalsInfoScreen(),
          ),
        ],
      ),

      ///------Medication-------///
      GoRoute(
        path: "/${MedsScreen.id}",
        name: MedsScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const MedsScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: MedsScheduleScreen.id,
            name: MedsScheduleScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const MedsScheduleScreen(),
          ),
          GoRoute(
            path: AddMedsScreen.id,
            name: AddMedsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const AddMedsScreen(),
          ),
          GoRoute(
            path: MedsDetailsScreen.id,
            name: MedsDetailsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const MedsDetailsScreen(),
          ),
        ],
      ),

      ///------Onboarding and Auth-------///
      GoRoute(
        path: "/${OnboardingBaseScreen.id}",
        name: OnboardingBaseScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingBaseScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: SignInScreen.id,
            name: SignInScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SignInScreen(),
          ),
          GoRoute(
            path: RegisterScreen.id,
            name: RegisterScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const RegisterScreen(),
          ),
        ],
      ),
    ],
  );
}
