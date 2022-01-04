import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';

abstract class UseCase {
  dynamic call();
}

abstract class UseCaseResult<Type, Params> extends UseCase {
  @override
  Future<ResultEntity<Type>> call({Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
