import 'package:get/get.dart';
import 'package:mensaje_eterno/features/prophet/controller/prophet_controller.dart';

class ProphetBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(ProphetController());
  }
}
