import 'package:clearsale/src/domain/errors/repository.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/infra/datasources/guarantee_datasource.dart';
import 'package:clearsale/src/infra/repositories/guarantee_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGuaranteeDatasource extends Mock implements GuaranteeDatasource {}
class MockLoopGuaranteeDatasource extends Mock implements GuaranteeDatasource {
  var count = 0;
  final int maxCount;
  MockLoopGuaranteeDatasource([this.maxCount = 0]);

  @override
  Future<TokenModel> authenticate(CredentialsModel credentials) async {
    bool countExceded = count >= maxCount;
    count++;
    if (countExceded) {
      return TokenModel(
        "response-token",
        DateTime.now().add(Duration(seconds: 10)),
      );
    } else {
      return TokenModel(
        "response-token",
        DateTime.now().subtract(Duration(seconds: 1)),
      );
    }
  }
}

void main() {
  group("token refresh -", () {
    final loopIfErrorCount = 3;
    final credentials = CredentialsModel("mock-username", "mock-password");
    // for (int loopIfErrorCountMock = 1;
    //     loopIfErrorCountMock <= loopIfErrorCount;
    //     loopIfErrorCountMock++)
    // // int loopIfErrorCountMock = 3;
    // {
    //   final datasource = MockLoopGuaranteeDatasource(loopIfErrorCountMock);
    //   GuaranteeRepositoryImpl repository;
    //   setUp(() async {
    //     repository = GuaranteeRepositoryImpl(datasource);
    //   });

    //   test("index $loopIfErrorCountMock", () async {
    //     when(datasource.statusConsult(any, any))
    //         .thenAnswer((realInvocation) async => OrderModel());

    //     await repository.authenticate(credentials, loopIfErrorCount);
    //     final response = await repository.statusConsult("mock-status");
    //     expect(response | null, OrderModel());
    //   });
    // }
    test("success index 0", () async {
      final datasource = MockLoopGuaranteeDatasource(0);
      final repository = GuaranteeRepositoryImpl(datasource);
      when(datasource.statusConsult(any, any))
          .thenAnswer((realInvocation) async => OrderModel());

      await repository.authenticate(credentials, loopIfErrorCount);
      final response = await repository.statusConsult("mock-status");

      // verify(datasource.authenticate(credentials)).called(1);
      expect(response | null, OrderModel());
    });

    test("success index 1", () async {
      final datasource = MockLoopGuaranteeDatasource(1);
      final repository = GuaranteeRepositoryImpl(datasource);
      when(datasource.statusConsult(any, any))
          .thenAnswer((realInvocation) async => OrderModel());

      await repository.authenticate(credentials, loopIfErrorCount);
      final response = await repository.statusConsult("mock-status");
      expect(response | null, OrderModel());
    });

    test("success index 2", () async {
      final datasource = MockLoopGuaranteeDatasource(2);
      final repository = GuaranteeRepositoryImpl(datasource);
      when(datasource.statusConsult(any, any))
          .thenAnswer((realInvocation) async => OrderModel());

      await repository.authenticate(credentials, loopIfErrorCount);
      final response = await repository.statusConsult("mock-status");
      expect(response | null, OrderModel());
    });

    test("success index 3", () async {
      final datasource = MockLoopGuaranteeDatasource(3);
      final repository = GuaranteeRepositoryImpl(datasource);
      when(datasource.statusConsult(any, any))
          .thenAnswer((realInvocation) async => OrderModel());

      await repository.authenticate(credentials, loopIfErrorCount);
      final response = await repository.statusConsult("mock-status");
      expect(response | null, OrderModel());
    });

    test("error index 4", () async {
      final datasource = MockLoopGuaranteeDatasource(4);
      final repository = GuaranteeRepositoryImpl(datasource);
      when(datasource.statusConsult(any, any))
          .thenAnswer((realInvocation) async => OrderModel());

      await repository.authenticate(credentials, loopIfErrorCount);
      final response = await repository.statusConsult("mock-status");
      expect(response.fold(id, id), AuthenticationExpiredFailure());
    });
  });
}
