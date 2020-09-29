import 'package:http/http.dart';

final success = Response(
  """{"status": "OK","message": "Status was changed with success"}""",
  200,
  headers: {
    "Content-Type": "application/json",
    "Request-ID": "12J6-11B3-11A7-93C0",
  },
);
