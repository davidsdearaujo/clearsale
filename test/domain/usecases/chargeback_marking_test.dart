import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/chargeback_marking.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  ChargebackMarking usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = ChargebackMarking(repository);
  });

  final successResponse = ChargebackMarkingResponseModel(code: "mock-code");

  test("success", () async {
    // ignore: missing_required_param
    when(repository.chargebackMarking(any, any))
        .thenAnswer((realInvocation) async => right(successResponse));
    final response = await usecase(
      message: "mock-message",
      analisysCode: ["mock-code"],
    );
    expect(response | null, successResponse);
  });

  group("InvalidFieldFailure", () {
    group("message", () {
      test("null", () async {
        when(repository.chargebackMarking(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: null,
          analisysCode: ["mock-code"],
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("message"));
      });
      test("empty", () async {
        when(repository.chargebackMarking(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: "",
          analisysCode: ["mock-code"],
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("message"));
      });
    });
    group("analisysCode", () {
      test("null", () async {
        when(repository.chargebackMarking(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: "mock-message",
          analisysCode: null,
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analisysCode"));
      });
      test("empty", () async {
        when(repository.chargebackMarking(any, any))
            .thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: "mock-message",
          analisysCode: [],
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analisysCode"));
      });
    });
  });
}
