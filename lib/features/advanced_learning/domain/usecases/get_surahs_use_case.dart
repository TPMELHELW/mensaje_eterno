import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/quran/domain/entities/surah_entity.dart';
import 'package:mensaje_eterno/features/quran/domain/repository/quran_repo.dart';

class GetSurahsUseCase {
  final QuranRepo quranRepo;

  GetSurahsUseCase(this.quranRepo);

  Future<Either<Failure, List<Surah>>> call() async {
    return await quranRepo.getSurahs();
  }
}
