import 'package:mensaje_eterno/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:mensaje_eterno/features/hadith/data/repository/hadith_repo_impl.dart';
import 'package:mensaje_eterno/features/hadith/domain/repository/hadith_repo.dart';
import 'package:mensaje_eterno/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:get/get.dart';

class HadithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<HadithLocalDataSource>(
      HadithLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
    );
    Get.put<HadithRepo>(
      HadithRepoImpl(
        hadithLocalDataSource: Get.find(),
      ),
    );

    Get.put(HadithController());
  }
}
