import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/azkar_doaa/data/models/sonan_model.dart';
import 'package:mensaje_eterno/features/azkar_doaa/domain/repository/azkar_doaa_repo.dart';

class GetSonanUseCase {
  final AzkarDoaaRepo azkarDoaaRepo;

  GetSonanUseCase(this.azkarDoaaRepo);

  Future<Either<Failure, Sonan>> call() async {
    return await azkarDoaaRepo.getSonan();
  }
}
