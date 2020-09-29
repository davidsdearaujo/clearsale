import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/response_model.dart';
import '../../domain/models/token_model.dart';

abstract class GuaranteeDatasource {
  Future<ResponseModel<TokenModel>> authenticate(CredentialsModel credentials);

  Future<ResponseModel<OrderModel>> analisysRequest(
    String token,
    AnalisysRequestModel analisysRequest,
  );

  Future<ResponseModel<OrderModel>> reanalisysRequest(
    String token,
    AnalisysRequestModel analysisRequest,
  );

  Future<ResponseModel<OrderModel>> statusConsult(
    String token,
    String analisysRequestCode,
  );

  Future<ResponseModel<MessageModel>> statusUpdate(
    String token,
    String analisysRequestCode,
    String status,
  );

  Future<ResponseModel<ChargebackMarkingResponseModel>> chargebackMarking(
    String token,
    String message,
    List<String> analisysCode,
  );
}
