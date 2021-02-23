import 'dart:convert';

import 'package:clearsale/src/domain/models/card_model.dart';

class CardModelMapper {
  static Map<String, dynamic> toMap(CardModel model) {
    if (model == null) return null;
    return {
      if (model.number != null) 'number': model.number,
      if (model.hash != null) 'hash': model.hash,
      if (model.bin != null) 'bin': model.bin,
      if (model.end != null) 'end': model.end,
      if (model.type != null) 'type': model.type?.toMap(),
      if (model.validityDate != null) 'validityDate': model.validityDate,
      if (model.ownerName != null) 'ownerName': model.ownerName,
      if (model.document != null) 'document': model.document,
      if (model.nsu != null) 'nsu': model.nsu,
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
