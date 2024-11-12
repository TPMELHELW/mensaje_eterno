import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/non_muslim/data/models/course_model.dart';
import 'package:mensaje_eterno/features/non_muslim/domain/repository/non_muslim_repo.dart';

class GetCoursesUseCase {
  final NonMuslimRepo nonMuslimRepo;

  GetCoursesUseCase(this.nonMuslimRepo);

  Future<Either<Failure, List<NonMuslimModel>>> call() async {
    return await nonMuslimRepo.getCourses();
  }
}
