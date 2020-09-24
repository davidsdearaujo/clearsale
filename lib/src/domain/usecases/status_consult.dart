import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class StatusConsult {
  final GuaranteeRepository _repository;

  StatusConsult(this._repository);
  Future<Either<Failure, OrderModel>> call({
    @required String token,
    @required String analisysCode,
  }) async {
    if (token == null || token.isEmpty) {
      return left(InvalidFieldFailure("token"));
    }
    if (analisysCode == null || analisysCode.isEmpty) {
      return left(InvalidFieldFailure("analysisRequestModel"));
    }
    return await _repository.statusConsult(analisysCode);
  }
}
