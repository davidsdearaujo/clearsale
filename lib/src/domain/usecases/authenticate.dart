import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../errors/usecases.dart';
import '../models/credentials_model.dart';
import '../models/response_model.dart';
import '../models/token_model.dart';
import '../repositories/guarantee_repository.dart';

class Authenticate {
  final GuaranteeRepository _repository;

  Authenticate(this._repository);
  Future<Either<Failure, ResponseModel<TokenModel>>> call(
    CredentialsModel credentials,
    int loopCountIfError,
  ) async {
    if (credentials == null) {
      return left(InvalidFieldFailure("credentials"));
    }
    return _repository.authenticate(credentials, loopCountIfError ?? 3);
  }
}
