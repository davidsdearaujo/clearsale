import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../models/analysis_request_model.dart';
import '../models/chargeback_marking_response_model.dart';
import '../models/credentials_model.dart';
import '../models/message_model.dart';
import '../models/order_model.dart';
import '../models/response_model.dart';
import '../models/token_model.dart';

abstract class GuaranteeRepository {
  Future<Either<Failure, TokenModel>> authenticate(
    CredentialsModel credentials,
    int loopIfErrorCount,
  );

  Future<Either<Failure, ResponseModel<AnalisysResponseModel>>> analisysRequest(
    AnalisysRequestModel analysisRequest,
  );

  Future<Either<Failure, ResponseModel<OrderModel>>> reanalisysRequest(
    AnalisysRequestModel analysisRequest,
  );

  Future<Either<Failure, ResponseModel<OrderModel>>> statusConsult(
    String analisysNewStatusCode,
  );

  Future<Either<Failure, ResponseModel<MessageModel>>> statusUpdate(
    String analysisRequestCode,
    String status,
  );

  Future<Either<Failure, ResponseModel<ChargebackMarkingResponseModel>>>
      chargebackMarking(
    String message,

    ///CODIGO_DO_MEU_PEDIDO
    List<String> analisysCode,
  );
}
