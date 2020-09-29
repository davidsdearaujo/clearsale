import 'dart:convert';

import 'package:http/http.dart';

import '../../domain/errors/datasource.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/response_model.dart';
import '../../domain/models/token_model.dart';
import '../../infra/datasources/guarantee_datasource.dart';
import '../errors/guarantee_datasource_errors.dart';
import '../maps/message_model_mapper.dart';
import '../maps/order_model_mapper.dart';

class GuaranteeDatasourceImpl implements GuaranteeDatasource {
  final Client _client;
  GuaranteeDatasourceImpl(this._client);

  @override
  Future<ResponseModel<OrderModel>> analisysRequest(
      String token, AnalisysRequestModel analisysRequest) {
    // TODO: implement analisysRequest
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<TokenModel>> authenticate(CredentialsModel credentials) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<ChargebackMarkingResponseModel>> chargebackMarking(
      String token, String message, List<String> analisysCode) {
    // TODO: implement chargebackMarking
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<OrderModel>> reanalisysRequest(
      String token, AnalisysRequestModel analysisRequest) {
    // TODO: implement reanalisysRequest
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<OrderModel>> statusConsult(
    String token,
    String analisysRequestCode,
  ) async {
    // GET https://homologacao.clearsale.com.br/api/v1/orders/{CODIGO_DO_MEU_PEDIDO}/status
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders/$analisysRequestCode/status",
    );

    final data = await _client.get(
      uri,
      headers: {"Authorization": "Bearer $token"},
    );
    _throwFailureIfExists(data);

    final json = jsonDecode(data.body);
    final response = OrderModelMapper.fromMap(json);
    return _makeResponse(response, data?.headers);
  }

  @override
  Future<ResponseModel<MessageModel>> statusUpdate(
    String token,
    String analisysRequestCode,
    String status,
  ) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders/$analisysRequestCode/status",
    );

    final body = <String, dynamic>{
      "status ": status,
    };

    final data = await _client.put(
      uri,
      body: body,
      headers: {"Authorization": "Bearer $token"},
    );
    _throwFailureIfExists(data);

    final json = jsonDecode(data.body);
    final response = MessageModelMapper.fromMap(json);
    return _makeResponse(response, data?.headers);
  }

  ResponseModel<T> _makeResponse<T>(
    T response,
    Map<String, String> headers,
  ) {
    String requestId;
    if (headers != null && headers.isNotEmpty) {
      final lowerHeaders = headers
          .map((key, value) => MapEntry(key.toLowerCase(), value))
          .cast<String, String>();
          
      requestId = lowerHeaders["request-id"];
    }
    return ResponseModel<T>(
      requestId: requestId,
      data: response,
    );
  }

  void _throwFailureIfExists(Response response) {
    if (response == null) throw NullDatasourceResponseFailure();
    if (response.statusCode != 200) {
      try {
        final json = jsonDecode(response.body);
        throw EndpointMessageFailure(
          status: json["status"],
          message: json["message"],
        );
      } on EndpointMessageFailure {
        rethrow;
      } catch (ex) {
        throw EndpointInvalidStatusCodeFailure(
          statusCode: response.statusCode,
          body: response.body,
        );
      }
    }
  }
}
