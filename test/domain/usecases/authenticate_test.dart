import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/authenticate.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

class CredentialsModelFake extends Fake implements CredentialsModel {}

void main() {
  late MockGaranteeRepository repository;
  late Authenticate usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = Authenticate(repository);
  });
  setUpAll(() {
    registerFallbackValue<CredentialsModel>(CredentialsModelFake());
  });

  final successMockResponse = TokenModel("token", DateTime.now());

  test("success", () async {
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(() => repository.authenticate(any(), any())).thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(mockCredentials, 5);
    expect(response.fold(id, id), successMockResponse);
  });
  test("success loopCountIfError null", () async {
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(() => repository.authenticate(any(), any())).thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(mockCredentials, null);
    expect(response.fold(id, id), successMockResponse);
  });
  test("success loopCountIfError 0", () async {
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(() => repository.authenticate(any(), any())).thenAnswer((realInvocation) async => right(successMockResponse));
    final response = await usecase(mockCredentials, 0);
    expect(response.fold(id, id), successMockResponse);
  });

  group("InvalidFieldFailure", () {
    group("credentials", () {
      test("null", () async {
        when(() => repository.authenticate(any(), any())).thenAnswer((realInvocation) async => right(successMockResponse));
        final response = await usecase(null, 5).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("credentials"));
      });
    });
  });
}
