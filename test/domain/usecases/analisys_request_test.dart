import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/analisys_request.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  AnalisysRequest usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = AnalisysRequest(repository);
  });

  test("success", () async {
    final mockResponse = OrderModel();
    // ignore: missing_required_param
    final requestModel = AnalysisRequestModel();
    when(repository.analisysRequest(any, any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase("mock-token", requestModel);
    expect(response | null, mockResponse);
  });

  group("InvalidFieldFailure", () {
    group("token", () {
      test("null", () async {
        final mockResponse = OrderModel();
        when(repository.analisysRequest(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        // ignore: missing_required_param
        final response = await usecase(null, AnalysisRequestModel())
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("token"));
      });
      test("empty", () async {
        final mockResponse = OrderModel();
        when(repository.analisysRequest(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        // ignore: missing_required_param
        final response = await usecase("", AnalysisRequestModel())
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("token"));
      });
    });
    group("analysisRequestModel", () {
      test("null", () async {
        final mockResponse = OrderModel();
        when(repository.analisysRequest(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response = await usecase("mock-token", null)
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestModel"));
      });
    });
  });
}
