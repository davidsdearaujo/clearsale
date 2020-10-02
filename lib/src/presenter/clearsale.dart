import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../domain/models/analisys_response_model.dart';
import '../domain/models/analysis_request_model.dart';
import '../domain/models/chargeback_marking_response_model.dart';
import '../domain/models/credentials_model.dart';
import '../domain/models/message_model.dart';
import '../domain/models/response_model.dart';
import '../domain/models/token_model.dart';
import '../domain/usecases/analisys_request.dart';
import '../domain/usecases/authenticate.dart';
import '../domain/usecases/chargeback_marking.dart';
import '../domain/usecases/reanalisys_request.dart';
import '../domain/usecases/status_consult.dart';
import '../domain/usecases/status_update.dart';
import '../external/datasources/guarantee_datasource_impl.dart';
import '../infra/repositories/guarantee_repository_impl.dart';

class ClearSale {
  final CredentialsModel credentials;
  Authenticate _authenticate;
  AnalisysRequest _analisysRequest;
  ReanalisysRequest _reanalisysRequest;
  ChargebackMarking _chargebackMarking;
  StatusConsult _statusConsult;
  StatusUpdate _statusUpdate;

  factory ClearSale({
    @required String userName,
    @required String password,
    bool automaticAuthenticate = true,
  }) {
    assert(userName != null);
    assert(userName != "");
    assert(password != null);
    assert(password != "");
    return ClearSale._(
      CredentialsModel(userName, password),
      automaticAuthenticate,
    );
  }

  factory ClearSale.test({
    @required String userName,
    @required String password,
    bool automaticAuthenticate = true,
    @required Client httpClient,
  }) =>
      ClearSale._(
        CredentialsModel(userName, password),
        automaticAuthenticate,
        httpClient,
      );

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

  ///Importante: Os status de atualização devem ser combinados com a equipe de integração.
  Future<ResponseModel<MessageModel>> statusUpdate(
    String analysisCode,
    String newStatusCode,
  ) async {
    final response = await _statusUpdate.call(analysisCode, newStatusCode);
    if (response.isLeft()) throw response.fold(id, id);
    return response | null;
  }
}
