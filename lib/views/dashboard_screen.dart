import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/core/colors/app_colors.dart';

import '../controllers/dashboard_controller.dart';
import 'calendar/calendar_screen.dart';
import 'home/home_screen.dart';
import 'mood/mood_screen.dart';
import 'placeholders.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeScreen(),
              CalendarScreen(),
              MoodScreen(),
              const ProfileScreen(),
            ],
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFF2C2C2E),
              width: 1.0,
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: Obx(() => BottomNavigationBar(
                currentIndex: controller.tabIndex.value,
                onTap: controller.changeTabIndex,
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color(0xFF66667E),
                showUnselectedLabels: true,
                selectedLabelStyle: GoogleFonts.mulish(
                    fontSize: 12, fontWeight: FontWeight.w600),
                unselectedLabelStyle: GoogleFonts.mulish(
                    fontSize: 12, fontWeight: FontWeight.w500),
                enableFeedback: false,
                items: [
                  BottomNavigationBarItem(
                    icon: navIcon(
                        "nutrition-icon", controller.tabIndex.value == 0),
                    label: 'Nutrition',
                  ),
                  BottomNavigationBarItem(
                    icon: navIcon("plan-icon", controller.tabIndex.value == 1),
                    label: 'Plan',
                  ),
                  BottomNavigationBarItem(
                    icon: navIcon("mood-icon", controller.tabIndex.value == 2),
                    label: 'Mood',
                  ),
                  BottomNavigationBarItem(
                    icon:
                        navIcon("profile-icon", controller.tabIndex.value == 3),
                    label: 'Profile',
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget navIcon(String iconName, bool isSelected) => Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 2),
        child: SvgPicture.asset(
          "assets/icons/$iconName.svg",
          colorFilter: ColorFilter.mode(
              isSelected ? AppColors.darkText : AppColors.navUnselected,
              BlendMode.srcIn),
        ),
      );
}