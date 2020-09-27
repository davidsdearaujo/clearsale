import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';

class StatusConsult {
  final GuaranteeRepository _repository;
  StatusConsult(this._repository);

  Future<Either<Failure, OrderModel>> call(String analisysCode) async {
    if (analisysCode == null || analisysCode.isEmpty) {
      return left(InvalidFieldFailure("analisysCode"));
    }
    return await _repository.statusConsult(analisysCode);
  }
}
