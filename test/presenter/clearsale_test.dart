import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/presenter/clearsale.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../external/responses/authenticate_responses.dart'
    as authenticateResponses;
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group("constructor", () {
    group("automaticAuthenticate", () {
      test("default value", () {
        final client = MockClient();
        when(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
        );

        verify(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        )).called(1);
      });

      test("true", () {
        final client = MockClient();
        when(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
          automaticAuthenticate: true,
        );

        verify(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        )).called(1);
      });

      test("false", () {
        final client = MockClient();
        when(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
          automaticAuthenticate: false,
        );

        verifyNever(client.post(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        ));
      });
    });
  });
}
