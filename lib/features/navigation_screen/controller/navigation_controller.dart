import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/constants/app_assets.dart';
import 'package:mensaje_eterno/features/navigation_screen/model/tab_bar_model.dart';

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  static NavigationController get instance => Get.find<NavigationController>();

  List<TabBarModel> tabBarData = [
    TabBarModel(text: 'El Corán', image: AppAssets.quran),
    TabBarModel(text: 'El musulmán', image: AppAssets.prayer),
    TabBarModel(text: 'El Hadiz', image: AppAssets.hadith),
    TabBarModel(text: 'La Avanzada edu', image: AppAssets.azkar)
  ];
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
