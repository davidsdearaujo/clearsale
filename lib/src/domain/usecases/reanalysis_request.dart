import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/analysis_response_model.dart';
import '../models/analysis_request_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class ReanalysisRequest {
  final GuaranteeRepository _repository;
  ReanalysisRequest(this._repository);

  Future<Either<Failure, ResponseModel<AnalysisResponseModel>>> call(
    AnalysisRequestModel analysisRequestModel,
  ) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.reanalysisRequest(analysisRequestModel);
  }
}
