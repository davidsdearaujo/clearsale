import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';

class Authenticate {
  final MaplinkRepository _repository;

  Authenticate(this._repository);
  void call() {
    _repository.authenticate();
  }
}
