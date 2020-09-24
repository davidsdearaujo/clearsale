import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';

class Authenticate {
  final GuaranteeRepository _repository;

  Authenticate(this._repository);
  Future<Either<Failure, TokenModel>> call(
    CredentialsModel credentials,
    int loopCountIfError,
  ) async {
    if (credentials == null) {
      return left(InvalidFieldFailure("credentials"));
    }
    return _repository.authenticate(credentials, loopCountIfError ?? 3);
  }
}
