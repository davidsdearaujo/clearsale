import 'package:clearsale/src/domain/models/analysis_response_model.dart';
import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../models/analysis_request_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class AnalysisRequest {
  final GuaranteeRepository _repository;

  AnalysisRequest(this._repository);
  Future<Either<Failure, ResponseModel<AnalysisResponseModel>>> call(
    AnalysisRequestModel analysisRequestModel,
  ) async {
    return await _repository.analysisRequest(analysisRequestModel);
  }
}
