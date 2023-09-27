import 'package:flutter/material.dart';
import 'package:sickler/screens/onboarding/onboarding_template_screen.dart';

import 'components/onboarding_button.dart';

class OnboardingBaseScreen extends StatefulWidget {
  const OnboardingBaseScreen({super.key});

  @override
  State<OnboardingBaseScreen> createState() => _OnboardingBaseScreenState();
}

class _OnboardingBaseScreenState extends State<OnboardingBaseScreen> {
  final List<Map<String, String>> onboardingInfo = [
    {
      "text": "We help you manage Sickle Cell",
      "image": "",
    },
    {
      "text": "Track your water intake, with daily reminders",
      "image": "",
    },
    {
      "text": "Get daily reminders so you never miss our on our medication",
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

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
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
            }),
          ),
        ],
      ),
    );
  }
}
