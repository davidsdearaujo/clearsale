import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/authenticate.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  MockGaranteeRepository repository;
  Authenticate usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = Authenticate(repository);
  });

  test("success", () async {
    final mockResponse = TokenModel("token", DateTime.now());
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(repository.authenticate(any, any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase(mockCredentials, 5);
    expect(response | null, mockResponse);
  });
  test("success loopCountIfError null", () async {
    final mockResponse = TokenModel("token", DateTime.now());
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(repository.authenticate(any, any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase(mockCredentials, null);
    expect(response | null, mockResponse);
  });
  test("success loopCountIfError 0", () async {
    final mockResponse = TokenModel("token", DateTime.now());
    final mockCredentials = CredentialsModel("mock-name", "mock-password");
    when(repository.authenticate(any, any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase(mockCredentials, 0);
    expect(response | null, mockResponse);
  });

  group("InvalidFieldFailure", () {
    group("credentials", () {
      test("null", () async {
        final mockResponse = TokenModel("response-token", DateTime.now());
        when(repository.authenticate(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response =
            await usecase(null, 5).then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("credentials"));
      });
    });
  });
}
