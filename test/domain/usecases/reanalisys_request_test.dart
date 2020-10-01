import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analisys_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/reanalisys_request.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  ReanalisysRequest usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = ReanalisysRequest(repository);
  });
  final successMockResponse = ResponseModel(data: AnalisysResponseModel());
  test("success", () async {
    // ignore: missing_required_param
    final requestModel = AnalisysRequestModel();
    when(repository.reanalisysRequest(any))
        .thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(requestModel);
    expect(response | null, successMockResponse);
  });

  group("InvalidFieldFailure", () {
    group("analysisRequestModel", () {
      test("null", () async {
        when(repository.reanalisysRequest(any))
            .thenAnswer((realInvocation) async => right(successMockResponse));
        final response =
            await usecase(null).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestModel"));
      });
    });
  });
}
