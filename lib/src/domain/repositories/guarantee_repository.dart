import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:dartz/dartz.dart';

import '../enums/payment_status_enum.dart';
import '../errors/failure.dart';
import '../models/analysis_request_model.dart';
import '../models/chargeback_marking_response_model.dart';
import '../models/message_model.dart';
import '../models/order_model.dart';
import '../models/token_model.dart';

abstract class GuaranteeRepository {
  Future<Either<Failure, TokenModel>> authenticate(
    CredentialsModel credentials,
    int loopIfErrorCount,
  );

  Future<Either<Failure, OrderModel>> analisysRequest(
    AnalisysRequestModel analysisRequest,
  );

  Future<Either<Failure, OrderModel>> reanalisysRequest(
    AnalisysRequestModel analysisRequest,
  );

  Future<Either<Failure, OrderModel>> statusConsult(
    String analisysNewStatusCode,
  );

  Future<Either<Failure, MessageModel>> statusUpdate(
    String analysisRequestCode,
    PaymentStatusEnum status,
  );

  Future<Either<Failure, ChargebackMarkingResponseModel>> chargebackMarking(
    String message,

    ///CODIGO_DO_MEU_PEDIDO
    List<String> analisysCode,
  );
}
