import 'package:flutter_boilerplate/domain/common/error_type.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';

class ResultSuccess<T> extends ResultSuccessEntity<T> {
  ResultSuccess(T data) : super(data);
}

// class ResultError<T> extends ResultErrorEntity<T> {
//   ResultError(ErrorT) : super(null, '');
// }
//
// class ServerError<T> extends ServerErrorEntity<T> {
//   ServerError({
//     required ErrorType type,
//     required String error,
//     required this.code,
//   }) : super(type, error);
// }
