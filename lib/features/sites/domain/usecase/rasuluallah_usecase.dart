import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/features/sites/domain/entities/fixed_entities.dart';
import 'package:mensaje_eterno/features/sites/domain/entities/media_entity.dart';
import 'package:mensaje_eterno/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../../../core/errors/failures.dart';

class RasuluallahUseCase {
  final RasuluallhRepository repository;
  RasuluallahUseCase(
    this.repository,
  );

  Future<Either<Failure, List<CategoryFixedEntity>>> call() async {
    return repository.getContent();
  }

  Future<Either<Failure, List<MediaEntity>>> getAudios() async {
    return repository.getAudios();
  }

  Future<Either<Failure, List<MediaCategoryEntity>>> getVideos() async {
    return repository.getVideos();
  }
}
