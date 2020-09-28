import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';
import '../../domain/errors/usecases.dart';
import '../../domain/models/credentials_model.dart';
import '../../domain/models/token_model.dart';
import '../../domain/repositories/guarantee_repository.dart';

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
