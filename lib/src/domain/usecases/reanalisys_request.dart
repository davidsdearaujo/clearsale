import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/analisys_response_model.dart';
import '../models/analysis_request_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class ReanalisysRequest {
  final GuaranteeRepository _repository;
  ReanalisysRequest(this._repository);

  Future<Either<Failure, ResponseModel<AnalisysResponseModel>>> call(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.reanalisysRequest(analysisRequestModel);
  }
}
