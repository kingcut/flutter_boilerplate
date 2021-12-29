import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/common/base_response.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_data.dart';
import 'package:flutter_boilerplate/domain/common/error_type.dart';
import 'package:flutter_boilerplate/domain/common/response_entity.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';

typedef ResponseToModel<Model> = Model Function(dynamic);

abstract class BaseRepositoryImpl {
  Future<ResultEntity<ResponseEntity<Model>>> safeApiCall<Model>(
      Future<BaseResponse<Model>> call) async {
    try {
      var response = await call;
      return ResultSuccessEntity<ResponseEntity<Model>>(
          ResponseEntity(response.data));
    } on Exception catch (exception) {
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return ResultErrorEntity(
                ErrorType.POOR_NETWORK, 'Hãy kiểm tra kết nối mạng của bạn!');

          case DioErrorType.other:
            return ResultErrorEntity(
                ErrorType.NO_NETWORK, 'Không có kết nối Internet!');

          case DioErrorType.response:
            return ServerErrorEntity(
              type: ErrorType.SERVER,
              error: exception.message,
              code: exception.response!.statusCode!,
            );
        }
      }
      return ResultErrorEntity(ErrorType.GENERIC, "Xảy ra lỗi, hãy thử lại!");
    }
  }
}
