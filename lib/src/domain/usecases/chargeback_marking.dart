import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/chargeback_marking_response_model.dart';
import '../repositories/guarantee_repository.dart';

class ChargebackMarking {
  final GuaranteeRepository _repository;

  ChargebackMarking(this._repository);
  Future<Either<Failure, ChargebackMarkingResponseModel>> call({
    @required String token,
    @required String message,
    List<String> analisysCode,
  }) async {
    if (token == null || token.isEmpty) {
      return left(InvalidFieldFailure("token"));
    }
    if (message == null || message.isEmpty) {
      return left(InvalidFieldFailure("message"));
    }
    if (analisysCode == null || analisysCode.isEmpty) {
      return left(InvalidFieldFailure("analisysCode"));
    }

    return await _repository.chargebackMarking(token, message, analisysCode);
  }
}
