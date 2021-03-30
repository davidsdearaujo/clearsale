import 'package:clearsale/src/presenter/clearsale.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../external/responses/authenticate_responses.dart' as authenticateResponses;

class MockClient extends Mock implements Client {}

class UriFake extends Fake implements Uri {}

void main() {
  setUpAll(() {
    registerFallbackValue<Uri>(UriFake());
  });
  group("constructor", () {
    group("automaticAuthenticate", () {
      test("default value", () {
        final client = MockClient();
        when(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
          isProduction: false,
        );

        verify(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            )).called(1);
      });

      test("true", () {
        final client = MockClient();
        when(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
          automaticAuthenticate: true,
          isProduction: false,
        );

        verify(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            )).called(1);
      });

      test("false", () {
        final client = MockClient();
        when(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            )).thenAnswer((realInvocation) async => authenticateResponses.success);

        ClearSale.test(
          userName: "mock-user",
          password: "mock-password",
          httpClient: client,
          automaticAuthenticate: false,
          isProduction: false,
        );

        verifyNever(() => client.post(
              any(),
              headers: any(named: "headers"),
              body: any(named: "body"),
            ));
      });
    });
  });
}
