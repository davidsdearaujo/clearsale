import 'failure.dart';

class InvalidFieldFailure extends Failure {
  InvalidFieldFailure(String fieldName)
      : super("invalid-field-$fieldName-failure",
            message:
                "É necessário preencher o campo $fieldName para continuar.");
}