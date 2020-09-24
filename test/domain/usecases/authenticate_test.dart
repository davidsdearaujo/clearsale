import 'package:clearsale/src/domain/errors/usecases.dart';
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
    when(repository.authenticate(any, any))
        .thenAnswer((realInvocation) async => right(mockResponse));
    final response = await usecase("mock-name", "mock-password");
    expect(response | null, mockResponse);
  });

  group("InvalidFieldFailure", () {
    group("name", () {
      test("null", () async {
        final mockResponse = TokenModel("response-token", DateTime.now());
        when(repository.authenticate(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response = await usecase(null, "mock-password")
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("name"));
      });
      test("empty", () async {
        final mockResponse = TokenModel("response-token", DateTime.now());
        when(repository.authenticate(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response = await usecase("", "mock-password")
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("name"));
      });
    });
    group("password", () {
      test("null", () async {
        final mockResponse = TokenModel("response-token", DateTime.now());
        when(repository.authenticate(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response = await usecase("mock-name", null)
            .then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("password"));
      });
      test("empty", () async {
        final mockResponse = TokenModel("response-token", DateTime.now());
        when(repository.authenticate(any, any))
            .thenAnswer((realInvocation) async => right(mockResponse));
        final response =
            await usecase("mock-name", "").then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("password"));
      });
    });
  });
}
