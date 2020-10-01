import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/usecases/analisys_request.dart';
import 'package:clearsale/src/domain/usecases/authenticate.dart';
import 'package:clearsale/src/domain/usecases/chargeback_marking.dart';
import 'package:clearsale/src/domain/usecases/reanalisys_request.dart';
import 'package:clearsale/src/domain/usecases/status_consult.dart';
import 'package:clearsale/src/domain/usecases/status_update.dart';
import 'package:clearsale/src/external/datasources/guarantee_datasource_impl.dart';
import 'package:clearsale/src/infra/repositories/guarantee_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class ClearSale {
  final CredentialsModel credentials;
  Authenticate _authenticate;
  AnalisysRequest _analisysRequest;
  ReanalisysRequest _reanalisysRequest;
  ChargebackMarking _chargebackMarking;
  StatusConsult _statusConsult;
  StatusUpdate _statusUpdate;

  factory ClearSale({
    @required CredentialsModel credentials,
    bool automaticAuthenticate = true,
  }) =>
      ClearSale._(credentials, automaticAuthenticate);

  factory ClearSale.test({
    @required CredentialsModel credentials,
    bool automaticAuthenticate = true,
    @required Client httpClient,
  }) =>
      ClearSale._(credentials, automaticAuthenticate, httpClient);

  ClearSale._(
    this.credentials,
    bool automaticAuthenticate, [
    Client httpClient,
  ]) {
    final guaranteeDatasource = GuaranteeDatasourceImpl(httpClient ?? Client());
    final guaranteeRepository = GuaranteeRepositoryImpl(guaranteeDatasource);
    _authenticate = Authenticate(guaranteeRepository);
    _analisysRequest = AnalisysRequest(guaranteeRepository);
    _reanalisysRequest = ReanalisysRequest(guaranteeRepository);
    _chargebackMarking = ChargebackMarking(guaranteeRepository);
    _statusConsult = StatusConsult(guaranteeRepository);
    _statusUpdate = StatusUpdate(guaranteeRepository);
    if (automaticAuthenticate) authenticate();
  }

  Future<TokenModel> authenticate({int loopCountIfError = 3}) async {
    final response = await _authenticate.call(credentials, loopCountIfError);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }

  Future<ResponseModel<AnalisysResponseModel>> analisysRequest(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    final response = await _analisysRequest.call(analysisRequestModel);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }

  Future<ResponseModel<AnalisysResponseModel>> reanalisysRequest(
    AnalisysRequestModel analysisRequestModel,
  ) async {
    final response = await _reanalisysRequest.call(analysisRequestModel);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }

  Future<ResponseModel<ChargebackMarkingResponseModel>> chargebackMarking({
    String message,
    List<String> analisysCode,
  }) async {
    final response = await _chargebackMarking.call(
      message: message,
      analisysCode: analisysCode,
    );
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }

  Future<ResponseModel<OrderModel>> statusConsult(String analysisCode) async {
    final response = await _statusConsult.call(analysisCode);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }

  Future<ResponseModel<MessageModel>> statusUpdate(
    String analysisCode,
    String newStatusCode,
  ) async {
    final response = await _statusUpdate.call(analysisCode, newStatusCode);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }
}
