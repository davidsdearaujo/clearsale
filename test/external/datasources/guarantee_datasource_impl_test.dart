import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/external/datasources/guarantee_datasource_impl.dart';
import 'package:clearsale/src/external/errors/guarantee_datasource_errors.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../responses/status_update_responses.dart' as statusUpdateResponses;
import '../responses/status_consult_responses.dart' as statusConsultResponses;

class MockClient extends Mock implements Client {}

void main() {
  GuaranteeDatasourceImpl datasource;
  MockClient client;
  setUp(() {
    client = MockClient();
    datasource = GuaranteeDatasourceImpl(client);
  });

  group("statusConsult", () {
    test("success", () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (realInvocation) async => statusConsultResponses.success,
      );
      final response = await datasource.statusConsult(
        "mock-token",
        "mock-analisysRequestCode",
      );
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: OrderModel(
            code: "{CODIGO_DO_MEU_PEDIDO}",
            status: "AMA",
            score: 99.99,
          ),
        ),
      );
    });

    test("NullDatasourceResponseFailure", () async {
      when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
        (realInvocation) async => null,
      );
      final response = datasource.statusConsult(
        "mock-token",
        "mock-analisysRequestCode",
      );
      expect(
        response,
        throwsA(NullDatasourceResponseFailure()),
      );
    });
  });

  group("statusUpdate", () {
    test("success", () async {
      when(
        client.put(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        ),
      ).thenAnswer((realInvocation) async => statusUpdateResponses.success);

      final response = await datasource.statusUpdate(
        "mock-token",
        "mock-analisysRequestCode",
        "APR",
      );
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: MessageModel(
            status: "OK",
            message: "Status was changed with success",
          ),
        ),
      );
    });

    test("NullDatasourceResponseFailure", () async {
      when(
        client.put(
          any,
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        ),
      ).thenAnswer((realInvocation) async => null);
      final response = datasource.statusConsult(
        "mock-token",
        "mock-analisysRequestCode",
      );
      expect(
        response,
        throwsA(NullDatasourceResponseFailure()),
      );
    });
  });
}
