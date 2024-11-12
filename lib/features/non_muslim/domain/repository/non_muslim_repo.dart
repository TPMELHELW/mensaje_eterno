import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/non_muslim/data/models/course_model.dart';

abstract class NonMuslimRepo {
  Future<Either<Failure, List<NonMuslimModel>>> getCourses();
}
