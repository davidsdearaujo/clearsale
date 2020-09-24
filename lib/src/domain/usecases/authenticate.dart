import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:dartz/dartz.dart';

class Authenticate {
  final GuaranteeRepository _repository;

  Authenticate(this._repository);
  Future<Either<Failure, TokenModel>> call(
    String name,
    String password,
  ) async {
    if (name == null || name.isEmpty) {
      return left(InvalidFieldFailure("name"));
    }
    if (password == null || password.isEmpty) {
      return left(InvalidFieldFailure("password"));
    }
    return _repository.authenticate(name, password);
  }
}
