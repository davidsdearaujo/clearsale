import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/repositories/guarantee_repository.dart';

class ReanalisysRequest {
  final GuaranteeRepository _repository;
  ReanalisysRequest(this._repository);
  
  Future<Either<Failure, OrderModel>> call(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.reanalisysRequest(analysisRequestModel);
  }
}
