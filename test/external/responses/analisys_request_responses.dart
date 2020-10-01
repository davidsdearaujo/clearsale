import 'package:http/http.dart';

final success = Response(
  """{
  "packageID": "4825dc1d-5246-45d3-ba32-d2de9bbff478",
  "orders": [
    {
      "code": "{CODIGO_DO_MEU_PEDIDO}",
      "status": "NVO",
      "score": null
    }
  ]
}""",
  200,
  headers: {
    "Content-Type": "application/json",
    "Request-ID": "12J6-11B3-11A7-93C0",
  },
);
