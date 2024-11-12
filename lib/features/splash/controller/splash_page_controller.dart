import 'package:get/get.dart';
import 'package:mensaje_eterno/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:mensaje_eterno/features/hadith/hadith_bindings.dart';
import 'package:mensaje_eterno/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:mensaje_eterno/features/home/presentation/controller/home_controller.dart';
import 'package:mensaje_eterno/features/navigation_screen/navigation_screen.dart';
import 'package:mensaje_eterno/features/non_muslim/non_muslim_bindings.dart';
import 'package:mensaje_eterno/features/non_muslim/presentation/controller/non_muslim_controller.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    // NonMuslimBindings().dependencies();
    Get.put(HomeController());

    HadithBindings().dependencies();
    Get.put(HadithController());

    Get.put(AdvancedLearningController());

    NonMuslimBindings().dependencies();
    Get.put(NonMuslimController());

    // Get.put(TestController());

    goToNextView();
    super.onInit();
  }

  // void loadData() async {
  //   AppPublicVar.taharaLessons = await TaharaLessonFromJson.getData();
  //   goToNextView();
  // }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const NavigationScreen());
      Get.delete<SplashPageController>();
    });
  }
}
