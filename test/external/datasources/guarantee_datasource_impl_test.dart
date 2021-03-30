import 'package:clearsale/src/domain/models/analysis_response_model.dart';
import 'package:clearsale/src/domain/models/analysis_request_model.dart';
import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';
import 'package:clearsale/src/domain/models/credentials_model.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/models/order_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/models/token_model.dart';
import 'package:clearsale/src/external/datasources/guarantee_datasource_impl.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../responses/status_update_responses.dart' as statusUpdateResponses;
import '../responses/status_consult_responses.dart' as statusConsultResponses;
import '../responses/authenticate_responses.dart' as authenticateResponses;
import '../responses/analysis_request_responses.dart' as analysisRequestResponses;
import '../responses/chargeback_marking_responses.dart' as chargebackMarkingResponses;

class MockClient extends Mock implements Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late GuaranteeDatasourceImpl datasource;
  late MockClient client;
  setUp(() {
    client = MockClient();
    datasource = GuaranteeDatasourceImpl(false, client);
  });

  setUpAll(() {
    registerFallbackValue<Uri>(UriFake());
  });

  var model = AnalysisRequestModel(code: "10", sessionId: "10", email: "10", totalValue: 100.0, billing: BillingModel(primaryDocument: "asd", name: "", phones: []), payments: [], items: []);

  group("Url from ambients", () {
    group("baseUrl", () {
      test("production", () {
        final datasource = GuaranteeDatasourceImpl(true, client);
        expect(datasource.baseUrl, "api.clearsale.com.br");
      });
      test("homologation", () {
        final datasource = GuaranteeDatasourceImpl(false, client);
        expect(datasource.baseUrl, "homologacao.clearsale.com.br");
      });
    });
    group("initialPath", () {
      test("production", () {
        final datasource = GuaranteeDatasourceImpl(true, client);
        expect(datasource.initialPath, "");
      });
      test("homologation", () {
        final datasource = GuaranteeDatasourceImpl(false, client);
        expect(datasource.initialPath, "/api");
      });
    });
  });

  group("statusConsult", () {
    test("success", () async {
      when(() => client.get(any(), headers: any(named: "headers"))).thenAnswer((realInvocation) async => statusConsultResponses.success);
      final response = await datasource.statusConsult("mock-token", "mock-analysisRequestCode");
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: OrderModel(orderCode: "{CODIGO_DO_MEU_PEDIDO}", status: "AMA", score: 99.99),
        ),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () async {
    //   when(() => client.get(any(), headers: any(named: "headers"))).thenAnswer((realInvocation) async => null);
    //   final response = datasource.statusConsult("mock-token", "mock-analysisRequestCode");
    //   expect(response, throwsA(NullDatasourceResponseFailure()));
    // });
  });

  group("statusUpdate", () {
    test("success", () async {
      when(() => client.put(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => statusUpdateResponses.success);

      final response = await datasource.statusUpdate("mock-token", "mock-analysisRequestCode", "APR");
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: MessageModel(status: "OK", message: "Status was changed with success"),
        ),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () async {
    //   when(() => client.put(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => null);
    //   final response = datasource.statusConsult("mock-token", "mock-analysisRequestCode");
    //   expect(
    //     response,
    //     throwsA(NullDatasourceResponseFailure()),
    //   );
    // });
  });

  group("authenticate", () {
    test("success", () async {
      when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => authenticateResponses.success);
      final response = await datasource.authenticate(CredentialsModel("mock-username", "mock-password"));
      expect(
        response,
        TokenModel("1df73594d7ad4224a3cd4aa9f8a5af06", DateTime.parse("2020-10-01T16:13:51.6146331-03:00")),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () async {
    //   when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => null);
    //   final response = datasource.authenticate(CredentialsModel("mock-username", "mock-password"));
    //   expect(
    //     response,
    //     throwsA(NullDatasourceResponseFailure()),
    //   );
    // });
  });
  group("chargebackMarking", () {
    test("success", () async {
      when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((_) async => chargebackMarkingResponses.success);
      final response = await datasource.chargebackMarking(
        "mock-token",
        "mock-message",
        [
          "mock-analysis-code"
        ],
      );
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: ChargebackMarkingResponseModel(orderCode: "{CODIGO_DO_MEU_PEDIDO}", status: "Chargeback done"),
        ),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () {
    //   when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => null);
    //   final response = datasource.chargebackMarking(
    //     "mock-token",
    //     "mock-message",
    //     [
    //       "mock-analysis-code"
    //     ],
    //   );
    //   expect(
    //     response,
    //     throwsA(NullDatasourceResponseFailure()),
    //   );
    // });
  });

  group("analysisRequest", () {
    test("success", () async {
      when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((_) async => analysisRequestResponses.success);
      final response = await datasource.analysisRequest(
        "mock-token",
        // ignore: missing_required_param
        model,
      );
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: AnalysisResponseModel(
            packageID: "4825dc1d-5246-45d3-ba32-d2de9bbff478",
            orders: [
              OrderModel(orderCode: "{CODIGO_DO_MEU_PEDIDO}", status: "NVO"),
            ],
          ),
        ),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () {
    //   when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => null);
    //   final response = datasource.analysisRequest(
    //     "mock-token",
    //     // ignore: missing_required_param
    //     model,
    //   );
    //   expect(response, throwsA(NullDatasourceResponseFailure()));
    // });
  });

  group("reanalysisRequest", () {
    test("success", () async {
      when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((_) async => analysisRequestResponses.success);
      final response = await datasource.reanalysisRequest(
        "mock-token",
        // ignore: missing_required_param
        model,
      );
      expect(
        response,
        ResponseModel(
          requestId: "12J6-11B3-11A7-93C0",
          data: AnalysisResponseModel(
            packageID: "4825dc1d-5246-45d3-ba32-d2de9bbff478",
            orders: [
              OrderModel(orderCode: "{CODIGO_DO_MEU_PEDIDO}", status: "NVO"),
            ],
          ),
        ),
      );
    });
    // Http não retorna null
    // test("NullDatasourceResponseFailure", () {
    //   when(() => client.post(any(), headers: any(named: "headers"), body: any(named: "body"))).thenAnswer((realInvocation) async => Response("", 1));
    //   final response = datasource.reanalysisRequest(
    //     "mock-token",
    //     // ignore: missing_required_param
    //     model,
    //   );
    //   expect(response, throwsA(NullDatasourceResponseFailure()));
    // });
  });
}
