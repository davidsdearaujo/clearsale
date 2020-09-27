import 'package:clearsale/src/domain/enums/payment_status_enum.dart';
import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';

///Importante: Os status de atualização devem ser combinados com a equipe de integração.
class StatusUpdate {
  final GuaranteeRepository _repository;
  StatusUpdate(this._repository);

  Future<Either<Failure, MessageModel>> call(
    String analysisRequestCode,
    PaymentStatusEnum analisysNewStatusCode,
  ) async {
    if (analysisRequestCode == null || analysisRequestCode.isEmpty) {
      return left(InvalidFieldFailure("analysisRequestCode"));
    }
    if (analisysNewStatusCode == null) {
      return left(InvalidFieldFailure("analisysNewStatusCode"));
    }
    return await _repository.statusUpdate(
      analysisRequestCode,
      analisysNewStatusCode,
    );
  }
}
