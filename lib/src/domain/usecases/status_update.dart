import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/message_model.dart';
import '../../domain/repositories/guarantee_repository.dart';
import '../models/response_model.dart';

///Importante: Os status de atualização devem ser combinados com a equipe de integração.
class StatusUpdate {
  final GuaranteeRepository _repository;
  StatusUpdate(this._repository);

  Future<Either<Failure, ResponseModel<MessageModel>>> call(
    String analisysRequestCode,
    String analisysNewStatusCode,
  ) async {
    if (analisysRequestCode == null || analisysRequestCode.isEmpty) {
      return left(InvalidFieldFailure("analisysRequestCode"));
    }
    if (analisysNewStatusCode == null) {
      return left(InvalidFieldFailure("analisysNewStatusCode"));
    }
    return await _repository.statusUpdate(
      analisysRequestCode,
      analisysNewStatusCode,
    );
  }
}
