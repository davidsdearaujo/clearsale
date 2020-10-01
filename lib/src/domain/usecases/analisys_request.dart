import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/repositories/guarantee_repository.dart';
import '../models/response_model.dart';

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
