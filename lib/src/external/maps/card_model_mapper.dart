import 'dart:convert';

import 'package:clearsale/src/domain/models/card_model.dart';

class CardModelMapper {
  static Map<String, dynamic> toMap(CardModel model) {
    return {
      if (model.number != null) 'number': model.number,
      if (model.hash != null) 'hash': model.hash,
      'bin': model.bin,
      'end': model.end,
      if (model.type != null) 'type': model.type?.toMap(),
      if (model.validityDate != null) 'validityDate': model.validityDate,
      'ownerName': model.ownerName,
      if (model.document != null) 'document': model.document,
      if (model.nsu != null) 'nsu': model.nsu,
    };
  }

  static CardModel fromMap(Map<String, dynamic> map) {
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
    return json.encode(toMap(model));
  }

  static CardModel fromJson(String source) {
    return fromMap(json.decode(source));
  }
}
