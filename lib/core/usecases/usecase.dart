import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
