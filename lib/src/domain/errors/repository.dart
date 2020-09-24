import 'failure.dart';

class DatasourceExceptionFailure extends Failure {
  DatasourceExceptionFailure(String code, Exception exception)
      : super(code, innerException: exception);
}

class AuthenticationRequiredFailure extends Failure {
  AuthenticationRequiredFailure()
      : super("authentication-required",
            message: "É necessário autenticar-se para prosseguir.");
}

class AuthenticationExpiredFailure extends Failure {
  AuthenticationExpiredFailure()
      : super("credentials-expired",
            message:
                "Suas credenciais expiraram. Faça novamente o processo de autenticação.");
}
