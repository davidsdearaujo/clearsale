import 'package:clearsale/src/domain/errors/failure.dart';
import 'package:meta/meta.dart';

class EndpointMessageFailure extends Failure {
  final String status;
  EndpointMessageFailure({
    @required String message,
    @required this.status,
  }) : super("endpoint-message-failure", message: message);
}

class EndpointInvalidStatusCodeFailure extends Failure {
  final int statusCode;
  final String body;
  EndpointInvalidStatusCodeFailure({
    @required this.statusCode,
    @required this.body,
  }) : super("endpoint-invalid-statuscode-failure");
}
