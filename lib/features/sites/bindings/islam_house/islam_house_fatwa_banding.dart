import 'package:get/get.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/islam_house/islam_house_fatwa_controller.dart';
import '../../../../core/services/archive_service.dart';
import '../../data/data_source/islam_house_local_data_source.dart';
import '../../data/repository/islam_house_repo_impl.dart';
import '../../domain/repository/islam_house_repository.dart';

class IslamHouseFatwaBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamHouseLocalDataSource>(
      IslamHouseLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<IslamHouseRepository>(
      IslamHouseRepositoryImp(
        islamHouseLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamHouseFatwaControllerImp());
  }
}
