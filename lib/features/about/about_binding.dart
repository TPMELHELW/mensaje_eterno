import 'package:get/get.dart';
import 'package:mensaje_eterno/features/about/controller/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  dependencies() async {
    Get.put(AboutController());
  }
}
