import 'package:get/get.dart';
import 'package:mensaje_eterno/features/mooamalat/controller/mooamalat_controller.dart';

class MooamalatBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(MooamalatController());
  }
}
