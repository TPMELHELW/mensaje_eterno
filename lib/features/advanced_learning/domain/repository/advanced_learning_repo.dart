import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/quran/domain/entities/surah_entity.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<Surah>>> getSurahs();
}
