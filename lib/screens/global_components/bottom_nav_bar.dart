import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/screens/emergency/emergency_screen.dart';
import 'package:sickler/screens/home/home_screen.dart';
import 'package:sickler/screens/meds/meds_screen.dart';
import 'package:sickler/screens/profile/profile_screen.dart';
import 'package:sickler/screens/water/water_screen.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  static const String id = "nav_bar";
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final List<Widget> pages = [
    const HomeScreen(
      key: PageStorageKey(HomeScreen.id),
    ),
    const WaterScreen(
      key: PageStorageKey(WaterScreen.id),
    ),
    const EmergencyScreen(
      key: PageStorageKey(EmergencyScreen.id),
    ),
    const MedsScreen(
      key: PageStorageKey(MedsScreen.id),
    ),
    const ProfileScreen(
      key: PageStorageKey(ProfileScreen.id),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavBar(
      {required int selectedIndex, required Color selectedItemColor}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        NavigationBar(
          indicatorColor: Platform.isIOS
              ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0)
              : Theme.of(context).colorScheme.primaryContainer,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          elevation: 0,
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                label: "Home",
                icon: SvgPicture.asset(
                  "assets/svg/home-alt.svg",
                  colorFilter: const ColorFilter.mode(
                      SicklerColours.black, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/svg/home-alt-filled.svg",
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                )),
            NavigationDestination(
              label: "Water",
              icon: SvgPicture.asset(
                "assets/svg/droplet-alt.svg",
                colorFilter: const ColorFilter.mode(
                    SicklerColours.black, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/svg/droplet-alt-filled.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
                label: "Emergency",
                icon: SvgPicture.asset(
                  "assets/svg/emergency-alt.svg",
                  colorFilter: const ColorFilter.mode(
                      SicklerColours.black, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/svg/emergency-alt-filled.svg",
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                )),
            NavigationDestination(
              label: "Meds",
              icon: const Icon(FluentIcons.pill_24_regular,
                  color: SicklerColours.black),
              selectedIcon: Icon(FluentIcons.pill_24_filled,
                  color: Theme.of(context).colorScheme.primary),
            ),
            NavigationDestination(
              label: "Profile",
              icon: const Icon(FluentIcons.person_24_regular,
                  color: SicklerColours.black),
              selectedIcon: Icon(FluentIcons.person_24_filled,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(
          selectedIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Theme.of(context).primaryColor),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
