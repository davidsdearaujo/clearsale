import 'dart:convert';

import 'package:clearsale/src/domain/models/card_model.dart';

class CardModelMapper {
  static Map<String, dynamic> toMap(CardModel model) {
    if (model == null) return null;
    return {
      'number': model.number,
      'hash': model.hash,
      'bin': model.bin,
      'end': model.end,
      'type': model.type?.toMap(),
      'validityDate': model.validityDate,
      'ownerName': model.ownerName,
      'document': model.document,
      'nsu': model.nsu,
    };
  }

  static CardModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return CardModel(
      number: map['number'],
      hash: map['hash'],
      bin: map['bin'],
      end: map['end'],
      type: CardBrandEnumExtension.fromMap(map['type']),
      validityDate: map['validityDate'],
      ownerName: map['ownerName'],
      document: map['document'],
      nsu: map['nsu'],
    );
  }

  static String toJson(CardModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static CardModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
