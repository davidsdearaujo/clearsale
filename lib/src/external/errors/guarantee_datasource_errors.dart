import '../../domain/errors/failure.dart';

class NullDatasourceResponseFailure extends Failure {
  NullDatasourceResponseFailure() : super("null-datasource-response");
}
