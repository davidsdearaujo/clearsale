import 'dart:convert';

import 'package:clearsale/src/domain/models/token_model.dart';

class TokenModelMapper extends TokenModel {
  TokenModelMapper(String token, DateTime expirationDate)
      : super(token, expirationDate);

  Map<String, dynamic> toMap() {
    return {
      if (token != null) 'token': token,
      if (expirationDate != null)
        'expirationDate': expirationDate?.toIso8601String(),
    };
  }

  static TokenModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    map = map.map((key, value) => MapEntry(key.toLowerCase(), value));

    return TokenModel(
      map['token'],
      map['expirationDate'] == null
          ? null
          : DateTime.parse(map['expirationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  static TokenModel fromJson(String source) => fromMap(json.decode(source));
}
