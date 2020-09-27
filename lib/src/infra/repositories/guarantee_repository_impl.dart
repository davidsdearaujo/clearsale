import 'package:clearsale/src/domain/errors/repository.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/enums/payment_status_enum.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/infra/datasources/guarantee_datasource.dart';
import 'package:dartz/dartz.dart';

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
            _currentCredentials, _authenticationLoopIfErrorCount);
        _currentToken = authResponse | _currentToken;
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
  Future<Either<Failure, OrderModel>> analisysRequest(
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
  Future<Either<Failure, ChargebackMarkingResponseModel>> chargebackMarking(
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
  Future<Either<Failure, OrderModel>> reanalisysRequest(
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
  Future<Either<Failure, OrderModel>> statusConsult(
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
  Future<Either<Failure, MessageModel>> statusUpdate(
    String analysisRequestCode,
    PaymentStatusEnum status,
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
