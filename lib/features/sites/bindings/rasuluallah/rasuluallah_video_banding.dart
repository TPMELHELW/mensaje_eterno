import 'package:get/get.dart';
import 'package:mensaje_eterno/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/rasuluallah/rasulullah_videos_controller.dart';
import '../../../../core/services/archive_service.dart';
import '../../data/data_source/rasuluallah_local_data_source.dart';
import '../../data/repository/rasuluallh_repo_impl.dart';

class RasuluallhVideosBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<RasuluallhLocalDataSource>(
      RasuluallhLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<RasuluallhRepository>(
      RasuluallhRepositoryImp(
        rasuluallhLocalDataSource: Get.find(),
      ),
    );

    Get.put(RasuluallhVideosControllerImp());
  }
}
