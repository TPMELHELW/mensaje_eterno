import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_colors.dart';
import 'package:mensaje_eterno/core/utils/components/appbar/home_appbar.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/screens/advanced_sites.dart';
import 'package:mensaje_eterno/features/hadith/presentation/screens/hadith_screen.dart';
import 'package:mensaje_eterno/features/navigation_screen/controller/navigation_controller.dart';
import 'package:mensaje_eterno/features/navigation_screen/widgets/buttom_navigation_bar_widget.dart';
import 'package:mensaje_eterno/features/newMuslims/view/new_muslim_home_screen.dart';
import 'package:mensaje_eterno/features/quran/presentation/screens/quran_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: const HomeAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: controller.tabController,
            children: const [
              QuranScreen(),
              NewMuslimHomeScreen(),
              HadithScreen(),
              AdvancedSites()
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const BottomNavigationBarWidget()
        ],
      ),
    );
  }
}
