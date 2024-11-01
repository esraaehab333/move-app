import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters para);
}

class NoParemeters extends Equatable {
  const NoParemeters();
  @override
  List<Object?> get props => [];
}
