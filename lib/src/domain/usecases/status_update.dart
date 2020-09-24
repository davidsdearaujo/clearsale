import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

///Importante: Os status de atualização devem ser combinados com a equipe de integração.
class StatusUpdate {
  final GuaranteeRepository _repository;

  StatusUpdate(this._repository);
  Future<Either<Failure, OrderModel>> call({
    @required String token,
    @required String analisysNewStatusCode,
  }) async {
    if (token == null || token.isEmpty) {
      return left(InvalidFieldFailure("token"));
    }
    if (analisysNewStatusCode == null || analisysNewStatusCode.isEmpty) {
      return left(InvalidFieldFailure("analisysNewStatusCode"));
    }
    return await _repository.statusConsult(analisysNewStatusCode);
  }
}
