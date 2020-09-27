import 'package:clearsale/src/domain/models/credentials_model.dart';

import '../../domain/enums/payment_status_enum.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/token_model.dart';

abstract class GuaranteeDatasource {
  Future<TokenModel> authenticate(CredentialsModel credentials);

  Future<OrderModel> analisysRequest(
    String token,
    AnalisysRequestModel analisysRequest,
  );

  Future<OrderModel> reanalisysRequest(
    String token,
    AnalisysRequestModel analysisRequest,
  );

  Future<OrderModel> statusConsult(
    String token,
    String analisysNewStatusCode,
  );

  Future<MessageModel> statusUpdate(
    String token,
    String analisysRequestCode,
    PaymentStatusEnum status,
  );

  Future<ChargebackMarkingResponseModel> chargebackMarking(
    String token,
    String message,
    List<String> analisysCode,
  );
}
