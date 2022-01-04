
import 'package:flutter_boilerplate/domain/common/error_type.dart';

class ResultEntity<T> with SealedResult<T> {
  bool get isSuccessful => this is ResultSuccessEntity<T>;

  ResultEntity<T> transform({
    required T Function(T)? success,
    ResultErrorEntity<T> Function(ResultErrorEntity<T>)? error,
  }) {
    if (this is ResultSuccessEntity<T> && success != null) {
      (this as ResultSuccessEntity<T>).data =
          success.call((this as ResultSuccessEntity<T>).data);
    }
    if (this is ResultErrorEntity<T> && error != null) {
      return error.call(this as ResultErrorEntity<T>);
    }
    return this;
  }
}

class ResultSuccessEntity<T> extends ResultEntity<T> {
  T data;

  ResultSuccessEntity(this.data);
}

class ResultErrorEntity<T> extends ResultEntity<T> {
  ErrorType type;
  String message;

  ResultErrorEntity(this.type, this.message);
}

class ServerErrorEntity<T> extends ResultErrorEntity<T> {
  int code;

  ServerErrorEntity({
    required ErrorType type,
    required String error,
    required this.code,
  }) : super(type, error);
}

abstract class SealedResult<T> {
  R? when<R>({
    R Function(T)? success,
    R Function(ResultErrorEntity)? error,
  }) {
    if (this is ResultSuccessEntity<T>) {
      return success?.call((this as ResultSuccessEntity).data);
    }
    if (this is ResultErrorEntity<T>) {
      return error?.call(this as ResultErrorEntity);
    }
    throw Exception(
        'If you got here, probably you forgot to regenerate the classes? '
        'Try running flutter packages pub run build_runner build');
  }
}
