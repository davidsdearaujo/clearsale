import 'package:clearsale/src/domain/enums/payment_status_enum.dart';
import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/status_update.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  StatusUpdate usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = StatusUpdate(repository);
  });

  final successResponse = MessageModel(status: "ok", message: "success");
  test("success", () async {
    when(repository.statusUpdate(any, any))
        .thenAnswer((realInvocation) async => right(successResponse));
    final response = await usecase("mock-code", PaymentStatusEnum.approved);
    expect(response | null, successResponse);
  });

  group("InvalidFieldFailure", () {
    group("analysisRequestCode", () {
      test("null", () async {
        ;
        when(repository.statusUpdate(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(null, PaymentStatusEnum.approved)
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestCode"));
      });
      test("empty", () async {
        ;
        when(repository.statusUpdate(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase("", PaymentStatusEnum.approved)
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestCode"));
      });
    });
    group("analisysNewStatusCode", () {
      test("null", () async {
        ;
        when(repository.statusUpdate(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase("mock-code", null)
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analisysNewStatusCode"));
      });
    });
  });
}
