import 'package:clearsale/src/domain/models/analysis_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/reanalysis_request.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

class AnalysisRequestModelFake extends Fake implements AnalysisRequestModel {}

void main() {
  late MockGaranteeRepository repository;
  late ReanalysisRequest usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = ReanalysisRequest(repository);
  });
  setUpAll(() {
    registerFallbackValue<AnalysisRequestModel>(AnalysisRequestModelFake());
  });
  final successMockResponse = ResponseModel(data: AnalysisResponseModel());
  test("success", () async {
    // ignore: missing_required_param
    final requestModel = AnalysisRequestModelFake();
    when(() => repository.reanalysisRequest(any())).thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(requestModel);
    expect(response.fold(id, id), successMockResponse);
  });

  // Parâmetro não pode ser NULO
  // group("InvalidFieldFailure", () {
  //   group("analysisRequestModel", () {
  //     test("null", () async {
  //       when(() => repository.reanalysisRequest(any())).thenAnswer((realInvocation) async => right(successMockResponse));
  //       final response = await usecase(null).then((value) => value.fold(id, id));
  //       expect(response, InvalidFieldFailure("analysisRequestModel"));
  //     });
  //   });
  // });
}
