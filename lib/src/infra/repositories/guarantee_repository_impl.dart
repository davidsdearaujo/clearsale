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
      authenticationLoopIfErrorIndex += 1;
      final isNotAuthenticated = _currentToken == null;
      if (isNotAuthenticated) {
        throw AuthenticationRequiredFailure();
      }
      final resilienceExceeded =
          authenticationLoopIfErrorIndex > _authenticationLoopIfErrorCount;
      if (resilienceExceeded) {
        throw AuthenticationExpiredFailure();
      }
      if (_currentToken.isExpired) {
        final authResponse = await authenticate(
          _currentCredentials,
          _authenticationLoopIfErrorCount,
        );
        _currentToken = authResponse
            .getOrElse(() => ResponseModel(data: _currentToken))
            .data;
      }
    } while (_currentToken.isExpired);
  }

  @override
  Future<Either<Failure, ResponseModel<TokenModel>>> authenticate(
    CredentialsModel credentials,
    int loopIfErrorCount,
  ) async {
    try {
      final response = await _datasource.authenticate(credentials);
      _currentToken = response.data;
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
  Future<Either<Failure, ResponseModel<OrderModel>>> analisysRequest(
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
  Future<Either<Failure, ResponseModel<OrderModel>>> reanalisysRequest(
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
