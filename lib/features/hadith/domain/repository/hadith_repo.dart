import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/hadith/data/models/hadith_model.dart';
import 'package:mensaje_eterno/features/hadith/presentation/model/sunnah_data_model.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<SunnahHadithModel>>> getHadithes();
  Future<Either<Failure, List<SunnahDataModel>>> getSunnah(String path);
}
