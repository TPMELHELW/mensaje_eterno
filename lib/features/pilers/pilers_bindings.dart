import 'package:get/get.dart';
import 'package:mensaje_eterno/features/pilers/controller/pilers_controller.dart';

class PilersBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(PilersController());
  }
}
