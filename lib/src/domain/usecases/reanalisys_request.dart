import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class ReanalisysRequest {
  final GuaranteeRepository _repository;

  ReanalisysRequest(this._repository);
  Future<Either<Failure, OrderModel>> call({
    @required String token,
    @required AnalysisRequestModel analysisRequestModel,
  }) async {
    if (analysisRequestModel == null) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.reanalisysRequest(analysisRequestModel);
  }
}
