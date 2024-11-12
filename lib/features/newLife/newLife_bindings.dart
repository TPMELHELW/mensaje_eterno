import 'package:get/get.dart';
import 'package:mensaje_eterno/features/newLife/controller/newLife_controller.dart';

class NewLifeBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(NewLifeController());
  }
}
