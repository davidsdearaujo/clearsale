import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/order_model.dart';
import '../../domain/repositories/guarantee_repository.dart';
import '../models/response_model.dart';

class StatusConsult {
  final GuaranteeRepository _repository;
  StatusConsult(this._repository);

  Future<Either<Failure, ResponseModel<OrderModel>>> call(String analysisCode) async {
    if (analysisCode.isEmpty) {
      return left(InvalidFieldFailure("analysisCode"));
    }
    return await _repository.statusConsult(analysisCode);
  }
}
