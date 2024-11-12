import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
import 'package:mensaje_eterno/features/hadith/domain/repository/hadith_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetSunnahHadithesUseCase {
  final HadithRepo hadithRepo;

  GetSunnahHadithesUseCase(this.hadithRepo);

  Future<Either<Failure, List<SunnahHadithModel>>> call() async {
    Get.find<Logger>().i("Call GetHadithesUseCase");
    return await hadithRepo.getHadithes();
  }
}
