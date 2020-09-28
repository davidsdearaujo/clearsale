import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/order_model.dart';
import '../../domain/repositories/guarantee_repository.dart';

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
