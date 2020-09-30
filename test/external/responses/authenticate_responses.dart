import 'package:http/http.dart';

final success = Response(
  """{"Token": "1df73594d7ad4224a3cd4aa9f8a5af06","ExpirationDate": "2020-10-01T16:13:51.6146331-03:00"}""",
  200,
  headers: {
    "Content-Type": "application/json",
    "Request-ID": "12J6-11B3-11A7-93C0",
  },
);
