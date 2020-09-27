import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';

class AnalisysRequest {
  final GuaranteeRepository _repository;

  AnalisysRequest(this._repository);
  Future<Either<Failure, OrderModel>> call(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.analisysRequest(analysisRequestModel);
  }
}
