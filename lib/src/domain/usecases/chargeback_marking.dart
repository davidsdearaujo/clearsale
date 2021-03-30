import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/chargeback_marking_response_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class ChargebackMarking {
  final GuaranteeRepository _repository;

  ChargebackMarking(this._repository);
  Future<Either<Failure, ResponseModel<ChargebackMarkingResponseModel>>> call({
    required String message,
    required List<String> analysisCode,
  }) async {
    if (message.isEmpty) {
      return left(InvalidFieldFailure("message"));
    }
    if (analysisCode.isEmpty) {
      return left(InvalidFieldFailure("analysisCode"));
    }

    return await _repository.chargebackMarking(message, analysisCode);
  }
}
