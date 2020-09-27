import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/status_consult.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  StatusConsult usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = StatusConsult(repository);
  });

  test("success", () async {
    final mockResponse = OrderModel();
    when(repository.statusConsult(any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase("mock-analisys-code");
    expect(response | null, mockResponse);
  });

  group("InvalidFieldFailure", () {
    group("analisysCode", () {
      test("null", () async {
        final mockResponse = OrderModel();
        when(repository.statusConsult(any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response =
            await usecase(null).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analisysCode"));
      });
      test("empty", () async {
        final mockResponse = OrderModel();
        when(repository.statusConsult(any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response =
            await usecase("").then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analisysCode"));
      });
    });
  });
}
