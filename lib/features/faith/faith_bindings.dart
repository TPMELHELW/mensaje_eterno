import 'package:get/get.dart';
import 'package:mensaje_eterno/features/faith/controller/faith_controller.dart';

class FaithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(FaithController());
  }
}
