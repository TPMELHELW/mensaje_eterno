import 'package:get/get.dart';
import 'package:mensaje_eterno/features/sites/presentation/controller/knowing_allah/knowing_allah_books_controller.dart';
import '../../../../core/services/archive_service.dart';
import '../../data/data_source/knowing_allah_local_data_source.dart';
import '../../data/repository/knowing-allah_repo_imp.dart';
import '../../domain/repository/knowing_allah_repository.dart';

class KnowingAllahBooksBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<KnowingAllahLocalDataSource>(
      KnowingAllahLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<KnowingAllahRepository>(
      KnowingAllahRepositoryImp(
        knowingAllahLocalDataSource: Get.find(),
      ),
    );

    Get.put(KnowingAllahBooksControllerImp());
  }
}
