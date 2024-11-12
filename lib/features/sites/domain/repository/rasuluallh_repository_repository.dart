import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/features/sites/domain/entities/fixed_entities.dart';
import 'package:mensaje_eterno/features/sites/domain/entities/media_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class RasuluallhRepository {
  Future<Either<Failure, List<CategoryFixedEntity>>> getContent();
  Future<Either<Failure, List<MediaEntity>>> getAudios();
  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos();
}
