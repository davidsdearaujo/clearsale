import '../../domain/models/analysis_response_model.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/response_model.dart';
import '../../domain/models/token_model.dart';

abstract class GuaranteeDatasource {
  Future<TokenModel> authenticate(CredentialsModel credentials);
  Future<ResponseModel<AnalysisResponseModel>> analysisRequest(String token, AnalysisRequestModel analysisRequest);
  Future<ResponseModel<AnalysisResponseModel>> reanalysisRequest(String token, AnalysisRequestModel analysisRequest);
  Future<ResponseModel<OrderModel>> statusConsult(String token, String analysisRequestCode);
  Future<ResponseModel<MessageModel>> statusUpdate(String token, String analysisRequestCode, String status);
  Future<ResponseModel<ChargebackMarkingResponseModel>> chargebackMarking(String token, String message, List<String> analysisCode);
}
