import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/chargeback_marking.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  late MockGaranteeRepository repository;
  late ChargebackMarking usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = ChargebackMarking(repository);
  });

  final successResponse = ResponseModel(
    data: ChargebackMarkingResponseModel(orderCode: "mock-code"),
  );

  test("success", () async {
    // ignore: missing_required_param
    when(() => repository.chargebackMarking(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
    final response = await usecase(
      message: "mock-message",
      analysisCode: [
        "mock-code"
      ],
    );
    expect(response.fold(id, id), successResponse);
  });

  group("InvalidFieldFailure", () {
    group("message", () {
      // MENSAGEM NÃO PODE SER NULA
      // test("null", () async {
      //   when(() => repository.chargebackMarking(any, any)).thenAnswer((realInvocation) async => right(successResponse));
      //   final response = await usecase(
      //     message: null,
      //     analysisCode: [
      //       "mock-code"
      //     ],
      //   ).then((value) => value.fold(id, id));
      //   expect(response, InvalidFieldFailure("message"));
      // });
      test("empty", () async {
        when(() => repository.chargebackMarking(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: "",
          analysisCode: [
            "mock-code"
          ],
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("message"));
      });
    });
    group("analysisCode", () {
      // Analysis code não pode ser nulo
      // test("null", () async {
      //   when(() => repository.chargebackMarking(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
      //   final response = await usecase(
      //     message: "mock-message",
      //     analysisCode: null,
      //   ).then((value) => value.fold(id, id));
      //   expect(response, InvalidFieldFailure("analysisCode"));
      // });
      test("empty", () async {
        when(() => repository.chargebackMarking(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase(
          message: "mock-message",
          analysisCode: [],
        ).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisCode"));
      });
    });
  });
}
