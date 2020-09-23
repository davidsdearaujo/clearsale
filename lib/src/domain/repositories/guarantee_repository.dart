import 'package:dartz/dartz.dart';

import '../enums/payment_status_enum.dart';
import '../errors/failure.dart';
import '../models/analysis_request_model.dart';
import '../models/chargeback_marking_response_model.dart';
import '../models/message_model.dart';
import '../models/order_model.dart';
import '../models/token_model.dart';

abstract class MaplinkRepository {
  Future<Either<Failure, TokenModel>> authenticate({
    String name,
    String password,
  });

  Future<Either<Failure, OrderModel>> analisysRequest({
    String token,
    AnalysisRequestModel analysisRequest,
  });

  Future<Either<Failure, OrderModel>> reanalisysRequest(
    String token,
    AnalysisRequestModel analysisRequest,
  );

  Future<Either<Failure, OrderModel>> statusConsult(
    String requestCode,
  );

  Future<Either<Failure, MessageModel>> statusUpdate(
    String token,
    String analysisRequestCode,
    PaymentStatusEnum status,
  );

  Future<Either<Failure, ChargebackMarkingResponseModel>> chargebackMarking(
    String token,
    String message,
    List<String> analysisRequestCode,
  );
}
