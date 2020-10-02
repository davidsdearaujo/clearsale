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
    String analysisRequestCode,
    String analysisNewStatusCode,
  ) async {
    if (analysisRequestCode == null || analysisRequestCode.isEmpty) {
      return left(InvalidFieldFailure("analysisRequestCode"));
    }
    if (analysisNewStatusCode == null) {
      return left(InvalidFieldFailure("analysisNewStatusCode"));
    }
    return await _repository.statusUpdate(
      analysisRequestCode,
      analysisNewStatusCode,
    );
  }
}
