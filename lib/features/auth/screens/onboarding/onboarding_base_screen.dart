import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

import '../../auth.dart';

class OnboardingBaseScreen extends ConsumerStatefulWidget {
  static const String id = "onboarding";
  const OnboardingBaseScreen({super.key});

  @override
  ConsumerState<OnboardingBaseScreen> createState() =>
      _OnboardingBaseScreenState();
}

class _OnboardingBaseScreenState extends ConsumerState<OnboardingBaseScreen> {
  final List<Map<String, String>> onboardingInfo = [
    {
      "text": "We help you manage\nSickle Cell",
      "image": "",
    },
    {
      "text": "Track your water intake, with daily reminders",
      "image": "",
    },
    {
      "text": "Never miss our on your medication",
      "image": "",
    },
    {
      "text": "Emergency features to make sure you've always got help",
      "image": "",
    }
  ];

  final PageController pageController = PageController(
    initialPage: 0,
  );

  int currentPageIndex = 0;

  ///Mesh Gradient Colors
  List<Color> meshGradientColors = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    meshGradientColors = [
      isDarkMode ? const Color(0xFF1F0060) : const Color(0xFFE6DDFD),
      isDarkMode ? const Color(0xFF350096) : const Color(0xFFD47AE9),
      isDarkMode ? const Color(0xFF2A0529) : const Color(0xFFE6DDFD),
      isDarkMode ? const Color(0xFF120C3B) : const Color(0xFFCBBCFD),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: AnimatedMeshGradient(
              colors: meshGradientColors,
              options: AnimatedMeshGradientOptions(
                  // frequency: 5,
                  //  amplitude: 20,
                  //  speed: 5,
                  grain: .3),
            ),
          ),
          PageView.builder(
              controller: pageController,
              itemCount: onboardingInfo.length,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
                //Set Mesh Gradient Colors
                if (index == 0) {
                  ///First Screen
                  meshGradientColors[0] =
                      isDarkMode ? const Color(0xFF1F0060) : const Color(0xFFE6DDFD);
                  meshGradientColors[1] =
                      isDarkMode ? const Color(0xFF350096) : const Color(0xFFD47AE9);
                  meshGradientColors[2] =
                      isDarkMode ? const Color(0xFF2A0529) : const Color(0xFFE6DDFD);
                  meshGradientColors[3] =
                      isDarkMode ? const Color(0xFF1C1F21) : const Color(0xFFCBBCFD);
                }
                if (index == 1) {
                  /// Water Screen

                  meshGradientColors[0] =
                      isDarkMode ? const Color(0xFF1684C2) : const Color(0xFF3FB2EF);
                  meshGradientColors[1] =
                      isDarkMode ? const Color(0xFF2F3134) : const Color(0xFFE7F0FD);
                  meshGradientColors[2] =
                      isDarkMode ? const Color(0xFF1C3630) : const Color(0xFF95CBFD);
                  meshGradientColors[3] =
                      isDarkMode ? const Color(0xFF062A50) : const Color(0xFFF3FDF2);

                  setState(() {});
                }
                if (index == 2) {
                  /// Medication Screen
                  meshGradientColors[0] =
                      isDarkMode ? const Color(0xFF2A1349) : const Color(0xFFFDEBE7);
                  meshGradientColors[1] =
                      isDarkMode ? const Color(0xFF481648) : const Color(0xFFFDF9FD);
                  meshGradientColors[2] =
                      isDarkMode ? const Color(0xFF982A09) : const Color(0xFFFDB49D);
                  meshGradientColors[3] =
                      isDarkMode ? const Color(0xFF2B102F) : const Color(0xFFF3C7FA);

                  setState(() {});
                }
                if (index == 3) {
                  /// Emergency Screen
                  meshGradientColors[0] =
                      isDarkMode ? const Color(0xFF880E0A) : const Color(0xFFFDD9D8);
                  meshGradientColors[1] =
                      isDarkMode ? const Color(0xFF342828) : const Color(0xFFFDEBEB);
                  meshGradientColors[2] =
                      isDarkMode ? const Color(0xFF441618) : const Color(0xFFFD878A);
                  meshGradientColors[3] =
                      isDarkMode ? const Color(0xFF371E5D) : const Color(0xFFFDEBE7);

                  setState(() {});
                }
              },
              itemBuilder: (BuildContext context, int index) {
                return OnboardingTemplateScreen(
                  text: onboardingInfo[index]["text"]!,
                  illustration: onboardingInfo[index]["image"]!,
                );
              }),
          Positioned(
            bottom: 64,
            right: 16,
            child: OnboardingButton(onPressed: () {
              if (currentPageIndex < onboardingInfo.length - 1) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }
              if (currentPageIndex == onboardingInfo.length - 1) {
                //go to sign in
                context.pushNamed(GoogleSignInScreen.id);
              }
            }),
          ),
        ],
      ),
    );
  }
}
