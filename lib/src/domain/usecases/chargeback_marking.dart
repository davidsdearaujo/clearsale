import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/chargeback_marking_response_model.dart';
import '../models/response_model.dart';
import '../repositories/guarantee_repository.dart';

class ChargebackMarking {
  final GuaranteeRepository _repository;

  ChargebackMarking(this._repository);
  Future<Either<Failure, ResponseModel<ChargebackMarkingResponseModel>>> call({
    @required String message,
    List<String> analysisCode,
  }) async {
    if (message == null || message.isEmpty) {
      return left(InvalidFieldFailure("message"));
    }
    if (analysisCode == null || analysisCode.isEmpty) {
      return left(InvalidFieldFailure("analysisCode"));
    }

    return await _repository.chargebackMarking(message, analysisCode);
  }
}
