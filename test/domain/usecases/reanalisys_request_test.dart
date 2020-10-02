import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/analysis_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/reanalysis_request.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  ReanalysisRequest usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = ReanalysisRequest(repository);
  });
  final successMockResponse = ResponseModel(data: AnalysisResponseModel());
  test("success", () async {
    // ignore: missing_required_param
    final requestModel = AnalysisRequestModel();
    when(repository.reanalysisRequest(any))
        .thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(requestModel);
    expect(response | null, successMockResponse);
  });

  group("InvalidFieldFailure", () {
    group("analysisRequestModel", () {
      test("null", () async {
        when(repository.reanalysisRequest(any))
            .thenAnswer((realInvocation) async => right(successMockResponse));
        final response =
            await usecase(null).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestModel"));
      });
    });
  });
}
