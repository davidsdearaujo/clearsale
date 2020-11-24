import 'dart:convert';

import 'package:http/http.dart';

import '../../domain/errors/datasource.dart';
import '../../domain/models/analysis_response_model.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/response_model.dart';
import '../../domain/models/token_model.dart';
import '../../infra/datasources/guarantee_datasource.dart';
import '../errors/guarantee_datasource_errors.dart';
import '../maps/analysis_request_model_mapper.dart';
import '../maps/analysis_response_model.dart';
import '../maps/chargeback_marking_response_model_mapper.dart';
import '../maps/message_model_mapper.dart';
import '../maps/order_model_mapper.dart';
import '../maps/token_model_mapper.dart';

class GuaranteeDatasourceImpl implements GuaranteeDatasource {
  final Client _client;
  GuaranteeDatasourceImpl(this._client);

  @override
  Future<ResponseModel<AnalysisResponseModel>> analysisRequest(
    String token,
    AnalysisRequestModel analysisRequest,
  ) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders",
    );

    final body = AnalysisRequestModelMapper.toMap(analysisRequest);

    final data = await _client.post(
      uri,
      body: body,
      headers: {
        "Authorization": "Bearer $token",
        ...defaultHeaders,
      },
    );
    _throwFailureIfExists(data);

    final response = AnalysisResponseModelMapper.fromJson(data.body);

    return _makeResponse(response, data.headers);
  }

  @override
  Future<TokenModel> authenticate(CredentialsModel credentials) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/authenticate",
    );

    final body = <String, dynamic>{
      "name": credentials.userName,
      "password": credentials.password,
    };

    final data = await _client.post(
      uri,
      body: jsonEncode(body),
      headers: defaultHeaders,
    );
    _throwFailureIfExists(data);

    final json = jsonDecode(data.body);
    final response = TokenModelMapper.fromMap(json);
    return response;
  }

  @override
  Future<ResponseModel<ChargebackMarkingResponseModel>> chargebackMarking(
    String token,
    String message,
    List<String> analysisCode,
  ) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/authenticate",
    );

    final body = <String, dynamic>{
      "message": message,
      "orders": analysisCode,
    };

    final data = await _client.post(
      uri,
      body: jsonEncode(body),
      headers: {
        "Authorization": "Bearer $token",
        ...defaultHeaders,
      },
    );
    _throwFailureIfExists(data);

    final json = jsonDecode(data.body);
    final response = ChargebackMarkingResponseModelMapper.fromMap(json);
    return _makeResponse(response, data.headers);
  }

  @override
  Future<ResponseModel<AnalysisResponseModel>> reanalysisRequest(
    String token,
    AnalysisRequestModel request,
  ) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders",
    );

    final body = AnalysisRequestModelMapper.toMap(request);

    final data = await _client.post(
      uri,
      body: jsonEncode(body),
      headers: {
        "Authorization": "Bearer $token",
        ...defaultHeaders,
      },
    );
    _throwFailureIfExists(data);

    final response = AnalysisResponseModelMapper.fromJson(data.body);

    return _makeResponse(response, data.headers);
  }

  @override
  Future<ResponseModel<OrderModel>> statusConsult(
    String token,
    String analysisRequestCode,
  ) async {
    // GET https://homologacao.clearsale.com.br/api/v1/orders/{CODIGO_DO_MEU_PEDIDO}/status
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders/$analysisRequestCode/status",
    );

    final data = await _client.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        ...defaultHeaders,
      },
    );
    _throwFailureIfExists(data);

    final json = jsonDecode(data.body);
    final response = OrderModelMapper.fromMap(json);
    return _makeResponse(response, data?.headers);
  }

  @override
  Future<ResponseModel<MessageModel>> statusUpdate(
    String token,
    String analysisRequestCode,
    String status,
  ) async {
    final uri = Uri.https(
      "homologacao.clearsale.com.br",
      "/api/v1/orders/$analysisRequestCode/status",
    );

    final body = <String, dynamic>{
      "status": status,
    };

    final data = await _client.put(
      uri,
      body: jsonEncode(body),
      headers: {
        "Authorization": "Bearer $token",
        ...defaultHeaders,
      },
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

  final defaultHeaders = const {
    "Content-Type": "application/json",
  };

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
