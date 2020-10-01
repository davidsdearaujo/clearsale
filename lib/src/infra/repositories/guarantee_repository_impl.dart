import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/repository.dart';
import '../../domain/models/analysis_request_model.dart';
import '../../domain/models/chargeback_marking_response_model.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/message_model.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/response_model.dart';
import '../../domain/models/token_model.dart';
import '../../domain/repositories/guarantee_repository.dart';
import '../datasources/guarantee_datasource.dart';

class GuaranteeRepositoryImpl implements GuaranteeRepository {
  final GuaranteeDatasource _datasource;
  GuaranteeRepositoryImpl(this._datasource) {}

  TokenModel _currentToken;
  CredentialsModel _currentCredentials;
  int _authenticationLoopIfErrorCount;

  Future<void> authenticationResilience() async {
    int authenticationLoopIfErrorIndex = 0;
    do {
      final isNotAuthenticated = _currentToken == null;
      if (isNotAuthenticated) {
        throw AuthenticationRequiredFailure();
      }
      final resilienceExceeded =
          authenticationLoopIfErrorIndex + 1 > _authenticationLoopIfErrorCount;
      if (_currentToken.isExpired) {
        if (resilienceExceeded) {
          throw AuthenticationExpiredFailure();
        }
        authenticationLoopIfErrorIndex += 1;
        final authResponse = await authenticate(
          _currentCredentials,
          _authenticationLoopIfErrorCount,
        );
        _currentToken = authResponse ?? _currentToken;
      }
    } while (_currentToken.isExpired);
  }

  @override
  Future<Either<Failure, TokenModel>> authenticate(
    CredentialsModel credentials,
    int loopIfErrorCount,
  ) async {
    try {
      final response = await _datasource.authenticate(credentials);
      _currentToken = response;
      _currentCredentials = credentials;
      _authenticationLoopIfErrorCount = loopIfErrorCount;
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<AnalisysResponseModel>>> analisysRequest(
    AnalisysRequestModel analisysRequest,
  ) async {
    try {
      await authenticationResilience();
      final response = await _datasource.analisysRequest(
        _currentToken.token,
        analisysRequest,
      );
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<ChargebackMarkingResponseModel>>>
      chargebackMarking(
    String message,
    List<String> analisysCode,
  ) async {
    try {
      await authenticationResilience();
      final response = await _datasource.chargebackMarking(
        _currentToken.token,
        message,
        analisysCode,
      );
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<AnalisysResponseModel>>> reanalisysRequest(
    AnalisysRequestModel analisysRequest,
  ) async {
    try {
      await authenticationResilience();
      final response = await _datasource.reanalisysRequest(
        _currentToken.token,
        analisysRequest,
      );
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<OrderModel>>> statusConsult(
    String analisysNewStatusCode,
  ) async {
    try {
      await authenticationResilience();
      final response = await _datasource.statusConsult(
        _currentToken.token,
        analisysNewStatusCode,
      );
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<MessageModel>>> statusUpdate(
    String analysisRequestCode,
    String status,
  ) async {
    try {
      await authenticationResilience();
      final response = await _datasource.statusUpdate(
        _currentToken.token,
        analysisRequestCode,
        status,
      );
      return right(response);
    } on Failure catch (exception) {
      return left(exception);
    } on Exception catch (exception) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-exception",
        exception,
      ));
    } catch (error) {
      return left(DatasourceExceptionFailure(
        "guarantee-datasource-unexpected-throw",
        Exception(error),
      ));
    }
  }
}
