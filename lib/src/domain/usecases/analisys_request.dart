import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/analysis_request_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class AnalisysRequest {
  final GuaranteeRepository _repository;

  AnalisysRequest(this._repository);
  Future<Either<Failure, ResponseModel<AnalisysResponseModel>>> call(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.analisysRequest(analysisRequestModel);
  }
}
