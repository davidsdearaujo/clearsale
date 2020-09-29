import 'package:http/http.dart';

final success = Response(
  """{"code": "{CODIGO_DO_MEU_PEDIDO}","status": "AMA","score": 99.99}""",
  200,
  headers: {
    "Content-Type": "application/json",
    "Request-ID": "12J6-11B3-11A7-93C0",
  },
);
